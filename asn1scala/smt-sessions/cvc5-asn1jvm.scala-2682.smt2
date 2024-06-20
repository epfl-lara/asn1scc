; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65638 () Bool)

(assert start!65638)

(declare-fun b!294314 () Bool)

(declare-fun e!210336 () Bool)

(declare-datatypes ((array!17621 0))(
  ( (array!17622 (arr!8671 (Array (_ BitVec 32) (_ BitVec 8))) (size!7636 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13276 0))(
  ( (BitStream!13277 (buf!7699 array!17621) (currentByte!14190 (_ BitVec 32)) (currentBit!14185 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13276)

(declare-fun array_inv!7248 (array!17621) Bool)

(assert (=> b!294314 (= e!210336 (array_inv!7248 (buf!7699 thiss!1728)))))

(declare-datatypes ((Unit!20497 0))(
  ( (Unit!20498) )
))
(declare-datatypes ((tuple3!1788 0))(
  ( (tuple3!1789 (_1!12902 Unit!20497) (_2!12902 BitStream!13276) (_3!1329 array!17621)) )
))
(declare-fun lt!427390 () tuple3!1788)

(declare-fun e!210333 () Bool)

(declare-fun b!294315 () Bool)

(declare-fun arr!273 () array!17621)

(assert (=> b!294315 (= e!210333 (and (= (buf!7699 thiss!1728) (buf!7699 (_2!12902 lt!427390))) (= (size!7636 arr!273) (size!7636 (_3!1329 lt!427390)))))))

(declare-fun b!294316 () Bool)

(declare-fun res!243027 () Bool)

(declare-fun e!210332 () Bool)

(assert (=> b!294316 (=> (not res!243027) (not e!210332))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294316 (= res!243027 (validate_offset_bits!1 ((_ sign_extend 32) (size!7636 (buf!7699 thiss!1728))) ((_ sign_extend 32) (currentByte!14190 thiss!1728)) ((_ sign_extend 32) (currentBit!14185 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294317 () Bool)

(declare-fun res!243028 () Bool)

(assert (=> b!294317 (=> (not res!243028) (not e!210332))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294317 (= res!243028 (bvslt from!505 to!474))))

(declare-fun res!243029 () Bool)

(assert (=> start!65638 (=> (not res!243029) (not e!210332))))

(assert (=> start!65638 (= res!243029 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7636 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65638 e!210332))

(declare-fun inv!12 (BitStream!13276) Bool)

(assert (=> start!65638 (and (inv!12 thiss!1728) e!210336)))

(assert (=> start!65638 true))

(assert (=> start!65638 (array_inv!7248 arr!273)))

(declare-fun b!294318 () Bool)

(assert (=> b!294318 (= e!210332 (not true))))

(declare-fun lt!427388 () array!17621)

(declare-fun arrayBitRangesEq!0 (array!17621 array!17621 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294318 (arrayBitRangesEq!0 arr!273 lt!427388 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!427392 () Unit!20497)

(declare-datatypes ((tuple2!23146 0))(
  ( (tuple2!23147 (_1!12903 Bool) (_2!12903 BitStream!13276)) )
))
(declare-fun lt!427387 () tuple2!23146)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17621 (_ BitVec 64) Bool) Unit!20497)

(assert (=> b!294318 (= lt!427392 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12903 lt!427387)))))

(assert (=> b!294318 e!210333))

(declare-fun res!243026 () Bool)

(assert (=> b!294318 (=> (not res!243026) (not e!210333))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294318 (= res!243026 (= (bvsub (bvadd (bitIndex!0 (size!7636 (buf!7699 thiss!1728)) (currentByte!14190 thiss!1728) (currentBit!14185 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7636 (buf!7699 (_2!12902 lt!427390))) (currentByte!14190 (_2!12902 lt!427390)) (currentBit!14185 (_2!12902 lt!427390)))))))

(declare-fun readBitsLoop!0 (BitStream!13276 (_ BitVec 64) array!17621 (_ BitVec 64) (_ BitVec 64)) tuple3!1788)

(assert (=> b!294318 (= lt!427390 (readBitsLoop!0 (_2!12903 lt!427387) nBits!523 lt!427388 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294318 (validate_offset_bits!1 ((_ sign_extend 32) (size!7636 (buf!7699 (_2!12903 lt!427387)))) ((_ sign_extend 32) (currentByte!14190 (_2!12903 lt!427387))) ((_ sign_extend 32) (currentBit!14185 (_2!12903 lt!427387))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427391 () Unit!20497)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13276 BitStream!13276 (_ BitVec 64) (_ BitVec 64)) Unit!20497)

(assert (=> b!294318 (= lt!427391 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12903 lt!427387) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427389 () (_ BitVec 32))

(declare-fun lt!427386 () (_ BitVec 32))

(assert (=> b!294318 (= lt!427388 (array!17622 (store (arr!8671 arr!273) lt!427386 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8671 arr!273) lt!427386)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427389)))) ((_ sign_extend 24) (ite (_1!12903 lt!427387) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427389) #b00000000))))) (size!7636 arr!273)))))

(assert (=> b!294318 (= lt!427389 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294318 (= lt!427386 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13276) tuple2!23146)

(assert (=> b!294318 (= lt!427387 (readBit!0 thiss!1728))))

(assert (= (and start!65638 res!243029) b!294316))

(assert (= (and b!294316 res!243027) b!294317))

(assert (= (and b!294317 res!243028) b!294318))

(assert (= (and b!294318 res!243026) b!294315))

(assert (= start!65638 b!294314))

(declare-fun m!430525 () Bool)

(assert (=> b!294314 m!430525))

(declare-fun m!430527 () Bool)

(assert (=> b!294316 m!430527))

(declare-fun m!430529 () Bool)

(assert (=> start!65638 m!430529))

(declare-fun m!430531 () Bool)

(assert (=> start!65638 m!430531))

(declare-fun m!430533 () Bool)

(assert (=> b!294318 m!430533))

(declare-fun m!430535 () Bool)

(assert (=> b!294318 m!430535))

(declare-fun m!430537 () Bool)

(assert (=> b!294318 m!430537))

(declare-fun m!430539 () Bool)

(assert (=> b!294318 m!430539))

(declare-fun m!430541 () Bool)

(assert (=> b!294318 m!430541))

(declare-fun m!430543 () Bool)

(assert (=> b!294318 m!430543))

(declare-fun m!430545 () Bool)

(assert (=> b!294318 m!430545))

(declare-fun m!430547 () Bool)

(assert (=> b!294318 m!430547))

(declare-fun m!430549 () Bool)

(assert (=> b!294318 m!430549))

(declare-fun m!430551 () Bool)

(assert (=> b!294318 m!430551))

(declare-fun m!430553 () Bool)

(assert (=> b!294318 m!430553))

(push 1)

(assert (not b!294316))

(assert (not start!65638))

(assert (not b!294314))

(assert (not b!294318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

