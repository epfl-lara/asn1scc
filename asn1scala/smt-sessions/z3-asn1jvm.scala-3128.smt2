; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71968 () Bool)

(assert start!71968)

(declare-fun b!322687 () Bool)

(declare-fun e!232508 () Bool)

(declare-fun e!232512 () Bool)

(assert (=> b!322687 (= e!232508 e!232512)))

(declare-fun res!264889 () Bool)

(assert (=> b!322687 (=> (not res!264889) (not e!232512))))

(declare-datatypes ((array!20589 0))(
  ( (array!20590 (arr!10052 (Array (_ BitVec 32) (_ BitVec 8))) (size!8960 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14082 0))(
  ( (BitStream!14083 (buf!8102 array!20589) (currentByte!14958 (_ BitVec 32)) (currentBit!14953 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23598 0))(
  ( (tuple2!23599 (_1!13428 (_ BitVec 64)) (_2!13428 BitStream!14082)) )
))
(declare-fun lt!445483 () tuple2!23598)

(declare-fun thiss!1793 () BitStream!14082)

(assert (=> b!322687 (= res!264889 (= (buf!8102 (_2!13428 lt!445483)) (buf!8102 thiss!1793)))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((tuple2!23600 0))(
  ( (tuple2!23601 (_1!13429 Bool) (_2!13429 BitStream!14082)) )
))
(declare-fun lt!445482 () tuple2!23600)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23598)

(assert (=> b!322687 (= lt!445483 (readNBitsLSBFirstsLoop!0 (_2!13429 lt!445482) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13429 lt!445482) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14082) tuple2!23600)

(assert (=> b!322687 (= lt!445482 (readBit!0 thiss!1793))))

(declare-fun b!322689 () Bool)

(declare-fun res!264887 () Bool)

(assert (=> b!322689 (=> (not res!264887) (not e!232512))))

(declare-fun lt!445484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322689 (= res!264887 (= (bitIndex!0 (size!8960 (buf!8102 (_2!13428 lt!445483))) (currentByte!14958 (_2!13428 lt!445483)) (currentBit!14953 (_2!13428 lt!445483))) (bvadd (bitIndex!0 (size!8960 (buf!8102 thiss!1793)) (currentByte!14958 thiss!1793) (currentBit!14953 thiss!1793)) lt!445484)))))

(declare-fun b!322690 () Bool)

(assert (=> b!322690 (= e!232512 (bvsgt i!743 #b00000000000000000000000001000000))))

(declare-fun b!322691 () Bool)

(declare-fun e!232509 () Bool)

(assert (=> b!322691 (= e!232509 e!232508)))

(declare-fun res!264892 () Bool)

(assert (=> b!322691 (=> (not res!264892) (not e!232508))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322691 (= res!264892 (validate_offset_bits!1 ((_ sign_extend 32) (size!8960 (buf!8102 thiss!1793))) ((_ sign_extend 32) (currentByte!14958 thiss!1793)) ((_ sign_extend 32) (currentBit!14953 thiss!1793)) lt!445484))))

(assert (=> b!322691 (= lt!445484 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!322692 () Bool)

(declare-fun e!232511 () Bool)

(declare-fun array_inv!8512 (array!20589) Bool)

(assert (=> b!322692 (= e!232511 (array_inv!8512 (buf!8102 thiss!1793)))))

(declare-fun b!322693 () Bool)

(declare-fun res!264891 () Bool)

(assert (=> b!322693 (=> (not res!264891) (not e!232508))))

(assert (=> b!322693 (= res!264891 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322688 () Bool)

(declare-fun res!264888 () Bool)

(assert (=> b!322688 (=> (not res!264888) (not e!232508))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322688 (= res!264888 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264890 () Bool)

(assert (=> start!71968 (=> (not res!264890) (not e!232509))))

(assert (=> start!71968 (= res!264890 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71968 e!232509))

(assert (=> start!71968 true))

(declare-fun inv!12 (BitStream!14082) Bool)

(assert (=> start!71968 (and (inv!12 thiss!1793) e!232511)))

(assert (= (and start!71968 res!264890) b!322691))

(assert (= (and b!322691 res!264892) b!322688))

(assert (= (and b!322688 res!264888) b!322693))

(assert (= (and b!322693 res!264891) b!322687))

(assert (= (and b!322687 res!264889) b!322689))

(assert (= (and b!322689 res!264887) b!322690))

(assert (= start!71968 b!322692))

(declare-fun m!460963 () Bool)

(assert (=> b!322687 m!460963))

(declare-fun m!460965 () Bool)

(assert (=> b!322687 m!460965))

(declare-fun m!460967 () Bool)

(assert (=> b!322692 m!460967))

(declare-fun m!460969 () Bool)

(assert (=> start!71968 m!460969))

(declare-fun m!460971 () Bool)

(assert (=> b!322688 m!460971))

(declare-fun m!460973 () Bool)

(assert (=> b!322689 m!460973))

(declare-fun m!460975 () Bool)

(assert (=> b!322689 m!460975))

(declare-fun m!460977 () Bool)

(assert (=> b!322691 m!460977))

(check-sat (not b!322688) (not b!322691) (not b!322689) (not start!71968) (not b!322687) (not b!322692))
(check-sat)
