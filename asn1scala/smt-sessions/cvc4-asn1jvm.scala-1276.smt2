; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36258 () Bool)

(assert start!36258)

(declare-fun b!167167 () Bool)

(declare-fun res!139165 () Bool)

(declare-fun e!115937 () Bool)

(assert (=> b!167167 (=> (not res!139165) (not e!115937))))

(declare-datatypes ((array!8649 0))(
  ( (array!8650 (arr!4764 (Array (_ BitVec 32) (_ BitVec 8))) (size!3843 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6842 0))(
  ( (BitStream!6843 (buf!4295 array!8649) (currentByte!8125 (_ BitVec 32)) (currentBit!8120 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6842)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167167 (= res!139165 (bvsgt (bvadd (currentBit!8120 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167169 () Bool)

(declare-fun e!115936 () Bool)

(declare-fun array_inv!3584 (array!8649) Bool)

(assert (=> b!167169 (= e!115936 (array_inv!3584 (buf!4295 thiss!1577)))))

(declare-fun b!167168 () Bool)

(assert (=> b!167168 (= e!115937 (not (and (bvsge (currentByte!8125 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8125 thiss!1577) (size!3843 (buf!4295 thiss!1577))))))))

(declare-fun lt!260247 () array!8649)

(declare-fun arrayRangesEq!672 (array!8649 array!8649 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167168 (arrayRangesEq!672 (buf!4295 thiss!1577) lt!260247 #b00000000000000000000000000000000 (currentByte!8125 thiss!1577))))

(declare-fun lt!260249 () array!8649)

(declare-datatypes ((Unit!11634 0))(
  ( (Unit!11635) )
))
(declare-fun lt!260250 () Unit!11634)

(declare-fun arrayRangesEqTransitive!174 (array!8649 array!8649 array!8649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11634)

(assert (=> b!167168 (= lt!260250 (arrayRangesEqTransitive!174 (buf!4295 thiss!1577) lt!260249 lt!260247 #b00000000000000000000000000000000 (currentByte!8125 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8125 thiss!1577))))))

(assert (=> b!167168 (arrayRangesEq!672 lt!260249 lt!260247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8125 thiss!1577)))))

(declare-fun lt!260245 () Unit!11634)

(declare-fun lt!260243 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!280 (array!8649 (_ BitVec 32) (_ BitVec 8)) Unit!11634)

(assert (=> b!167168 (= lt!260245 (arrayUpdatedAtPrefixLemma!280 lt!260249 (bvadd #b00000000000000000000000000000001 (currentByte!8125 thiss!1577)) lt!260243))))

(declare-fun lt!260251 () (_ BitVec 8))

(assert (=> b!167168 (arrayRangesEq!672 (buf!4295 thiss!1577) (array!8650 (store (arr!4764 (buf!4295 thiss!1577)) (currentByte!8125 thiss!1577) lt!260251) (size!3843 (buf!4295 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8125 thiss!1577))))

(declare-fun lt!260246 () Unit!11634)

(assert (=> b!167168 (= lt!260246 (arrayUpdatedAtPrefixLemma!280 (buf!4295 thiss!1577) (currentByte!8125 thiss!1577) lt!260251))))

(declare-fun lt!260244 () (_ BitVec 32))

(declare-fun lt!260248 () (_ BitVec 32))

(assert (=> b!167168 (= lt!260251 (select (store (store (arr!4764 (buf!4295 thiss!1577)) (currentByte!8125 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4764 (buf!4295 thiss!1577)) (currentByte!8125 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8120 thiss!1577)))))))) (bvlshr (bvand lt!260244 #b00000000000000000000000011111111) lt!260248)))) (bvadd #b00000000000000000000000000000001 (currentByte!8125 thiss!1577)) lt!260243) (currentByte!8125 thiss!1577)))))

(assert (=> b!167168 (= lt!260247 (array!8650 (store (store (arr!4764 (buf!4295 thiss!1577)) (currentByte!8125 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4764 (buf!4295 thiss!1577)) (currentByte!8125 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8120 thiss!1577)))))))) (bvlshr (bvand lt!260244 #b00000000000000000000000011111111) lt!260248)))) (bvadd #b00000000000000000000000000000001 (currentByte!8125 thiss!1577)) lt!260243) (size!3843 (buf!4295 thiss!1577))))))

(declare-fun lt!260252 () (_ BitVec 32))

(assert (=> b!167168 (= lt!260243 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4764 (buf!4295 thiss!1577)) (currentByte!8125 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4764 (buf!4295 thiss!1577)) (currentByte!8125 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8120 thiss!1577)))))))) (bvlshr (bvand lt!260244 #b00000000000000000000000011111111) lt!260248)))) (bvadd #b00000000000000000000000000000001 (currentByte!8125 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260252))) (bvshl lt!260244 lt!260252))))))

(assert (=> b!167168 (= lt!260252 (bvsub #b00000000000000000000000000001000 lt!260248))))

(assert (=> b!167168 (= lt!260249 (array!8650 (store (arr!4764 (buf!4295 thiss!1577)) (currentByte!8125 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4764 (buf!4295 thiss!1577)) (currentByte!8125 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8120 thiss!1577)))))))) (bvlshr (bvand lt!260244 #b00000000000000000000000011111111) lt!260248)))) (size!3843 (buf!4295 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167168 (= lt!260244 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167168 (= lt!260248 (bvsub (bvadd (currentBit!8120 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167166 () Bool)

(declare-fun res!139166 () Bool)

(assert (=> b!167166 (=> (not res!139166) (not e!115937))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167166 (= res!139166 (validate_offset_bits!1 ((_ sign_extend 32) (size!3843 (buf!4295 thiss!1577))) ((_ sign_extend 32) (currentByte!8125 thiss!1577)) ((_ sign_extend 32) (currentBit!8120 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!139164 () Bool)

(assert (=> start!36258 (=> (not res!139164) (not e!115937))))

(assert (=> start!36258 (= res!139164 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36258 e!115937))

(assert (=> start!36258 true))

(declare-fun inv!12 (BitStream!6842) Bool)

(assert (=> start!36258 (and (inv!12 thiss!1577) e!115936)))

(assert (= (and start!36258 res!139164) b!167166))

(assert (= (and b!167166 res!139166) b!167167))

(assert (= (and b!167167 res!139165) b!167168))

(assert (= start!36258 b!167169))

(declare-fun m!265829 () Bool)

(assert (=> b!167169 m!265829))

(declare-fun m!265831 () Bool)

(assert (=> b!167168 m!265831))

(declare-fun m!265833 () Bool)

(assert (=> b!167168 m!265833))

(declare-fun m!265835 () Bool)

(assert (=> b!167168 m!265835))

(declare-fun m!265837 () Bool)

(assert (=> b!167168 m!265837))

(declare-fun m!265839 () Bool)

(assert (=> b!167168 m!265839))

(declare-fun m!265841 () Bool)

(assert (=> b!167168 m!265841))

(declare-fun m!265843 () Bool)

(assert (=> b!167168 m!265843))

(declare-fun m!265845 () Bool)

(assert (=> b!167168 m!265845))

(declare-fun m!265847 () Bool)

(assert (=> b!167168 m!265847))

(declare-fun m!265849 () Bool)

(assert (=> b!167168 m!265849))

(declare-fun m!265851 () Bool)

(assert (=> b!167168 m!265851))

(declare-fun m!265853 () Bool)

(assert (=> b!167168 m!265853))

(declare-fun m!265855 () Bool)

(assert (=> b!167168 m!265855))

(declare-fun m!265857 () Bool)

(assert (=> b!167168 m!265857))

(declare-fun m!265859 () Bool)

(assert (=> b!167168 m!265859))

(declare-fun m!265861 () Bool)

(assert (=> b!167166 m!265861))

(declare-fun m!265863 () Bool)

(assert (=> start!36258 m!265863))

(push 1)

(assert (not b!167169))

(assert (not b!167166))

(assert (not start!36258))

(assert (not b!167168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

