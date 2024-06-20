; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72144 () Bool)

(assert start!72144)

(declare-fun b!323489 () Bool)

(declare-fun e!233044 () Bool)

(declare-fun e!233046 () Bool)

(assert (=> b!323489 (= e!233044 e!233046)))

(declare-fun res!265553 () Bool)

(assert (=> b!323489 (=> (not res!265553) (not e!233046))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((array!20675 0))(
  ( (array!20676 (arr!10092 (Array (_ BitVec 32) (_ BitVec 8))) (size!9000 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14162 0))(
  ( (BitStream!14163 (buf!8142 array!20675) (currentByte!15013 (_ BitVec 32)) (currentBit!15008 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23680 0))(
  ( (tuple2!23681 (_1!13469 Bool) (_2!13469 BitStream!14162)) )
))
(declare-fun lt!445934 () tuple2!23680)

(declare-fun thiss!1793 () BitStream!14162)

(declare-datatypes ((tuple2!23682 0))(
  ( (tuple2!23683 (_1!13470 (_ BitVec 64)) (_2!13470 BitStream!14162)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23682)

(assert (=> b!323489 (= res!265553 (= (buf!8142 (_2!13470 (readNBitsLSBFirstsLoop!0 (_2!13469 lt!445934) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13469 lt!445934) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!8142 thiss!1793)))))

(declare-fun readBit!0 (BitStream!14162) tuple2!23680)

(assert (=> b!323489 (= lt!445934 (readBit!0 thiss!1793))))

(declare-fun b!323490 () Bool)

(declare-fun res!265555 () Bool)

(assert (=> b!323490 (=> (not res!265555) (not e!233044))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323490 (= res!265555 (validate_offset_bits!1 ((_ sign_extend 32) (size!9000 (buf!8142 thiss!1793))) ((_ sign_extend 32) (currentByte!15013 thiss!1793)) ((_ sign_extend 32) (currentBit!15008 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323491 () Bool)

(declare-fun e!233045 () Bool)

(declare-fun array_inv!8552 (array!20675) Bool)

(assert (=> b!323491 (= e!233045 (array_inv!8552 (buf!8142 thiss!1793)))))

(declare-fun b!323492 () Bool)

(declare-fun res!265552 () Bool)

(assert (=> b!323492 (=> (not res!265552) (not e!233044))))

(assert (=> b!323492 (= res!265552 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323493 () Bool)

(declare-fun res!265554 () Bool)

(assert (=> b!323493 (=> (not res!265554) (not e!233044))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323493 (= res!265554 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!265551 () Bool)

(assert (=> start!72144 (=> (not res!265551) (not e!233044))))

(assert (=> start!72144 (= res!265551 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72144 e!233044))

(assert (=> start!72144 true))

(declare-fun inv!12 (BitStream!14162) Bool)

(assert (=> start!72144 (and (inv!12 thiss!1793) e!233045)))

(declare-fun b!323494 () Bool)

(assert (=> b!323494 (= e!233046 (and (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000)))))))

(declare-fun lt!445933 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323494 (= lt!445933 (bitIndex!0 (size!9000 (buf!8142 thiss!1793)) (currentByte!15013 thiss!1793) (currentBit!15008 thiss!1793)))))

(assert (= (and start!72144 res!265551) b!323490))

(assert (= (and b!323490 res!265555) b!323493))

(assert (= (and b!323493 res!265554) b!323492))

(assert (= (and b!323492 res!265552) b!323489))

(assert (= (and b!323489 res!265553) b!323494))

(assert (= start!72144 b!323491))

(declare-fun m!461545 () Bool)

(assert (=> b!323491 m!461545))

(declare-fun m!461547 () Bool)

(assert (=> start!72144 m!461547))

(declare-fun m!461549 () Bool)

(assert (=> b!323493 m!461549))

(declare-fun m!461551 () Bool)

(assert (=> b!323489 m!461551))

(declare-fun m!461553 () Bool)

(assert (=> b!323489 m!461553))

(declare-fun m!461555 () Bool)

(assert (=> b!323494 m!461555))

(declare-fun m!461557 () Bool)

(assert (=> b!323490 m!461557))

(push 1)

(assert (not b!323490))

(assert (not start!72144))

(assert (not b!323489))

(assert (not b!323493))

(assert (not b!323491))

(assert (not b!323494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

