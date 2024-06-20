; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32066 () Bool)

(assert start!32066)

(declare-fun res!132578 () Bool)

(declare-fun e!108224 () Bool)

(assert (=> start!32066 (=> (not res!132578) (not e!108224))))

(declare-datatypes ((array!7503 0))(
  ( (array!7504 (arr!4320 (Array (_ BitVec 32) (_ BitVec 8))) (size!3399 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5966 0))(
  ( (BitStream!5967 (buf!3857 array!7503) (currentByte!7080 (_ BitVec 32)) (currentBit!7075 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5966)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32066 (= res!132578 (validate_offset_byte!0 ((_ sign_extend 32) (size!3399 (buf!3857 thiss!1602))) ((_ sign_extend 32) (currentByte!7080 thiss!1602)) ((_ sign_extend 32) (currentBit!7075 thiss!1602))))))

(assert (=> start!32066 e!108224))

(declare-fun e!108223 () Bool)

(declare-fun inv!12 (BitStream!5966) Bool)

(assert (=> start!32066 (and (inv!12 thiss!1602) e!108223)))

(assert (=> start!32066 true))

(declare-fun b!158818 () Bool)

(declare-datatypes ((Unit!10687 0))(
  ( (Unit!10688) )
))
(declare-datatypes ((tuple3!700 0))(
  ( (tuple3!701 (_1!7698 Unit!10687) (_2!7698 (_ BitVec 8)) (_3!467 BitStream!5966)) )
))
(declare-fun lt!250331 () tuple3!700)

(assert (=> b!158818 (= e!108224 (not (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7080 (_3!467 lt!250331)) #b00000000000000000000000000000001))))))

(declare-fun lt!250327 () (_ BitVec 8))

(declare-fun arrayRangesEq!450 (array!7503 array!7503 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158818 (arrayRangesEq!450 (buf!3857 thiss!1602) (array!7504 (store (arr!4320 (buf!3857 thiss!1602)) (bvsub (currentByte!7080 (_3!467 lt!250331)) #b00000000000000000000000000000001) lt!250327) (size!3399 (buf!3857 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7080 (_3!467 lt!250331)) #b00000000000000000000000000000001))))

(declare-fun lt!250329 () Unit!10687)

(declare-fun arrayUpdatedAtPrefixLemma!58 (array!7503 (_ BitVec 32) (_ BitVec 8)) Unit!10687)

(assert (=> b!158818 (= lt!250329 (arrayUpdatedAtPrefixLemma!58 (buf!3857 thiss!1602) (bvsub (currentByte!7080 (_3!467 lt!250331)) #b00000000000000000000000000000001) lt!250327))))

(assert (=> b!158818 (= lt!250327 (select (arr!4320 (buf!3857 (_3!467 lt!250331))) (bvsub (currentByte!7080 (_3!467 lt!250331)) #b00000000000000000000000000000001)))))

(declare-fun lt!250328 () (_ BitVec 8))

(declare-fun lt!250330 () array!7503)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250332 () (_ BitVec 32))

(declare-fun lt!250334 () (_ BitVec 8))

(declare-fun lt!250326 () (_ BitVec 32))

(declare-fun lt!250335 () (_ BitVec 8))

(declare-fun lt!250333 () (_ BitVec 32))

(declare-fun Unit!10689 () Unit!10687)

(declare-fun Unit!10690 () Unit!10687)

(assert (=> b!158818 (= lt!250331 (ite (bvsgt lt!250326 #b00000000000000000000000000000000) (let ((bdg!9204 ((_ extract 7 0) (bvnot lt!250333)))) (let ((bdg!9205 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4320 (buf!3857 thiss!1602)) (currentByte!7080 thiss!1602) lt!250328) (currentByte!7080 thiss!1602) lt!250335) (bvadd #b00000000000000000000000000000001 (currentByte!7080 thiss!1602)))) ((_ sign_extend 24) bdg!9204))))) (tuple3!701 Unit!10689 bdg!9204 (BitStream!5967 (array!7504 (store (arr!4320 (array!7504 (store (arr!4320 lt!250330) (bvadd #b00000000000000000000000000000001 (currentByte!7080 thiss!1602)) bdg!9205) (size!3399 lt!250330))) (bvadd #b00000000000000000000000000000001 (currentByte!7080 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9205) (bvshl ((_ sign_extend 24) v!222) lt!250332)))) (size!3399 (array!7504 (store (arr!4320 lt!250330) (bvadd #b00000000000000000000000000000001 (currentByte!7080 thiss!1602)) bdg!9205) (size!3399 lt!250330)))) (bvadd #b00000000000000000000000000000001 (currentByte!7080 thiss!1602)) (currentBit!7075 thiss!1602))))) (tuple3!701 Unit!10690 lt!250334 (BitStream!5967 lt!250330 (bvadd #b00000000000000000000000000000001 (currentByte!7080 thiss!1602)) (currentBit!7075 thiss!1602)))))))

(declare-fun e!108225 () Bool)

(assert (=> b!158818 e!108225))

(declare-fun res!132577 () Bool)

(assert (=> b!158818 (=> res!132577 e!108225)))

(assert (=> b!158818 (= res!132577 (bvsge (currentByte!7080 thiss!1602) (size!3399 (buf!3857 thiss!1602))))))

(assert (=> b!158818 (= lt!250330 (array!7504 (store (store (arr!4320 (buf!3857 thiss!1602)) (currentByte!7080 thiss!1602) lt!250328) (currentByte!7080 thiss!1602) lt!250335) (size!3399 (buf!3857 thiss!1602))))))

(assert (=> b!158818 (= lt!250335 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250328) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250326))))))

(assert (=> b!158818 (= lt!250328 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4320 (buf!3857 thiss!1602)) (currentByte!7080 thiss!1602))) lt!250333)))))

(assert (=> b!158818 (= lt!250333 ((_ sign_extend 24) lt!250334))))

(assert (=> b!158818 (= lt!250334 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250332)))))))

(assert (=> b!158818 (= lt!250332 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250326))))))

(assert (=> b!158818 (= lt!250326 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7075 thiss!1602))))))

(declare-fun b!158819 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158819 (= e!108225 (byteRangesEq!0 (select (arr!4320 (buf!3857 thiss!1602)) (currentByte!7080 thiss!1602)) lt!250335 #b00000000000000000000000000000000 (currentBit!7075 thiss!1602)))))

(declare-fun b!158820 () Bool)

(declare-fun array_inv!3146 (array!7503) Bool)

(assert (=> b!158820 (= e!108223 (array_inv!3146 (buf!3857 thiss!1602)))))

(assert (= (and start!32066 res!132578) b!158818))

(assert (= (and b!158818 (not res!132577)) b!158819))

(assert (= start!32066 b!158820))

(declare-fun m!249445 () Bool)

(assert (=> start!32066 m!249445))

(declare-fun m!249447 () Bool)

(assert (=> start!32066 m!249447))

(declare-fun m!249449 () Bool)

(assert (=> b!158818 m!249449))

(declare-fun m!249451 () Bool)

(assert (=> b!158818 m!249451))

(declare-fun m!249453 () Bool)

(assert (=> b!158818 m!249453))

(declare-fun m!249455 () Bool)

(assert (=> b!158818 m!249455))

(declare-fun m!249457 () Bool)

(assert (=> b!158818 m!249457))

(declare-fun m!249459 () Bool)

(assert (=> b!158818 m!249459))

(declare-fun m!249461 () Bool)

(assert (=> b!158818 m!249461))

(declare-fun m!249463 () Bool)

(assert (=> b!158818 m!249463))

(declare-fun m!249465 () Bool)

(assert (=> b!158818 m!249465))

(declare-fun m!249467 () Bool)

(assert (=> b!158818 m!249467))

(declare-fun m!249469 () Bool)

(assert (=> b!158818 m!249469))

(assert (=> b!158819 m!249459))

(assert (=> b!158819 m!249459))

(declare-fun m!249471 () Bool)

(assert (=> b!158819 m!249471))

(declare-fun m!249473 () Bool)

(assert (=> b!158820 m!249473))

(push 1)

(assert (not b!158819))

(assert (not b!158818))

(assert (not start!32066))

(assert (not b!158820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

