-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ross
-- Create date: 05/28/2014
-- Description:	Returns Ticket Details
-- =============================================
CREATE PROCEDURE GetTicketDetails 
	-- Parameters for the stored procedure 
	@Departure_Location varchar(10) = NULL OUTPUT, 
	@NameOfGame varchar(40) = NULL OUTPUT,
	@GameDate date = NULL OUTPUT,
	@LocationOfGame varchar(30) = NULL OUTPUT,
	@Departure_Time time(0) = NULL OUTPUT,
	@Arrival_Time time(0) = NULL OUTPUT,
	@CostInEuro smallmoney = NULL OUTPUT,
	@TicketID tinyint = NULL OUTPUT,
	@ThrowIn time (0)= NULL OUTPUT,
	@Quantity int = NULL OUTPUT  
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Statements for procedure here
	
	SELECT @NameOfGame = NameOfGame, @GameDate = GameDate, @Departure_Location = Departure_Location, @LocationOfGame = LocationOfGame, 
	@Departure_Time = Departure_Time, @Arrival_Time = Arrival_Time, @CostInEuro = CostInEuro, @TicketID = TicketID, 
	@ThrowIn = ThrowIn, @Quantity = Quantity
    FROM Games AS GA
    JOIN Ticket_Details AS TD
    ON GA.GameID = TD.GameID
	JOIN Cost as CO
	ON TD.CostID = CO.CostID
    WHERE (NameOfGame = @NameOfGame) AND (Departure_Location = @Departure_Location) AND Quantity > 0

	

END
GO
