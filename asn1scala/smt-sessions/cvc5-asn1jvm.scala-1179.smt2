; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33390 () Bool)

(assert start!33390)

(declare-fun res!134129 () Bool)

(declare-fun e!110577 () Bool)

(assert (=> start!33390 (=> (not res!134129) (not e!110577))))

(declare-datatypes ((array!7895 0))(
  ( (array!7896 (arr!4471 (Array (_ BitVec 32) (_ BitVec 8))) (size!3550 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6268 0))(
  ( (BitStream!6269 (buf!4008 array!7895) (currentByte!7445 (_ BitVec 32)) (currentBit!7440 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6268)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33390 (= res!134129 (validate_offset_byte!0 ((_ sign_extend 32) (size!3550 (buf!4008 thiss!1602))) ((_ sign_extend 32) (currentByte!7445 thiss!1602)) ((_ sign_extend 32) (currentBit!7440 thiss!1602))))))

(assert (=> start!33390 e!110577))

(declare-fun e!110580 () Bool)

(declare-fun inv!12 (BitStream!6268) Bool)

(assert (=> start!33390 (and (inv!12 thiss!1602) e!110580)))

(assert (=> start!33390 true))

(declare-fun b!160912 () Bool)

(declare-datatypes ((Unit!10970 0))(
  ( (Unit!10971) )
))
(declare-datatypes ((tuple3!828 0))(
  ( (tuple3!829 (_1!7765 Unit!10970) (_2!7765 (_ BitVec 8)) (_3!531 BitStream!6268)) )
))
(declare-fun lt!253286 () tuple3!828)

(assert (=> b!160912 (= e!110577 (not (or (= (bvand (currentByte!7445 (_3!531 lt!253286)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7445 (_3!531 lt!253286)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7445 (_3!531 lt!253286)) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253281 () (_ BitVec 32))

(declare-fun lt!253284 () array!7895)

(declare-fun lt!253282 () (_ BitVec 8))

(declare-fun lt!253287 () (_ BitVec 8))

(declare-fun lt!253280 () (_ BitVec 32))

(declare-fun lt!253285 () (_ BitVec 8))

(declare-fun lt!253283 () (_ BitVec 32))

(declare-fun Unit!10972 () Unit!10970)

(declare-fun Unit!10973 () Unit!10970)

(assert (=> b!160912 (= lt!253286 (ite (bvsgt lt!253281 #b00000000000000000000000000000000) (let ((bdg!9543 ((_ extract 7 0) (bvnot lt!253283)))) (let ((bdg!9544 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4471 (buf!4008 thiss!1602)) (currentByte!7445 thiss!1602) lt!253285) (currentByte!7445 thiss!1602) lt!253287) (bvadd #b00000000000000000000000000000001 (currentByte!7445 thiss!1602)))) ((_ sign_extend 24) bdg!9543))))) (tuple3!829 Unit!10972 bdg!9543 (BitStream!6269 (array!7896 (store (arr!4471 (array!7896 (store (arr!4471 lt!253284) (bvadd #b00000000000000000000000000000001 (currentByte!7445 thiss!1602)) bdg!9544) (size!3550 lt!253284))) (bvadd #b00000000000000000000000000000001 (currentByte!7445 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9544) (bvshl ((_ sign_extend 24) v!222) lt!253280)))) (size!3550 (array!7896 (store (arr!4471 lt!253284) (bvadd #b00000000000000000000000000000001 (currentByte!7445 thiss!1602)) bdg!9544) (size!3550 lt!253284)))) (bvadd #b00000000000000000000000000000001 (currentByte!7445 thiss!1602)) (currentBit!7440 thiss!1602))))) (tuple3!829 Unit!10973 lt!253282 (BitStream!6269 lt!253284 (bvadd #b00000000000000000000000000000001 (currentByte!7445 thiss!1602)) (currentBit!7440 thiss!1602)))))))

(declare-fun e!110579 () Bool)

(assert (=> b!160912 e!110579))

(declare-fun res!134128 () Bool)

(assert (=> b!160912 (=> res!134128 e!110579)))

(assert (=> b!160912 (= res!134128 (bvsge (currentByte!7445 thiss!1602) (size!3550 (buf!4008 thiss!1602))))))

(assert (=> b!160912 (= lt!253284 (array!7896 (store (store (arr!4471 (buf!4008 thiss!1602)) (currentByte!7445 thiss!1602) lt!253285) (currentByte!7445 thiss!1602) lt!253287) (size!3550 (buf!4008 thiss!1602))))))

(assert (=> b!160912 (= lt!253287 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253285) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253281))))))

(assert (=> b!160912 (= lt!253285 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4471 (buf!4008 thiss!1602)) (currentByte!7445 thiss!1602))) lt!253283)))))

(assert (=> b!160912 (= lt!253283 ((_ sign_extend 24) lt!253282))))

(assert (=> b!160912 (= lt!253282 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253280)))))))

(assert (=> b!160912 (= lt!253280 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253281))))))

(assert (=> b!160912 (= lt!253281 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7440 thiss!1602))))))

(declare-fun b!160913 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160913 (= e!110579 (byteRangesEq!0 (select (arr!4471 (buf!4008 thiss!1602)) (currentByte!7445 thiss!1602)) lt!253287 #b00000000000000000000000000000000 (currentBit!7440 thiss!1602)))))

(declare-fun b!160914 () Bool)

(declare-fun array_inv!3297 (array!7895) Bool)

(assert (=> b!160914 (= e!110580 (array_inv!3297 (buf!4008 thiss!1602)))))

(assert (= (and start!33390 res!134129) b!160912))

(assert (= (and b!160912 (not res!134128)) b!160913))

(assert (= start!33390 b!160914))

(declare-fun m!254323 () Bool)

(assert (=> start!33390 m!254323))

(declare-fun m!254325 () Bool)

(assert (=> start!33390 m!254325))

(declare-fun m!254327 () Bool)

(assert (=> b!160912 m!254327))

(declare-fun m!254329 () Bool)

(assert (=> b!160912 m!254329))

(declare-fun m!254331 () Bool)

(assert (=> b!160912 m!254331))

(declare-fun m!254333 () Bool)

(assert (=> b!160912 m!254333))

(declare-fun m!254335 () Bool)

(assert (=> b!160912 m!254335))

(declare-fun m!254337 () Bool)

(assert (=> b!160912 m!254337))

(declare-fun m!254339 () Bool)

(assert (=> b!160912 m!254339))

(assert (=> b!160913 m!254339))

(assert (=> b!160913 m!254339))

(declare-fun m!254341 () Bool)

(assert (=> b!160913 m!254341))

(declare-fun m!254343 () Bool)

(assert (=> b!160914 m!254343))

(push 1)

(assert (not b!160914))

(assert (not b!160913))

(assert (not start!33390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54813 () Bool)

(assert (=> d!54813 (= (array_inv!3297 (buf!4008 thiss!1602)) (bvsge (size!3550 (buf!4008 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160914 d!54813))

(declare-fun d!54815 () Bool)

(assert (=> d!54815 (= (byteRangesEq!0 (select (arr!4471 (buf!4008 thiss!1602)) (currentByte!7445 thiss!1602)) lt!253287 #b00000000000000000000000000000000 (currentBit!7440 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7440 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4471 (buf!4008 thiss!1602)) (currentByte!7445 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7440 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253287) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7440 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13639 () Bool)

(assert (= bs!13639 d!54815))

(declare-fun m!254397 () Bool)

(assert (=> bs!13639 m!254397))

(declare-fun m!254399 () Bool)

(assert (=> bs!13639 m!254399))

(assert (=> b!160913 d!54815))

(declare-fun d!54825 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54825 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3550 (buf!4008 thiss!1602))) ((_ sign_extend 32) (currentByte!7445 thiss!1602)) ((_ sign_extend 32) (currentBit!7440 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3550 (buf!4008 thiss!1602))) ((_ sign_extend 32) (currentByte!7445 thiss!1602)) ((_ sign_extend 32) (currentBit!7440 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13640 () Bool)

(assert (= bs!13640 d!54825))

(declare-fun m!254401 () Bool)

(assert (=> bs!13640 m!254401))

(assert (=> start!33390 d!54825))

(declare-fun d!54827 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54827 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7440 thiss!1602) (currentByte!7445 thiss!1602) (size!3550 (buf!4008 thiss!1602))))))

(declare-fun bs!13641 () Bool)

(assert (= bs!13641 d!54827))

(declare-fun m!254403 () Bool)

(assert (=> bs!13641 m!254403))

(assert (=> start!33390 d!54827))

(push 1)

(assert (not d!54825))

(assert (not d!54827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

