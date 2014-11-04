USE [C:\GAADB\GAA_GAMES.MDF]
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuantities]    Script Date: 03/06/2014 00:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ross Loftus
-- Create date: 30/05/2014
-- Description:	Quantities
-- =============================================
ALTER PROCEDURE [dbo].[UpdateQuantities] 
	-- Add the parameters for the stored procedure here
	@Quantity int, 
	@TicketID int
AS

    -- Insert statements for procedure here
UPDATE Ticket_Details SET Quantity = @Quantity
WHERE TicketID = @TicketID 

