-- ATENCIÓN EL SISTEMA ESTA INCOMPLETO, ESTOY VIENDO COMO FUNCIONA GITHUB



-- Variables globales
local casas = {}
local jugadoresPosiciones = {}  -- Guardará la última ubicación de los jugadores

-- Crear una casa en una ubicación específica
function crearCasa(source)
    local x, y, z = getElementPosition(source)
    local casa = createMarker(x + 2, y, z, "cylinder", 1.5, 255, 255, 0, 150)
    local interior = 3  -- ID del interior de la casa
    local intX, intY, intZ = 2496.04, -1692.73, 1014.74  -- Posición dentro de la casa
    
    casas[casa] = {
        interior = {intX, intY, intZ, interior}
    }
    
    addEventHandler("onMarkerHit", casa, entrarCasa)
    outputChatBox("Casa creada. Usa el marcador para entrar.", source, 0, 255, 0)
end
addCommandHandler("crearCasa", crearCasa)

-- Función para entrar a la casa
function entrarCasa(hitElement)
    if getElementType(hitElement) == "player" then
        local casa = casas[source]
        if casa then
            -- Guardar la última ubicación del jugador antes de entrar
            local x, y, z = getElementPosition(hitElement)
            jugadoresPosiciones[hitElement] = {x, y, z, getElementInterior(hitElement)}
            
            setElementInterior(hitElement, casa.interior[4])
            setElementPosition(hitElement, casa.interior[1], casa.interior[2], casa.interior[3])
            outputChatBox("Entraste a la casa.", hitElement, 0, 255, 0)
            
            -- Crear un marcador de salida
            local salida = createMarker(casa.interior[1], casa.interior[2], casa.interior[3] - 1, "cylinder", 1.5, 255, 0, 0, 150)
            casas[salida] = hitElement  -- Guardar referencia al jugador
            addEventHandler("onMarkerHit", salida, salirCasa)
        end
    end
end

-- Función para salir de la casa
function salirCasa(hitElement)
    if getElementType(hitElement) == "player" then
        local pos = jugadoresPosiciones[hitElement]
        if pos then
            setElementInterior(hitElement, pos[4])  -- Restaurar el interior original
            setElementPosition(hitElement, pos[1], pos[2], pos[3])
            jugadoresPosiciones[hitElement] = nil  -- Limpiar datos del jugador
            destroyElement(source)  -- Eliminar el marcador de salida
            outputChatBox("Saliste de la casa.", hitElement, 255, 0, 0)
        end
    end
end
