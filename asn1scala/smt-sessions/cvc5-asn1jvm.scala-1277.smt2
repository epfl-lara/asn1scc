; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36280 () Bool)

(assert start!36280)

(declare-fun res!139187 () Bool)

(declare-fun e!115960 () Bool)

(assert (=> start!36280 (=> (not res!139187) (not e!115960))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!36280 (= res!139187 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36280 e!115960))

(assert (=> start!36280 true))

(declare-datatypes ((array!8653 0))(
  ( (array!8654 (arr!4765 (Array (_ BitVec 32) (_ BitVec 8))) (size!3844 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6844 0))(
  ( (BitStream!6845 (buf!4296 array!8653) (currentByte!8129 (_ BitVec 32)) (currentBit!8124 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6844)

(declare-fun e!115959 () Bool)

(declare-fun inv!12 (BitStream!6844) Bool)

(assert (=> start!36280 (and (inv!12 thiss!1577) e!115959)))

(declare-fun b!167193 () Bool)

(declare-fun res!139189 () Bool)

(assert (=> b!167193 (=> (not res!139189) (not e!115960))))

(assert (=> b!167193 (= res!139189 (bvsgt (bvadd (currentBit!8124 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167195 () Bool)

(declare-fun array_inv!3585 (array!8653) Bool)

(assert (=> b!167195 (= e!115959 (array_inv!3585 (buf!4296 thiss!1577)))))

(declare-fun b!167194 () Bool)

(assert (=> b!167194 (= e!115960 (not (and (bvsge (currentByte!8129 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8129 thiss!1577) (size!3844 (buf!4296 thiss!1577))))))))

(declare-fun lt!260280 () array!8653)

(declare-fun arrayRangesEq!673 (array!8653 array!8653 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167194 (arrayRangesEq!673 (buf!4296 thiss!1577) lt!260280 #b00000000000000000000000000000000 (currentByte!8129 thiss!1577))))

(declare-fun lt!260288 () array!8653)

(declare-datatypes ((Unit!11636 0))(
  ( (Unit!11637) )
))
(declare-fun lt!260283 () Unit!11636)

(declare-fun arrayRangesEqTransitive!175 (array!8653 array!8653 array!8653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11636)

(assert (=> b!167194 (= lt!260283 (arrayRangesEqTransitive!175 (buf!4296 thiss!1577) lt!260288 lt!260280 #b00000000000000000000000000000000 (currentByte!8129 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8129 thiss!1577))))))

(assert (=> b!167194 (arrayRangesEq!673 lt!260288 lt!260280 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8129 thiss!1577)))))

(declare-fun lt!260286 () Unit!11636)

(declare-fun lt!260285 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!281 (array!8653 (_ BitVec 32) (_ BitVec 8)) Unit!11636)

(assert (=> b!167194 (= lt!260286 (arrayUpdatedAtPrefixLemma!281 lt!260288 (bvadd #b00000000000000000000000000000001 (currentByte!8129 thiss!1577)) lt!260285))))

(declare-fun lt!260284 () (_ BitVec 8))

(assert (=> b!167194 (arrayRangesEq!673 (buf!4296 thiss!1577) (array!8654 (store (arr!4765 (buf!4296 thiss!1577)) (currentByte!8129 thiss!1577) lt!260284) (size!3844 (buf!4296 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8129 thiss!1577))))

(declare-fun lt!260287 () Unit!11636)

(assert (=> b!167194 (= lt!260287 (arrayUpdatedAtPrefixLemma!281 (buf!4296 thiss!1577) (currentByte!8129 thiss!1577) lt!260284))))

(declare-fun lt!260281 () (_ BitVec 32))

(declare-fun lt!260282 () (_ BitVec 32))

(assert (=> b!167194 (= lt!260284 (select (store (store (arr!4765 (buf!4296 thiss!1577)) (currentByte!8129 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4765 (buf!4296 thiss!1577)) (currentByte!8129 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8124 thiss!1577)))))))) (bvlshr (bvand lt!260281 #b00000000000000000000000011111111) lt!260282)))) (bvadd #b00000000000000000000000000000001 (currentByte!8129 thiss!1577)) lt!260285) (currentByte!8129 thiss!1577)))))

(assert (=> b!167194 (= lt!260280 (array!8654 (store (store (arr!4765 (buf!4296 thiss!1577)) (currentByte!8129 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4765 (buf!4296 thiss!1577)) (currentByte!8129 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8124 thiss!1577)))))))) (bvlshr (bvand lt!260281 #b00000000000000000000000011111111) lt!260282)))) (bvadd #b00000000000000000000000000000001 (currentByte!8129 thiss!1577)) lt!260285) (size!3844 (buf!4296 thiss!1577))))))

(declare-fun lt!260289 () (_ BitVec 32))

(assert (=> b!167194 (= lt!260285 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4765 (buf!4296 thiss!1577)) (currentByte!8129 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4765 (buf!4296 thiss!1577)) (currentByte!8129 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8124 thiss!1577)))))))) (bvlshr (bvand lt!260281 #b00000000000000000000000011111111) lt!260282)))) (bvadd #b00000000000000000000000000000001 (currentByte!8129 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260289))) (bvshl lt!260281 lt!260289))))))

(assert (=> b!167194 (= lt!260289 (bvsub #b00000000000000000000000000001000 lt!260282))))

(assert (=> b!167194 (= lt!260288 (array!8654 (store (arr!4765 (buf!4296 thiss!1577)) (currentByte!8129 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4765 (buf!4296 thiss!1577)) (currentByte!8129 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8124 thiss!1577)))))))) (bvlshr (bvand lt!260281 #b00000000000000000000000011111111) lt!260282)))) (size!3844 (buf!4296 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167194 (= lt!260281 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167194 (= lt!260282 (bvsub (bvadd (currentBit!8124 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167192 () Bool)

(declare-fun res!139188 () Bool)

(assert (=> b!167192 (=> (not res!139188) (not e!115960))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167192 (= res!139188 (validate_offset_bits!1 ((_ sign_extend 32) (size!3844 (buf!4296 thiss!1577))) ((_ sign_extend 32) (currentByte!8129 thiss!1577)) ((_ sign_extend 32) (currentBit!8124 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!36280 res!139187) b!167192))

(assert (= (and b!167192 res!139188) b!167193))

(assert (= (and b!167193 res!139189) b!167194))

(assert (= start!36280 b!167195))

(declare-fun m!265895 () Bool)

(assert (=> start!36280 m!265895))

(declare-fun m!265897 () Bool)

(assert (=> b!167195 m!265897))

(declare-fun m!265899 () Bool)

(assert (=> b!167194 m!265899))

(declare-fun m!265901 () Bool)

(assert (=> b!167194 m!265901))

(declare-fun m!265903 () Bool)

(assert (=> b!167194 m!265903))

(declare-fun m!265905 () Bool)

(assert (=> b!167194 m!265905))

(declare-fun m!265907 () Bool)

(assert (=> b!167194 m!265907))

(declare-fun m!265909 () Bool)

(assert (=> b!167194 m!265909))

(declare-fun m!265911 () Bool)

(assert (=> b!167194 m!265911))

(declare-fun m!265913 () Bool)

(assert (=> b!167194 m!265913))

(declare-fun m!265915 () Bool)

(assert (=> b!167194 m!265915))

(declare-fun m!265917 () Bool)

(assert (=> b!167194 m!265917))

(declare-fun m!265919 () Bool)

(assert (=> b!167194 m!265919))

(declare-fun m!265921 () Bool)

(assert (=> b!167194 m!265921))

(declare-fun m!265923 () Bool)

(assert (=> b!167194 m!265923))

(declare-fun m!265925 () Bool)

(assert (=> b!167194 m!265925))

(declare-fun m!265927 () Bool)

(assert (=> b!167194 m!265927))

(declare-fun m!265929 () Bool)

(assert (=> b!167192 m!265929))

(push 1)

(assert (not b!167192))

(assert (not b!167195))

(assert (not b!167194))

(assert (not start!36280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(push 1)

(assert (not b!167192))

