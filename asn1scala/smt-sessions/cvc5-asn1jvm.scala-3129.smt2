; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71972 () Bool)

(assert start!71972)

(declare-fun b!322729 () Bool)

(declare-fun res!264926 () Bool)

(declare-fun e!232541 () Bool)

(assert (=> b!322729 (=> (not res!264926) (not e!232541))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322729 (= res!264926 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322730 () Bool)

(declare-fun e!232538 () Bool)

(assert (=> b!322730 (= e!232541 e!232538)))

(declare-fun res!264927 () Bool)

(assert (=> b!322730 (=> (not res!264927) (not e!232538))))

(declare-datatypes ((array!20593 0))(
  ( (array!20594 (arr!10054 (Array (_ BitVec 32) (_ BitVec 8))) (size!8962 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14086 0))(
  ( (BitStream!14087 (buf!8104 array!20593) (currentByte!14960 (_ BitVec 32)) (currentBit!14955 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23606 0))(
  ( (tuple2!23607 (_1!13432 (_ BitVec 64)) (_2!13432 BitStream!14086)) )
))
(declare-fun lt!445501 () tuple2!23606)

(declare-fun thiss!1793 () BitStream!14086)

(assert (=> b!322730 (= res!264927 (= (buf!8104 (_2!13432 lt!445501)) (buf!8104 thiss!1793)))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((tuple2!23608 0))(
  ( (tuple2!23609 (_1!13433 Bool) (_2!13433 BitStream!14086)) )
))
(declare-fun lt!445502 () tuple2!23608)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23606)

(assert (=> b!322730 (= lt!445501 (readNBitsLSBFirstsLoop!0 (_2!13433 lt!445502) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13433 lt!445502) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14086) tuple2!23608)

(assert (=> b!322730 (= lt!445502 (readBit!0 thiss!1793))))

(declare-fun b!322731 () Bool)

(declare-fun e!232540 () Bool)

(assert (=> b!322731 (= e!232540 e!232541)))

(declare-fun res!264924 () Bool)

(assert (=> b!322731 (=> (not res!264924) (not e!232541))))

(declare-fun lt!445500 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322731 (= res!264924 (validate_offset_bits!1 ((_ sign_extend 32) (size!8962 (buf!8104 thiss!1793))) ((_ sign_extend 32) (currentByte!14960 thiss!1793)) ((_ sign_extend 32) (currentBit!14955 thiss!1793)) lt!445500))))

(assert (=> b!322731 (= lt!445500 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!322732 () Bool)

(assert (=> b!322732 (= e!232538 (bvsgt i!743 #b00000000000000000000000001000000))))

(declare-fun res!264928 () Bool)

(assert (=> start!71972 (=> (not res!264928) (not e!232540))))

(assert (=> start!71972 (= res!264928 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71972 e!232540))

(assert (=> start!71972 true))

(declare-fun e!232539 () Bool)

(declare-fun inv!12 (BitStream!14086) Bool)

(assert (=> start!71972 (and (inv!12 thiss!1793) e!232539)))

(declare-fun b!322733 () Bool)

(declare-fun res!264923 () Bool)

(assert (=> b!322733 (=> (not res!264923) (not e!232538))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322733 (= res!264923 (= (bitIndex!0 (size!8962 (buf!8104 (_2!13432 lt!445501))) (currentByte!14960 (_2!13432 lt!445501)) (currentBit!14955 (_2!13432 lt!445501))) (bvadd (bitIndex!0 (size!8962 (buf!8104 thiss!1793)) (currentByte!14960 thiss!1793) (currentBit!14955 thiss!1793)) lt!445500)))))

(declare-fun b!322734 () Bool)

(declare-fun array_inv!8514 (array!20593) Bool)

(assert (=> b!322734 (= e!232539 (array_inv!8514 (buf!8104 thiss!1793)))))

(declare-fun b!322735 () Bool)

(declare-fun res!264925 () Bool)

(assert (=> b!322735 (=> (not res!264925) (not e!232541))))

(assert (=> b!322735 (= res!264925 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!71972 res!264928) b!322731))

(assert (= (and b!322731 res!264924) b!322729))

(assert (= (and b!322729 res!264926) b!322735))

(assert (= (and b!322735 res!264925) b!322730))

(assert (= (and b!322730 res!264927) b!322733))

(assert (= (and b!322733 res!264923) b!322732))

(assert (= start!71972 b!322734))

(declare-fun m!460995 () Bool)

(assert (=> start!71972 m!460995))

(declare-fun m!460997 () Bool)

(assert (=> b!322730 m!460997))

(declare-fun m!460999 () Bool)

(assert (=> b!322730 m!460999))

(declare-fun m!461001 () Bool)

(assert (=> b!322731 m!461001))

(declare-fun m!461003 () Bool)

(assert (=> b!322729 m!461003))

(declare-fun m!461005 () Bool)

(assert (=> b!322733 m!461005))

(declare-fun m!461007 () Bool)

(assert (=> b!322733 m!461007))

(declare-fun m!461009 () Bool)

(assert (=> b!322734 m!461009))

(push 1)

(assert (not b!322733))

(assert (not start!71972))

(assert (not b!322731))

(assert (not b!322734))

(assert (not b!322730))

(assert (not b!322729))

(check-sat)

(pop 1)

(push 1)

(check-sat)

