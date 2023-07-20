--[[
    PlayState Class
    Changes made by: Libo Tan
    at6145@princeton.edu

    Adapted from: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Did you know you have rights? Constitution says you do! Hi I am Saul Goodman', 0, 20, VIRTUAL_WIDTH, 'center')

    -- print different responses based on score count.
    love.graphics.setFont(mediumFont)
    if(self.score > 20) then
        love.graphics.printf('Score: ' .. tostring(self.score) , 0, 
            120, VIRTUAL_WIDTH, 'center') 
        love.graphics.printf('You got an theoretical gold medal!', 0, 
            140, VIRTUAL_WIDTH, 'center') 
    elseif(self.score < 21 and self.score > 10) then
        love.graphics.printf('Score: ' .. tostring(self.score) , 0, 
            120, VIRTUAL_WIDTH, 'center') 
        love.graphics.printf('Not bad! You beat Philip\'s\' high score!', 0, 
            140, VIRTUAL_WIDTH, 'center') 
    else
        love.graphics.printf('Score: ' .. tostring(self.score) , 0, 
            120, VIRTUAL_WIDTH, 'center') 
        love.graphics.printf('...', 0, 
            140, VIRTUAL_WIDTH, 'center') 
    end
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end