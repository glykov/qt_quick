function starCreated(ctx, step)
{
    ctx.clearRect(0,0,width,height);
    ctx.fillStyle = Qt.rgba(1, 0, 0, 1)
    ctx.beginPath();
    ctx.moveTo( 5 * step, 2 * step);
    ctx.lineTo( 7 * step, 7 * step);
    ctx.lineTo( 2 * step, 4 * step);
    ctx.lineTo( 8 * step, 4 * step);
    ctx.lineTo( 3 * step, 7 * step);
    ctx.lineTo( 5 * step, 2 * step);
    ctx.closePath();
    ctx.stroke();
    ctx.fill();
}

function ringCreated(ctx, step)
{
    ctx.clearRect(0,0,width,height);

    ctx.fillStyle = Qt.rgba(1, 0.84, 0, 0.85);
    ctx.beginPath();
    ctx.arc( 5 * step, 4 * step, 3 * step, 0, Math.PI*2);
    ctx.closePath();
    ctx.stroke();
    ctx.fill();

    ctx.fillStyle = "lightblue";
    ctx.beginPath();
    ctx.arc( 5 * step, 4 * step, 2 * step, 0, Math.PI*2);
    ctx.closePath();
    ctx.stroke();
    ctx.fill();

}

function houseCreated(ctx, step)
{
    ctx.clearRect(0,0,width,height);
    ctx.beginPath();
    //===Сам домик
    ctx.fillStyle = 'lightyellow'
    ctx.moveTo( 2 * step, 3 * step);
    ctx.lineTo( 5 * step, step);
    ctx.lineTo( 8 * step, 3 * step);
    ctx.lineTo( 2 * step, 3 * step);
    ctx.lineTo( 2 * step, 7 * step);
    ctx.lineTo( 8 * step, 7 * step);
    ctx.lineTo( 8 * step, 3 * step);
    ctx.fill();
    //===Окно
    ctx.fillStyle = Qt.rgba (0.68, 0.25, 0.21, 1)
    ctx.moveTo( 4 * step, 4 * step);
    ctx.lineTo( 6 * step, 4 * step);
    ctx.lineTo( 6 * step, 6 * step);
    ctx.lineTo( 4 * step, 6 * step);
    ctx.lineTo( 4 * step, 4 * step);
    ctx.fill()
//    //===Створки в окне
    ctx.moveTo( 5 * step, 4 * step);
    ctx.lineTo( 5 * step, 6 * step);
    ctx.moveTo( 5 * step, 5 * step);
    ctx.lineTo( 6 * step, 5 * step);
    ctx.closePath();
    ctx.stroke();
}


function hourglassCreated(ctx, step)
{
    var lineargradient = ctx.createLinearGradient(3 * step, step, 3 * step, 7 * step);
    lineargradient.addColorStop(0, 'white');
    lineargradient.addColorStop(0.6, 'white');
    lineargradient.addColorStop(0.7, Qt.rgba(0.94, 0.64, 0.37, 1));
    lineargradient.addColorStop(1, Qt.rgba(0.94, 0.64, 0.37, 1));

    ctx.clearRect(0,0,width,height);
    ctx.beginPath();
    ctx.fillStyle = lineargradient;
    ctx.moveTo( 3 * step, step);
    ctx.lineTo( 7 * step, step);
    ctx.lineTo( 5 * step + 5, 4 * step);
    ctx.lineTo( 7 * step, 7 * step);
    ctx.lineTo( 3 * step, 7 * step);
    ctx.lineTo( 5 * step - 5, 4 * step);
    ctx.closePath();
    ctx.stroke();
    ctx.fill();
}
