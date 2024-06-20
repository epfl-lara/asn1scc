; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33704 () Bool)

(assert start!33704)

(declare-fun b!161316 () Bool)

(declare-fun e!111035 () Bool)

(declare-datatypes ((array!7961 0))(
  ( (array!7962 (arr!4494 (Array (_ BitVec 32) (_ BitVec 8))) (size!3573 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6314 0))(
  ( (BitStream!6315 (buf!4031 array!7961) (currentByte!7514 (_ BitVec 32)) (currentBit!7509 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6314)

(declare-fun array_inv!3320 (array!7961) Bool)

(assert (=> b!161316 (= e!111035 (array_inv!3320 (buf!4031 thiss!1602)))))

(declare-fun b!161317 () Bool)

(declare-fun e!111037 () Bool)

(declare-fun e!111033 () Bool)

(assert (=> b!161317 (= e!111037 (not e!111033))))

(declare-fun res!134463 () Bool)

(assert (=> b!161317 (=> res!134463 e!111033)))

(declare-fun lt!253978 () array!7961)

(declare-datatypes ((Unit!11062 0))(
  ( (Unit!11063) )
))
(declare-datatypes ((tuple3!874 0))(
  ( (tuple3!875 (_1!7788 Unit!11062) (_2!7788 (_ BitVec 8)) (_3!554 BitStream!6314)) )
))
(declare-fun lt!253979 () tuple3!874)

(declare-fun arrayRangesEq!525 (array!7961 array!7961 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161317 (= res!134463 (not (arrayRangesEq!525 (buf!4031 thiss!1602) lt!253978 #b00000000000000000000000000000000 (bvsub (currentByte!7514 (_3!554 lt!253979)) #b00000000000000000000000000000001))))))

(declare-fun lt!253972 () (_ BitVec 8))

(assert (=> b!161317 (arrayRangesEq!525 (buf!4031 thiss!1602) (array!7962 (store (arr!4494 (buf!4031 thiss!1602)) (bvsub (currentByte!7514 (_3!554 lt!253979)) #b00000000000000000000000000000001) lt!253972) (size!3573 (buf!4031 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7514 (_3!554 lt!253979)) #b00000000000000000000000000000001))))

(declare-fun lt!253982 () Unit!11062)

(declare-fun arrayUpdatedAtPrefixLemma!133 (array!7961 (_ BitVec 32) (_ BitVec 8)) Unit!11062)

(assert (=> b!161317 (= lt!253982 (arrayUpdatedAtPrefixLemma!133 (buf!4031 thiss!1602) (bvsub (currentByte!7514 (_3!554 lt!253979)) #b00000000000000000000000000000001) lt!253972))))

(assert (=> b!161317 (= lt!253972 (select (arr!4494 (buf!4031 (_3!554 lt!253979))) (bvsub (currentByte!7514 (_3!554 lt!253979)) #b00000000000000000000000000000001)))))

(declare-fun lt!253980 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253977 () (_ BitVec 32))

(declare-fun lt!253976 () (_ BitVec 8))

(declare-fun lt!253975 () (_ BitVec 8))

(declare-fun lt!253973 () (_ BitVec 32))

(declare-fun lt!253974 () (_ BitVec 32))

(declare-fun Unit!11064 () Unit!11062)

(declare-fun Unit!11065 () Unit!11062)

(assert (=> b!161317 (= lt!253979 (ite (bvsgt lt!253974 #b00000000000000000000000000000000) (let ((bdg!9622 ((_ extract 7 0) (bvnot lt!253977)))) (let ((bdg!9623 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4494 (buf!4031 thiss!1602)) (currentByte!7514 thiss!1602) lt!253980) (currentByte!7514 thiss!1602) lt!253975) (bvadd #b00000000000000000000000000000001 (currentByte!7514 thiss!1602)))) ((_ sign_extend 24) bdg!9622))))) (tuple3!875 Unit!11064 bdg!9622 (BitStream!6315 (array!7962 (store (arr!4494 (array!7962 (store (arr!4494 lt!253978) (bvadd #b00000000000000000000000000000001 (currentByte!7514 thiss!1602)) bdg!9623) (size!3573 lt!253978))) (bvadd #b00000000000000000000000000000001 (currentByte!7514 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9623) (bvshl ((_ sign_extend 24) v!222) lt!253973)))) (size!3573 (array!7962 (store (arr!4494 lt!253978) (bvadd #b00000000000000000000000000000001 (currentByte!7514 thiss!1602)) bdg!9623) (size!3573 lt!253978)))) (bvadd #b00000000000000000000000000000001 (currentByte!7514 thiss!1602)) (currentBit!7509 thiss!1602))))) (tuple3!875 Unit!11065 lt!253976 (BitStream!6315 lt!253978 (bvadd #b00000000000000000000000000000001 (currentByte!7514 thiss!1602)) (currentBit!7509 thiss!1602)))))))

(declare-fun e!111034 () Bool)

(assert (=> b!161317 e!111034))

(declare-fun res!134464 () Bool)

(assert (=> b!161317 (=> res!134464 e!111034)))

(assert (=> b!161317 (= res!134464 (bvsge (currentByte!7514 thiss!1602) (size!3573 (buf!4031 thiss!1602))))))

(assert (=> b!161317 (= lt!253978 (array!7962 (store (store (arr!4494 (buf!4031 thiss!1602)) (currentByte!7514 thiss!1602) lt!253980) (currentByte!7514 thiss!1602) lt!253975) (size!3573 (buf!4031 thiss!1602))))))

(assert (=> b!161317 (= lt!253975 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253980) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253974))))))

(assert (=> b!161317 (= lt!253980 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4494 (buf!4031 thiss!1602)) (currentByte!7514 thiss!1602))) lt!253977)))))

(assert (=> b!161317 (= lt!253977 ((_ sign_extend 24) lt!253976))))

(assert (=> b!161317 (= lt!253976 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253973)))))))

(assert (=> b!161317 (= lt!253973 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253974))))))

(assert (=> b!161317 (= lt!253974 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7509 thiss!1602))))))

(declare-fun res!134466 () Bool)

(assert (=> start!33704 (=> (not res!134466) (not e!111037))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33704 (= res!134466 (validate_offset_byte!0 ((_ sign_extend 32) (size!3573 (buf!4031 thiss!1602))) ((_ sign_extend 32) (currentByte!7514 thiss!1602)) ((_ sign_extend 32) (currentBit!7509 thiss!1602))))))

(assert (=> start!33704 e!111037))

(declare-fun inv!12 (BitStream!6314) Bool)

(assert (=> start!33704 (and (inv!12 thiss!1602) e!111035)))

(assert (=> start!33704 true))

(declare-fun b!161318 () Bool)

(assert (=> b!161318 (= e!111033 (and (bvsle #b00000000000000000000000000000000 (currentByte!7514 (_3!554 lt!253979))) (bvslt (currentByte!7514 (_3!554 lt!253979)) (size!3573 (buf!4031 thiss!1602)))))))

(assert (=> b!161318 (arrayRangesEq!525 (buf!4031 thiss!1602) (array!7962 (store (arr!4494 (buf!4031 thiss!1602)) (currentByte!7514 (_3!554 lt!253979)) (select (arr!4494 (buf!4031 (_3!554 lt!253979))) (currentByte!7514 (_3!554 lt!253979)))) (size!3573 (buf!4031 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7514 (_3!554 lt!253979)))))

(declare-fun lt!253981 () Unit!11062)

(assert (=> b!161318 (= lt!253981 (arrayUpdatedAtPrefixLemma!133 (buf!4031 thiss!1602) (currentByte!7514 (_3!554 lt!253979)) (select (arr!4494 (buf!4031 (_3!554 lt!253979))) (currentByte!7514 (_3!554 lt!253979)))))))

(declare-fun b!161319 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161319 (= e!111034 (byteRangesEq!0 (select (arr!4494 (buf!4031 thiss!1602)) (currentByte!7514 thiss!1602)) lt!253975 #b00000000000000000000000000000000 (currentBit!7509 thiss!1602)))))

(declare-fun b!161320 () Bool)

(declare-fun res!134465 () Bool)

(assert (=> b!161320 (=> res!134465 e!111033)))

(assert (=> b!161320 (= res!134465 (bvsle lt!253974 #b00000000000000000000000000000000))))

(assert (= (and start!33704 res!134466) b!161317))

(assert (= (and b!161317 (not res!134464)) b!161319))

(assert (= (and b!161317 (not res!134463)) b!161320))

(assert (= (and b!161320 (not res!134465)) b!161318))

(assert (= start!33704 b!161316))

(declare-fun m!255355 () Bool)

(assert (=> b!161318 m!255355))

(declare-fun m!255357 () Bool)

(assert (=> b!161318 m!255357))

(declare-fun m!255359 () Bool)

(assert (=> b!161318 m!255359))

(assert (=> b!161318 m!255355))

(declare-fun m!255361 () Bool)

(assert (=> b!161318 m!255361))

(declare-fun m!255363 () Bool)

(assert (=> b!161319 m!255363))

(assert (=> b!161319 m!255363))

(declare-fun m!255365 () Bool)

(assert (=> b!161319 m!255365))

(declare-fun m!255367 () Bool)

(assert (=> b!161317 m!255367))

(declare-fun m!255369 () Bool)

(assert (=> b!161317 m!255369))

(declare-fun m!255371 () Bool)

(assert (=> b!161317 m!255371))

(declare-fun m!255373 () Bool)

(assert (=> b!161317 m!255373))

(declare-fun m!255375 () Bool)

(assert (=> b!161317 m!255375))

(declare-fun m!255377 () Bool)

(assert (=> b!161317 m!255377))

(assert (=> b!161317 m!255363))

(declare-fun m!255379 () Bool)

(assert (=> b!161317 m!255379))

(declare-fun m!255381 () Bool)

(assert (=> b!161317 m!255381))

(declare-fun m!255383 () Bool)

(assert (=> b!161317 m!255383))

(declare-fun m!255385 () Bool)

(assert (=> b!161317 m!255385))

(declare-fun m!255387 () Bool)

(assert (=> b!161317 m!255387))

(declare-fun m!255389 () Bool)

(assert (=> b!161316 m!255389))

(declare-fun m!255391 () Bool)

(assert (=> start!33704 m!255391))

(declare-fun m!255393 () Bool)

(assert (=> start!33704 m!255393))

(push 1)

(assert (not b!161318))

(assert (not b!161316))

(assert (not b!161319))

(assert (not b!161317))

(assert (not start!33704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

