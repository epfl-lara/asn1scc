; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64610 () Bool)

(assert start!64610)

(declare-fun b!290018 () Bool)

(declare-fun e!206475 () Bool)

(assert (=> b!290018 (= e!206475 (not true))))

(declare-datatypes ((array!17199 0))(
  ( (array!17200 (arr!8445 (Array (_ BitVec 32) (_ BitVec 8))) (size!7443 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17199)

(declare-datatypes ((BitStream!12896 0))(
  ( (BitStream!12897 (buf!7509 array!17199) (currentByte!13916 (_ BitVec 32)) (currentBit!13911 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20127 0))(
  ( (Unit!20128) )
))
(declare-datatypes ((tuple3!1630 0))(
  ( (tuple3!1631 (_1!12609 Unit!20127) (_2!12609 BitStream!12896) (_3!1229 array!17199)) )
))
(declare-fun lt!420608 () tuple3!1630)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17199 array!17199 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290018 (arrayBitRangesEq!0 arr!273 (_3!1229 lt!420608) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420610 () array!17199)

(declare-fun lt!420611 () Unit!20127)

(declare-fun arrayBitRangesEqTransitive!0 (array!17199 array!17199 array!17199 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20127)

(assert (=> b!290018 (= lt!420611 (arrayBitRangesEqTransitive!0 arr!273 lt!420610 (_3!1229 lt!420608) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290018 (arrayBitRangesEq!0 arr!273 lt!420610 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22760 0))(
  ( (tuple2!22761 (_1!12610 Bool) (_2!12610 BitStream!12896)) )
))
(declare-fun lt!420612 () tuple2!22760)

(declare-fun lt!420609 () Unit!20127)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17199 (_ BitVec 64) Bool) Unit!20127)

(assert (=> b!290018 (= lt!420609 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12610 lt!420612)))))

(declare-fun e!206478 () Bool)

(assert (=> b!290018 e!206478))

(declare-fun res!239609 () Bool)

(assert (=> b!290018 (=> (not res!239609) (not e!206478))))

(declare-fun thiss!1728 () BitStream!12896)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290018 (= res!239609 (= (bvsub (bvadd (bitIndex!0 (size!7443 (buf!7509 thiss!1728)) (currentByte!13916 thiss!1728) (currentBit!13911 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7443 (buf!7509 (_2!12609 lt!420608))) (currentByte!13916 (_2!12609 lt!420608)) (currentBit!13911 (_2!12609 lt!420608)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12896 (_ BitVec 64) array!17199 (_ BitVec 64) (_ BitVec 64)) tuple3!1630)

(assert (=> b!290018 (= lt!420608 (readBitsLoop!0 (_2!12610 lt!420612) nBits!523 lt!420610 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290018 (validate_offset_bits!1 ((_ sign_extend 32) (size!7443 (buf!7509 (_2!12610 lt!420612)))) ((_ sign_extend 32) (currentByte!13916 (_2!12610 lt!420612))) ((_ sign_extend 32) (currentBit!13911 (_2!12610 lt!420612))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420607 () Unit!20127)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12896 BitStream!12896 (_ BitVec 64) (_ BitVec 64)) Unit!20127)

(assert (=> b!290018 (= lt!420607 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12610 lt!420612) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420605 () (_ BitVec 32))

(declare-fun lt!420606 () (_ BitVec 32))

(assert (=> b!290018 (= lt!420610 (array!17200 (store (arr!8445 arr!273) lt!420606 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8445 arr!273) lt!420606)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420605)))) ((_ sign_extend 24) (ite (_1!12610 lt!420612) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420605) #b00000000))))) (size!7443 arr!273)))))

(assert (=> b!290018 (= lt!420605 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290018 (= lt!420606 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12896) tuple2!22760)

(assert (=> b!290018 (= lt!420612 (readBit!0 thiss!1728))))

(declare-fun b!290019 () Bool)

(assert (=> b!290019 (= e!206478 (and (= (buf!7509 thiss!1728) (buf!7509 (_2!12609 lt!420608))) (= (size!7443 arr!273) (size!7443 (_3!1229 lt!420608)))))))

(declare-fun res!239606 () Bool)

(assert (=> start!64610 (=> (not res!239606) (not e!206475))))

(assert (=> start!64610 (= res!239606 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7443 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64610 e!206475))

(declare-fun e!206476 () Bool)

(declare-fun inv!12 (BitStream!12896) Bool)

(assert (=> start!64610 (and (inv!12 thiss!1728) e!206476)))

(assert (=> start!64610 true))

(declare-fun array_inv!7055 (array!17199) Bool)

(assert (=> start!64610 (array_inv!7055 arr!273)))

(declare-fun b!290020 () Bool)

(assert (=> b!290020 (= e!206476 (array_inv!7055 (buf!7509 thiss!1728)))))

(declare-fun b!290021 () Bool)

(declare-fun res!239607 () Bool)

(assert (=> b!290021 (=> (not res!239607) (not e!206475))))

(assert (=> b!290021 (= res!239607 (bvslt from!505 to!474))))

(declare-fun b!290022 () Bool)

(declare-fun res!239608 () Bool)

(assert (=> b!290022 (=> (not res!239608) (not e!206475))))

(assert (=> b!290022 (= res!239608 (validate_offset_bits!1 ((_ sign_extend 32) (size!7443 (buf!7509 thiss!1728))) ((_ sign_extend 32) (currentByte!13916 thiss!1728)) ((_ sign_extend 32) (currentBit!13911 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64610 res!239606) b!290022))

(assert (= (and b!290022 res!239608) b!290021))

(assert (= (and b!290021 res!239607) b!290018))

(assert (= (and b!290018 res!239609) b!290019))

(assert (= start!64610 b!290020))

(declare-fun m!423555 () Bool)

(assert (=> b!290018 m!423555))

(declare-fun m!423557 () Bool)

(assert (=> b!290018 m!423557))

(declare-fun m!423559 () Bool)

(assert (=> b!290018 m!423559))

(declare-fun m!423561 () Bool)

(assert (=> b!290018 m!423561))

(declare-fun m!423563 () Bool)

(assert (=> b!290018 m!423563))

(declare-fun m!423565 () Bool)

(assert (=> b!290018 m!423565))

(declare-fun m!423567 () Bool)

(assert (=> b!290018 m!423567))

(declare-fun m!423569 () Bool)

(assert (=> b!290018 m!423569))

(declare-fun m!423571 () Bool)

(assert (=> b!290018 m!423571))

(declare-fun m!423573 () Bool)

(assert (=> b!290018 m!423573))

(declare-fun m!423575 () Bool)

(assert (=> b!290018 m!423575))

(declare-fun m!423577 () Bool)

(assert (=> b!290018 m!423577))

(declare-fun m!423579 () Bool)

(assert (=> b!290018 m!423579))

(declare-fun m!423581 () Bool)

(assert (=> start!64610 m!423581))

(declare-fun m!423583 () Bool)

(assert (=> start!64610 m!423583))

(declare-fun m!423585 () Bool)

(assert (=> b!290020 m!423585))

(declare-fun m!423587 () Bool)

(assert (=> b!290022 m!423587))

(push 1)

(assert (not b!290022))

(assert (not b!290018))

(assert (not b!290020))

(assert (not start!64610))

(check-sat)

