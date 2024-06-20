; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50912 () Bool)

(assert start!50912)

(declare-fun b!238483 () Bool)

(declare-fun res!199343 () Bool)

(declare-fun e!164723 () Bool)

(assert (=> b!238483 (=> (not res!199343) (not e!164723))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238483 (= res!199343 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238484 () Bool)

(declare-fun e!164725 () Bool)

(assert (=> b!238484 (= e!164723 e!164725)))

(declare-fun res!199344 () Bool)

(assert (=> b!238484 (=> (not res!199344) (not e!164725))))

(declare-datatypes ((array!12718 0))(
  ( (array!12719 (arr!6574 (Array (_ BitVec 32) (_ BitVec 8))) (size!5587 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10138 0))(
  ( (BitStream!10139 (buf!6062 array!12718) (currentByte!11248 (_ BitVec 32)) (currentBit!11243 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20142 0))(
  ( (tuple2!20143 (_1!10975 (_ BitVec 64)) (_2!10975 BitStream!10138)) )
))
(declare-fun lt!373280 () tuple2!20142)

(declare-fun thiss!1830 () BitStream!10138)

(assert (=> b!238484 (= res!199344 (= (buf!6062 (_2!10975 lt!373280)) (buf!6062 thiss!1830)))))

(declare-fun i!752 () (_ BitVec 32))

(declare-datatypes ((tuple2!20144 0))(
  ( (tuple2!20145 (_1!10976 Bool) (_2!10976 BitStream!10138)) )
))
(declare-fun lt!373281 () tuple2!20144)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20142)

(assert (=> b!238484 (= lt!373280 (readNLeastSignificantBitsLoop!0 (_2!10976 lt!373281) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10976 lt!373281) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10138) tuple2!20144)

(assert (=> b!238484 (= lt!373281 (readBit!0 thiss!1830))))

(declare-fun b!238485 () Bool)

(declare-fun res!199342 () Bool)

(assert (=> b!238485 (=> (not res!199342) (not e!164725))))

(declare-fun lt!373279 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238485 (= res!199342 (= (bitIndex!0 (size!5587 (buf!6062 (_2!10975 lt!373280))) (currentByte!11248 (_2!10975 lt!373280)) (currentBit!11243 (_2!10975 lt!373280))) (bvadd (bitIndex!0 (size!5587 (buf!6062 thiss!1830)) (currentByte!11248 thiss!1830) (currentBit!11243 thiss!1830)) lt!373279)))))

(declare-fun b!238487 () Bool)

(assert (=> b!238487 (= e!164725 (or (bvslt lt!373279 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!373279 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun b!238488 () Bool)

(declare-fun res!199347 () Bool)

(assert (=> b!238488 (=> (not res!199347) (not e!164723))))

(assert (=> b!238488 (= res!199347 (not (= nBits!581 i!752)))))

(declare-fun b!238489 () Bool)

(declare-fun e!164722 () Bool)

(assert (=> b!238489 (= e!164722 e!164723)))

(declare-fun res!199341 () Bool)

(assert (=> b!238489 (=> (not res!199341) (not e!164723))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238489 (= res!199341 (validate_offset_bits!1 ((_ sign_extend 32) (size!5587 (buf!6062 thiss!1830))) ((_ sign_extend 32) (currentByte!11248 thiss!1830)) ((_ sign_extend 32) (currentBit!11243 thiss!1830)) lt!373279))))

(assert (=> b!238489 (= lt!373279 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238490 () Bool)

(declare-fun e!164724 () Bool)

(declare-fun array_inv!5328 (array!12718) Bool)

(assert (=> b!238490 (= e!164724 (array_inv!5328 (buf!6062 thiss!1830)))))

(declare-fun b!238486 () Bool)

(declare-fun res!199345 () Bool)

(assert (=> b!238486 (=> (not res!199345) (not e!164723))))

(assert (=> b!238486 (= res!199345 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!199346 () Bool)

(assert (=> start!50912 (=> (not res!199346) (not e!164722))))

(assert (=> start!50912 (= res!199346 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50912 e!164722))

(assert (=> start!50912 true))

(declare-fun inv!12 (BitStream!10138) Bool)

(assert (=> start!50912 (and (inv!12 thiss!1830) e!164724)))

(assert (= (and start!50912 res!199346) b!238489))

(assert (= (and b!238489 res!199341) b!238486))

(assert (= (and b!238486 res!199345) b!238483))

(assert (= (and b!238483 res!199343) b!238488))

(assert (= (and b!238488 res!199347) b!238484))

(assert (= (and b!238484 res!199344) b!238485))

(assert (= (and b!238485 res!199342) b!238487))

(assert (= start!50912 b!238490))

(declare-fun m!360609 () Bool)

(assert (=> start!50912 m!360609))

(declare-fun m!360611 () Bool)

(assert (=> b!238484 m!360611))

(declare-fun m!360613 () Bool)

(assert (=> b!238484 m!360613))

(declare-fun m!360615 () Bool)

(assert (=> b!238489 m!360615))

(declare-fun m!360617 () Bool)

(assert (=> b!238490 m!360617))

(declare-fun m!360619 () Bool)

(assert (=> b!238486 m!360619))

(declare-fun m!360621 () Bool)

(assert (=> b!238483 m!360621))

(declare-fun m!360623 () Bool)

(assert (=> b!238485 m!360623))

(declare-fun m!360625 () Bool)

(assert (=> b!238485 m!360625))

(push 1)

(assert (not b!238484))

(assert (not b!238485))

(assert (not b!238489))

(assert (not b!238490))

(assert (not b!238483))

(assert (not start!50912))

(assert (not b!238486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

