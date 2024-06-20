; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72142 () Bool)

(assert start!72142)

(declare-fun b!323471 () Bool)

(declare-fun res!265537 () Bool)

(declare-fun e!233033 () Bool)

(assert (=> b!323471 (=> (not res!265537) (not e!233033))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20673 0))(
  ( (array!20674 (arr!10091 (Array (_ BitVec 32) (_ BitVec 8))) (size!8999 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14160 0))(
  ( (BitStream!14161 (buf!8141 array!20673) (currentByte!15012 (_ BitVec 32)) (currentBit!15007 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14160)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323471 (= res!265537 (validate_offset_bits!1 ((_ sign_extend 32) (size!8999 (buf!8141 thiss!1793))) ((_ sign_extend 32) (currentByte!15012 thiss!1793)) ((_ sign_extend 32) (currentBit!15007 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323472 () Bool)

(declare-fun e!233034 () Bool)

(declare-fun array_inv!8551 (array!20673) Bool)

(assert (=> b!323472 (= e!233034 (array_inv!8551 (buf!8141 thiss!1793)))))

(declare-fun res!265538 () Bool)

(assert (=> start!72142 (=> (not res!265538) (not e!233033))))

(assert (=> start!72142 (= res!265538 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72142 e!233033))

(assert (=> start!72142 true))

(declare-fun inv!12 (BitStream!14160) Bool)

(assert (=> start!72142 (and (inv!12 thiss!1793) e!233034)))

(declare-fun b!323473 () Bool)

(declare-fun e!233032 () Bool)

(assert (=> b!323473 (= e!233033 e!233032)))

(declare-fun res!265536 () Bool)

(assert (=> b!323473 (=> (not res!265536) (not e!233032))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((tuple2!23676 0))(
  ( (tuple2!23677 (_1!13467 Bool) (_2!13467 BitStream!14160)) )
))
(declare-fun lt!445927 () tuple2!23676)

(declare-datatypes ((tuple2!23678 0))(
  ( (tuple2!23679 (_1!13468 (_ BitVec 64)) (_2!13468 BitStream!14160)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23678)

(assert (=> b!323473 (= res!265536 (= (buf!8141 (_2!13468 (readNBitsLSBFirstsLoop!0 (_2!13467 lt!445927) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13467 lt!445927) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!8141 thiss!1793)))))

(declare-fun readBit!0 (BitStream!14160) tuple2!23676)

(assert (=> b!323473 (= lt!445927 (readBit!0 thiss!1793))))

(declare-fun b!323474 () Bool)

(declare-fun res!265540 () Bool)

(assert (=> b!323474 (=> (not res!265540) (not e!233033))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323474 (= res!265540 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323475 () Bool)

(assert (=> b!323475 (= e!233032 (and (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000)))))))

(declare-fun lt!445928 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323475 (= lt!445928 (bitIndex!0 (size!8999 (buf!8141 thiss!1793)) (currentByte!15012 thiss!1793) (currentBit!15007 thiss!1793)))))

(declare-fun b!323476 () Bool)

(declare-fun res!265539 () Bool)

(assert (=> b!323476 (=> (not res!265539) (not e!233033))))

(assert (=> b!323476 (= res!265539 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!72142 res!265538) b!323471))

(assert (= (and b!323471 res!265537) b!323474))

(assert (= (and b!323474 res!265540) b!323476))

(assert (= (and b!323476 res!265539) b!323473))

(assert (= (and b!323473 res!265536) b!323475))

(assert (= start!72142 b!323472))

(declare-fun m!461531 () Bool)

(assert (=> b!323474 m!461531))

(declare-fun m!461533 () Bool)

(assert (=> b!323473 m!461533))

(declare-fun m!461535 () Bool)

(assert (=> b!323473 m!461535))

(declare-fun m!461537 () Bool)

(assert (=> start!72142 m!461537))

(declare-fun m!461539 () Bool)

(assert (=> b!323472 m!461539))

(declare-fun m!461541 () Bool)

(assert (=> b!323471 m!461541))

(declare-fun m!461543 () Bool)

(assert (=> b!323475 m!461543))

(check-sat (not b!323475) (not start!72142) (not b!323474) (not b!323471) (not b!323473) (not b!323472))
(check-sat)
