; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45032 () Bool)

(assert start!45032)

(declare-fun b!216842 () Bool)

(declare-fun res!182445 () Bool)

(declare-fun e!147489 () Bool)

(assert (=> b!216842 (=> res!182445 e!147489)))

(declare-datatypes ((array!10606 0))(
  ( (array!10607 (arr!5588 (Array (_ BitVec 32) (_ BitVec 8))) (size!4658 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8424 0))(
  ( (BitStream!8425 (buf!5199 array!10606) (currentByte!9786 (_ BitVec 32)) (currentBit!9781 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15435 0))(
  ( (Unit!15436) )
))
(declare-datatypes ((tuple2!18502 0))(
  ( (tuple2!18503 (_1!9909 Unit!15435) (_2!9909 BitStream!8424)) )
))
(declare-fun lt!342877 () tuple2!18502)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!216842 (= res!182445 (not (invariant!0 (currentBit!9781 (_2!9909 lt!342877)) (currentByte!9786 (_2!9909 lt!342877)) (size!4658 (buf!5199 (_2!9909 lt!342877))))))))

(declare-fun b!216843 () Bool)

(declare-fun e!147492 () Bool)

(declare-fun thiss!1204 () BitStream!8424)

(assert (=> b!216843 (= e!147492 (invariant!0 (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204) (size!4658 (buf!5199 (_2!9909 lt!342877)))))))

(declare-datatypes ((tuple2!18504 0))(
  ( (tuple2!18505 (_1!9910 BitStream!8424) (_2!9910 (_ BitVec 64))) )
))
(declare-fun lt!342880 () tuple2!18504)

(declare-fun lt!342885 () BitStream!8424)

(declare-fun e!147485 () Bool)

(declare-fun lt!342874 () tuple2!18504)

(declare-fun lt!342861 () (_ BitVec 64))

(declare-fun b!216844 () Bool)

(declare-datatypes ((tuple2!18506 0))(
  ( (tuple2!18507 (_1!9911 BitStream!8424) (_2!9911 BitStream!8424)) )
))
(declare-fun lt!342881 () tuple2!18506)

(declare-fun lt!342868 () (_ BitVec 64))

(assert (=> b!216844 (= e!147485 (and (= lt!342861 (bvsub lt!342868 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9911 lt!342881) lt!342885)) (= (_2!9910 lt!342880) (_2!9910 lt!342874)))))))

(declare-fun b!216845 () Bool)

(declare-fun lt!342887 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!342872 () (_ BitVec 64))

(declare-fun e!147481 () Bool)

(assert (=> b!216845 (= e!147481 (or (not (= lt!342887 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!342887 (bvand lt!342872 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!216845 (= lt!342887 (bvand lt!342861 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147480 () Bool)

(assert (=> b!216845 e!147480))

(declare-fun res!182429 () Bool)

(assert (=> b!216845 (=> (not res!182429) (not e!147480))))

(assert (=> b!216845 (= res!182429 (= (size!4658 (buf!5199 thiss!1204)) (size!4658 (buf!5199 (_2!9909 lt!342877)))))))

(declare-fun b!216847 () Bool)

(declare-fun e!147483 () Bool)

(declare-datatypes ((tuple2!18508 0))(
  ( (tuple2!18509 (_1!9912 BitStream!8424) (_2!9912 Bool)) )
))
(declare-fun lt!342864 () tuple2!18508)

(declare-fun lt!342866 () tuple2!18508)

(assert (=> b!216847 (= e!147483 (= (_2!9912 lt!342864) (_2!9912 lt!342866)))))

(declare-fun b!216848 () Bool)

(declare-fun e!147494 () Bool)

(assert (=> b!216848 (= e!147494 e!147481)))

(declare-fun res!182452 () Bool)

(assert (=> b!216848 (=> res!182452 e!147481)))

(assert (=> b!216848 (= res!182452 (not (= (_1!9911 lt!342881) lt!342885)))))

(assert (=> b!216848 e!147485))

(declare-fun res!182448 () Bool)

(assert (=> b!216848 (=> (not res!182448) (not e!147485))))

(declare-fun lt!342875 () tuple2!18504)

(assert (=> b!216848 (= res!182448 (and (= (_2!9910 lt!342880) (_2!9910 lt!342875)) (= (_1!9910 lt!342880) (_1!9910 lt!342875))))))

(declare-fun lt!342886 () tuple2!18506)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!342876 () (_ BitVec 64))

(declare-fun lt!342882 () Unit!15435)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15435)

(assert (=> b!216848 (= lt!342882 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9911 lt!342886) nBits!348 i!590 lt!342876))))

(declare-fun lt!342873 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18504)

(assert (=> b!216848 (= lt!342875 (readNBitsLSBFirstsLoopPure!0 lt!342885 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342873))))

(declare-fun withMovedBitIndex!0 (BitStream!8424 (_ BitVec 64)) BitStream!8424)

(assert (=> b!216848 (= lt!342885 (withMovedBitIndex!0 (_1!9911 lt!342886) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!216849 () Bool)

(declare-fun e!147488 () Bool)

(declare-fun e!147491 () Bool)

(assert (=> b!216849 (= e!147488 e!147491)))

(declare-fun res!182430 () Bool)

(assert (=> b!216849 (=> (not res!182430) (not e!147491))))

(declare-fun lt!342878 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!216849 (= res!182430 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 thiss!1204))) ((_ sign_extend 32) (currentByte!9786 thiss!1204)) ((_ sign_extend 32) (currentBit!9781 thiss!1204)) lt!342878))))

(assert (=> b!216849 (= lt!342878 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!216850 () Bool)

(declare-fun e!147484 () Bool)

(declare-fun e!147482 () Bool)

(assert (=> b!216850 (= e!147484 e!147482)))

(declare-fun res!182447 () Bool)

(assert (=> b!216850 (=> (not res!182447) (not e!147482))))

(declare-fun lt!342871 () (_ BitVec 64))

(declare-fun lt!342890 () (_ BitVec 64))

(assert (=> b!216850 (= res!182447 (= lt!342871 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!342890)))))

(declare-fun lt!342867 () tuple2!18502)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!216850 (= lt!342871 (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))))))

(assert (=> b!216850 (= lt!342890 (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)))))

(declare-fun b!216851 () Bool)

(assert (=> b!216851 (= e!147480 (= (_1!9910 lt!342880) (_2!9911 lt!342886)))))

(declare-fun b!216852 () Bool)

(declare-fun res!182440 () Bool)

(assert (=> b!216852 (=> (not res!182440) (not e!147491))))

(assert (=> b!216852 (= res!182440 (not (= i!590 nBits!348)))))

(declare-fun b!216853 () Bool)

(declare-fun e!147486 () Bool)

(declare-fun lt!342870 () tuple2!18508)

(assert (=> b!216853 (= e!147486 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!342870))) (currentByte!9786 (_1!9912 lt!342870)) (currentBit!9781 (_1!9912 lt!342870))) lt!342871))))

(declare-fun b!216854 () Bool)

(declare-fun e!147490 () Bool)

(assert (=> b!216854 (= e!147490 e!147494)))

(declare-fun res!182434 () Bool)

(assert (=> b!216854 (=> res!182434 e!147494)))

(assert (=> b!216854 (= res!182434 (not (= (_1!9910 lt!342874) (_2!9911 lt!342881))))))

(assert (=> b!216854 (= lt!342874 (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!342881) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342873))))

(declare-fun lt!342863 () (_ BitVec 64))

(assert (=> b!216854 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867))) lt!342863)))

(declare-fun lt!342889 () Unit!15435)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8424 array!10606 (_ BitVec 64)) Unit!15435)

(assert (=> b!216854 (= lt!342889 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9909 lt!342867) (buf!5199 (_2!9909 lt!342877)) lt!342863))))

(assert (=> b!216854 (= lt!342863 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!342862 () (_ BitVec 64))

(declare-fun lt!342879 () tuple2!18508)

(assert (=> b!216854 (= lt!342873 (bvor lt!342876 (ite (_2!9912 lt!342879) lt!342862 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216854 (= lt!342880 (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!342886) nBits!348 i!590 lt!342876))))

(assert (=> b!216854 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))) ((_ sign_extend 32) (currentByte!9786 thiss!1204)) ((_ sign_extend 32) (currentBit!9781 thiss!1204)) lt!342878)))

(declare-fun lt!342888 () Unit!15435)

(assert (=> b!216854 (= lt!342888 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5199 (_2!9909 lt!342877)) lt!342878))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!216854 (= lt!342876 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!342883 () Bool)

(assert (=> b!216854 (= (_2!9912 lt!342879) lt!342883)))

(declare-fun readBitPure!0 (BitStream!8424) tuple2!18508)

(assert (=> b!216854 (= lt!342879 (readBitPure!0 (_1!9911 lt!342886)))))

(declare-fun reader!0 (BitStream!8424 BitStream!8424) tuple2!18506)

(assert (=> b!216854 (= lt!342881 (reader!0 (_2!9909 lt!342867) (_2!9909 lt!342877)))))

(assert (=> b!216854 (= lt!342886 (reader!0 thiss!1204 (_2!9909 lt!342877)))))

(assert (=> b!216854 e!147483))

(declare-fun res!182443 () Bool)

(assert (=> b!216854 (=> (not res!182443) (not e!147483))))

(assert (=> b!216854 (= res!182443 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!342864))) (currentByte!9786 (_1!9912 lt!342864)) (currentBit!9781 (_1!9912 lt!342864))) (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!342866))) (currentByte!9786 (_1!9912 lt!342866)) (currentBit!9781 (_1!9912 lt!342866)))))))

(declare-fun lt!342884 () Unit!15435)

(declare-fun lt!342860 () BitStream!8424)

(declare-fun readBitPrefixLemma!0 (BitStream!8424 BitStream!8424) Unit!15435)

(assert (=> b!216854 (= lt!342884 (readBitPrefixLemma!0 lt!342860 (_2!9909 lt!342877)))))

(assert (=> b!216854 (= lt!342866 (readBitPure!0 (BitStream!8425 (buf!5199 (_2!9909 lt!342877)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204))))))

(assert (=> b!216854 (= lt!342864 (readBitPure!0 lt!342860))))

(assert (=> b!216854 e!147492))

(declare-fun res!182437 () Bool)

(assert (=> b!216854 (=> (not res!182437) (not e!147492))))

(assert (=> b!216854 (= res!182437 (invariant!0 (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204) (size!4658 (buf!5199 (_2!9909 lt!342867)))))))

(assert (=> b!216854 (= lt!342860 (BitStream!8425 (buf!5199 (_2!9909 lt!342867)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)))))

(declare-fun b!216855 () Bool)

(assert (=> b!216855 (= e!147482 e!147486)))

(declare-fun res!182439 () Bool)

(assert (=> b!216855 (=> (not res!182439) (not e!147486))))

(assert (=> b!216855 (= res!182439 (and (= (_2!9912 lt!342870) lt!342883) (= (_1!9912 lt!342870) (_2!9909 lt!342867))))))

(declare-fun readerFrom!0 (BitStream!8424 (_ BitVec 32) (_ BitVec 32)) BitStream!8424)

(assert (=> b!216855 (= lt!342870 (readBitPure!0 (readerFrom!0 (_2!9909 lt!342867) (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204))))))

(declare-fun b!216856 () Bool)

(declare-fun res!182450 () Bool)

(assert (=> b!216856 (=> (not res!182450) (not e!147485))))

(declare-fun lt!342869 () (_ BitVec 64))

(assert (=> b!216856 (= res!182450 (= (_1!9911 lt!342881) (withMovedBitIndex!0 (_2!9911 lt!342881) (bvsub lt!342868 lt!342869))))))

(declare-fun b!216857 () Bool)

(declare-fun e!147495 () Bool)

(declare-fun array_inv!4399 (array!10606) Bool)

(assert (=> b!216857 (= e!147495 (array_inv!4399 (buf!5199 thiss!1204)))))

(declare-fun b!216858 () Bool)

(assert (=> b!216858 (= e!147489 e!147490)))

(declare-fun res!182438 () Bool)

(assert (=> b!216858 (=> res!182438 e!147490)))

(assert (=> b!216858 (= res!182438 (not (= lt!342869 (bvsub lt!342872 ((_ sign_extend 32) i!590)))))))

(assert (=> b!216858 (= lt!342872 (bvadd lt!342861 ((_ sign_extend 32) nBits!348)))))

(declare-fun b!216859 () Bool)

(declare-fun res!182453 () Bool)

(assert (=> b!216859 (=> res!182453 e!147490)))

(declare-fun isPrefixOf!0 (BitStream!8424 BitStream!8424) Bool)

(assert (=> b!216859 (= res!182453 (not (isPrefixOf!0 (_2!9909 lt!342867) (_2!9909 lt!342877))))))

(declare-fun res!182444 () Bool)

(assert (=> start!45032 (=> (not res!182444) (not e!147488))))

(assert (=> start!45032 (= res!182444 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45032 e!147488))

(assert (=> start!45032 true))

(declare-fun inv!12 (BitStream!8424) Bool)

(assert (=> start!45032 (and (inv!12 thiss!1204) e!147495)))

(declare-fun b!216846 () Bool)

(declare-fun res!182451 () Bool)

(assert (=> b!216846 (=> res!182451 e!147490)))

(assert (=> b!216846 (= res!182451 (not (isPrefixOf!0 thiss!1204 (_2!9909 lt!342867))))))

(declare-fun b!216860 () Bool)

(declare-fun res!182436 () Bool)

(assert (=> b!216860 (=> (not res!182436) (not e!147491))))

(assert (=> b!216860 (= res!182436 (invariant!0 (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204) (size!4658 (buf!5199 thiss!1204))))))

(declare-fun b!216861 () Bool)

(declare-fun res!182431 () Bool)

(assert (=> b!216861 (=> (not res!182431) (not e!147482))))

(assert (=> b!216861 (= res!182431 (isPrefixOf!0 thiss!1204 (_2!9909 lt!342867)))))

(declare-fun b!216862 () Bool)

(declare-fun res!182432 () Bool)

(assert (=> b!216862 (=> (not res!182432) (not e!147485))))

(assert (=> b!216862 (= res!182432 (= (_1!9911 lt!342886) (withMovedBitIndex!0 (_2!9911 lt!342886) (bvsub lt!342861 lt!342869))))))

(declare-fun b!216863 () Bool)

(declare-fun res!182435 () Bool)

(assert (=> b!216863 (=> res!182435 e!147481)))

(assert (=> b!216863 (= res!182435 (not (= (bitIndex!0 (size!4658 (buf!5199 (_1!9910 lt!342880))) (currentByte!9786 (_1!9910 lt!342880)) (currentBit!9781 (_1!9910 lt!342880))) (bitIndex!0 (size!4658 (buf!5199 (_2!9911 lt!342886))) (currentByte!9786 (_2!9911 lt!342886)) (currentBit!9781 (_2!9911 lt!342886))))))))

(declare-fun b!216864 () Bool)

(declare-fun e!147493 () Bool)

(assert (=> b!216864 (= e!147491 (not e!147493))))

(declare-fun res!182449 () Bool)

(assert (=> b!216864 (=> res!182449 e!147493)))

(assert (=> b!216864 (= res!182449 (not (= lt!342868 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!342861))))))

(assert (=> b!216864 (= lt!342868 (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))))))

(assert (=> b!216864 (= lt!342861 (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)))))

(assert (=> b!216864 e!147484))

(declare-fun res!182441 () Bool)

(assert (=> b!216864 (=> (not res!182441) (not e!147484))))

(assert (=> b!216864 (= res!182441 (= (size!4658 (buf!5199 thiss!1204)) (size!4658 (buf!5199 (_2!9909 lt!342867)))))))

(declare-fun appendBit!0 (BitStream!8424 Bool) tuple2!18502)

(assert (=> b!216864 (= lt!342867 (appendBit!0 thiss!1204 lt!342883))))

(assert (=> b!216864 (= lt!342883 (not (= (bvand v!189 lt!342862) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216864 (= lt!342862 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!216865 () Bool)

(declare-fun res!182433 () Bool)

(assert (=> b!216865 (=> res!182433 e!147489)))

(assert (=> b!216865 (= res!182433 (not (= (size!4658 (buf!5199 (_2!9909 lt!342877))) (size!4658 (buf!5199 thiss!1204)))))))

(declare-fun b!216866 () Bool)

(assert (=> b!216866 (= e!147493 e!147489)))

(declare-fun res!182442 () Bool)

(assert (=> b!216866 (=> res!182442 e!147489)))

(assert (=> b!216866 (= res!182442 (not (= lt!342869 (bvsub (bvsub (bvadd lt!342868 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!216866 (= lt!342869 (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342877))) (currentByte!9786 (_2!9909 lt!342877)) (currentBit!9781 (_2!9909 lt!342877))))))

(assert (=> b!216866 (isPrefixOf!0 thiss!1204 (_2!9909 lt!342877))))

(declare-fun lt!342865 () Unit!15435)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8424 BitStream!8424 BitStream!8424) Unit!15435)

(assert (=> b!216866 (= lt!342865 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9909 lt!342867) (_2!9909 lt!342877)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8424 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18502)

(assert (=> b!216866 (= lt!342877 (appendBitsLSBFirstLoopTR!0 (_2!9909 lt!342867) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!216867 () Bool)

(declare-fun res!182446 () Bool)

(assert (=> b!216867 (=> (not res!182446) (not e!147480))))

(assert (=> b!216867 (= res!182446 (= (_2!9910 lt!342880) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (= (and start!45032 res!182444) b!216849))

(assert (= (and b!216849 res!182430) b!216860))

(assert (= (and b!216860 res!182436) b!216852))

(assert (= (and b!216852 res!182440) b!216864))

(assert (= (and b!216864 res!182441) b!216850))

(assert (= (and b!216850 res!182447) b!216861))

(assert (= (and b!216861 res!182431) b!216855))

(assert (= (and b!216855 res!182439) b!216853))

(assert (= (and b!216864 (not res!182449)) b!216866))

(assert (= (and b!216866 (not res!182442)) b!216842))

(assert (= (and b!216842 (not res!182445)) b!216865))

(assert (= (and b!216865 (not res!182433)) b!216858))

(assert (= (and b!216858 (not res!182438)) b!216859))

(assert (= (and b!216859 (not res!182453)) b!216846))

(assert (= (and b!216846 (not res!182451)) b!216854))

(assert (= (and b!216854 res!182437) b!216843))

(assert (= (and b!216854 res!182443) b!216847))

(assert (= (and b!216854 (not res!182434)) b!216848))

(assert (= (and b!216848 res!182448) b!216862))

(assert (= (and b!216862 res!182432) b!216856))

(assert (= (and b!216856 res!182450) b!216844))

(assert (= (and b!216848 (not res!182452)) b!216863))

(assert (= (and b!216863 (not res!182435)) b!216845))

(assert (= (and b!216845 res!182429) b!216867))

(assert (= (and b!216867 res!182446) b!216851))

(assert (= start!45032 b!216857))

(declare-fun m!334491 () Bool)

(assert (=> b!216842 m!334491))

(declare-fun m!334493 () Bool)

(assert (=> b!216848 m!334493))

(declare-fun m!334495 () Bool)

(assert (=> b!216848 m!334495))

(declare-fun m!334497 () Bool)

(assert (=> b!216848 m!334497))

(declare-fun m!334499 () Bool)

(assert (=> b!216853 m!334499))

(declare-fun m!334501 () Bool)

(assert (=> b!216843 m!334501))

(declare-fun m!334503 () Bool)

(assert (=> b!216854 m!334503))

(declare-fun m!334505 () Bool)

(assert (=> b!216854 m!334505))

(declare-fun m!334507 () Bool)

(assert (=> b!216854 m!334507))

(declare-fun m!334509 () Bool)

(assert (=> b!216854 m!334509))

(declare-fun m!334511 () Bool)

(assert (=> b!216854 m!334511))

(declare-fun m!334513 () Bool)

(assert (=> b!216854 m!334513))

(declare-fun m!334515 () Bool)

(assert (=> b!216854 m!334515))

(declare-fun m!334517 () Bool)

(assert (=> b!216854 m!334517))

(declare-fun m!334519 () Bool)

(assert (=> b!216854 m!334519))

(declare-fun m!334521 () Bool)

(assert (=> b!216854 m!334521))

(declare-fun m!334523 () Bool)

(assert (=> b!216854 m!334523))

(declare-fun m!334525 () Bool)

(assert (=> b!216854 m!334525))

(declare-fun m!334527 () Bool)

(assert (=> b!216854 m!334527))

(declare-fun m!334529 () Bool)

(assert (=> b!216854 m!334529))

(declare-fun m!334531 () Bool)

(assert (=> b!216854 m!334531))

(declare-fun m!334533 () Bool)

(assert (=> b!216854 m!334533))

(declare-fun m!334535 () Bool)

(assert (=> b!216857 m!334535))

(declare-fun m!334537 () Bool)

(assert (=> b!216863 m!334537))

(declare-fun m!334539 () Bool)

(assert (=> b!216863 m!334539))

(declare-fun m!334541 () Bool)

(assert (=> b!216846 m!334541))

(declare-fun m!334543 () Bool)

(assert (=> b!216850 m!334543))

(declare-fun m!334545 () Bool)

(assert (=> b!216850 m!334545))

(declare-fun m!334547 () Bool)

(assert (=> b!216860 m!334547))

(declare-fun m!334549 () Bool)

(assert (=> b!216856 m!334549))

(declare-fun m!334551 () Bool)

(assert (=> b!216849 m!334551))

(assert (=> b!216864 m!334543))

(assert (=> b!216864 m!334545))

(declare-fun m!334553 () Bool)

(assert (=> b!216864 m!334553))

(declare-fun m!334555 () Bool)

(assert (=> b!216862 m!334555))

(declare-fun m!334557 () Bool)

(assert (=> b!216866 m!334557))

(declare-fun m!334559 () Bool)

(assert (=> b!216866 m!334559))

(declare-fun m!334561 () Bool)

(assert (=> b!216866 m!334561))

(declare-fun m!334563 () Bool)

(assert (=> b!216866 m!334563))

(declare-fun m!334565 () Bool)

(assert (=> b!216855 m!334565))

(assert (=> b!216855 m!334565))

(declare-fun m!334567 () Bool)

(assert (=> b!216855 m!334567))

(declare-fun m!334569 () Bool)

(assert (=> start!45032 m!334569))

(declare-fun m!334571 () Bool)

(assert (=> b!216867 m!334571))

(declare-fun m!334573 () Bool)

(assert (=> b!216859 m!334573))

(assert (=> b!216861 m!334541))

(check-sat (not b!216867) (not b!216855) (not b!216846) (not b!216843) (not b!216850) (not b!216859) (not b!216862) (not b!216860) (not b!216863) (not b!216854) (not b!216856) (not b!216857) (not b!216866) (not start!45032) (not b!216861) (not b!216842) (not b!216864) (not b!216848) (not b!216849) (not b!216853))
(check-sat)
(get-model)

(declare-fun d!73497 () Bool)

(declare-datatypes ((tuple2!18518 0))(
  ( (tuple2!18519 (_1!9917 Bool) (_2!9917 BitStream!8424)) )
))
(declare-fun lt!342986 () tuple2!18518)

(declare-fun readBit!0 (BitStream!8424) tuple2!18518)

(assert (=> d!73497 (= lt!342986 (readBit!0 (BitStream!8425 (buf!5199 (_2!9909 lt!342877)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204))))))

(assert (=> d!73497 (= (readBitPure!0 (BitStream!8425 (buf!5199 (_2!9909 lt!342877)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204))) (tuple2!18509 (_2!9917 lt!342986) (_1!9917 lt!342986)))))

(declare-fun bs!17955 () Bool)

(assert (= bs!17955 d!73497))

(declare-fun m!334659 () Bool)

(assert (=> bs!17955 m!334659))

(assert (=> b!216854 d!73497))

(declare-fun d!73499 () Bool)

(declare-fun e!147546 () Bool)

(assert (=> d!73499 e!147546))

(declare-fun res!182533 () Bool)

(assert (=> d!73499 (=> (not res!182533) (not e!147546))))

(declare-fun lt!343003 () (_ BitVec 64))

(declare-fun lt!343001 () (_ BitVec 64))

(declare-fun lt!343000 () (_ BitVec 64))

(assert (=> d!73499 (= res!182533 (= lt!343001 (bvsub lt!343000 lt!343003)))))

(assert (=> d!73499 (or (= (bvand lt!343000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343003 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343000 lt!343003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!73499 (= lt!343003 (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9912 lt!342864)))) ((_ sign_extend 32) (currentByte!9786 (_1!9912 lt!342864))) ((_ sign_extend 32) (currentBit!9781 (_1!9912 lt!342864)))))))

(declare-fun lt!343004 () (_ BitVec 64))

(declare-fun lt!342999 () (_ BitVec 64))

(assert (=> d!73499 (= lt!343000 (bvmul lt!343004 lt!342999))))

(assert (=> d!73499 (or (= lt!343004 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342999 (bvsdiv (bvmul lt!343004 lt!342999) lt!343004)))))

(assert (=> d!73499 (= lt!342999 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73499 (= lt!343004 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9912 lt!342864)))))))

(assert (=> d!73499 (= lt!343001 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9786 (_1!9912 lt!342864))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9781 (_1!9912 lt!342864)))))))

(assert (=> d!73499 (invariant!0 (currentBit!9781 (_1!9912 lt!342864)) (currentByte!9786 (_1!9912 lt!342864)) (size!4658 (buf!5199 (_1!9912 lt!342864))))))

(assert (=> d!73499 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!342864))) (currentByte!9786 (_1!9912 lt!342864)) (currentBit!9781 (_1!9912 lt!342864))) lt!343001)))

(declare-fun b!216950 () Bool)

(declare-fun res!182534 () Bool)

(assert (=> b!216950 (=> (not res!182534) (not e!147546))))

(assert (=> b!216950 (= res!182534 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343001))))

(declare-fun b!216951 () Bool)

(declare-fun lt!343002 () (_ BitVec 64))

(assert (=> b!216951 (= e!147546 (bvsle lt!343001 (bvmul lt!343002 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216951 (or (= lt!343002 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343002 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343002)))))

(assert (=> b!216951 (= lt!343002 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9912 lt!342864)))))))

(assert (= (and d!73499 res!182533) b!216950))

(assert (= (and b!216950 res!182534) b!216951))

(declare-fun m!334661 () Bool)

(assert (=> d!73499 m!334661))

(declare-fun m!334663 () Bool)

(assert (=> d!73499 m!334663))

(assert (=> b!216854 d!73499))

(declare-fun d!73501 () Bool)

(assert (=> d!73501 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867))) lt!342863)))

(declare-fun lt!343007 () Unit!15435)

(declare-fun choose!9 (BitStream!8424 array!10606 (_ BitVec 64) BitStream!8424) Unit!15435)

(assert (=> d!73501 (= lt!343007 (choose!9 (_2!9909 lt!342867) (buf!5199 (_2!9909 lt!342877)) lt!342863 (BitStream!8425 (buf!5199 (_2!9909 lt!342877)) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867)))))))

(assert (=> d!73501 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9909 lt!342867) (buf!5199 (_2!9909 lt!342877)) lt!342863) lt!343007)))

(declare-fun bs!17956 () Bool)

(assert (= bs!17956 d!73501))

(assert (=> bs!17956 m!334519))

(declare-fun m!334665 () Bool)

(assert (=> bs!17956 m!334665))

(assert (=> b!216854 d!73501))

(declare-fun d!73503 () Bool)

(declare-fun e!147547 () Bool)

(assert (=> d!73503 e!147547))

(declare-fun res!182535 () Bool)

(assert (=> d!73503 (=> (not res!182535) (not e!147547))))

(declare-fun lt!343009 () (_ BitVec 64))

(declare-fun lt!343010 () (_ BitVec 64))

(declare-fun lt!343012 () (_ BitVec 64))

(assert (=> d!73503 (= res!182535 (= lt!343010 (bvsub lt!343009 lt!343012)))))

(assert (=> d!73503 (or (= (bvand lt!343009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343012 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343009 lt!343012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73503 (= lt!343012 (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9912 lt!342866)))) ((_ sign_extend 32) (currentByte!9786 (_1!9912 lt!342866))) ((_ sign_extend 32) (currentBit!9781 (_1!9912 lt!342866)))))))

(declare-fun lt!343013 () (_ BitVec 64))

(declare-fun lt!343008 () (_ BitVec 64))

(assert (=> d!73503 (= lt!343009 (bvmul lt!343013 lt!343008))))

(assert (=> d!73503 (or (= lt!343013 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343008 (bvsdiv (bvmul lt!343013 lt!343008) lt!343013)))))

(assert (=> d!73503 (= lt!343008 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73503 (= lt!343013 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9912 lt!342866)))))))

(assert (=> d!73503 (= lt!343010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9786 (_1!9912 lt!342866))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9781 (_1!9912 lt!342866)))))))

(assert (=> d!73503 (invariant!0 (currentBit!9781 (_1!9912 lt!342866)) (currentByte!9786 (_1!9912 lt!342866)) (size!4658 (buf!5199 (_1!9912 lt!342866))))))

(assert (=> d!73503 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!342866))) (currentByte!9786 (_1!9912 lt!342866)) (currentBit!9781 (_1!9912 lt!342866))) lt!343010)))

(declare-fun b!216952 () Bool)

(declare-fun res!182536 () Bool)

(assert (=> b!216952 (=> (not res!182536) (not e!147547))))

(assert (=> b!216952 (= res!182536 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343010))))

(declare-fun b!216953 () Bool)

(declare-fun lt!343011 () (_ BitVec 64))

(assert (=> b!216953 (= e!147547 (bvsle lt!343010 (bvmul lt!343011 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216953 (or (= lt!343011 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343011 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343011)))))

(assert (=> b!216953 (= lt!343011 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9912 lt!342866)))))))

(assert (= (and d!73503 res!182535) b!216952))

(assert (= (and b!216952 res!182536) b!216953))

(declare-fun m!334667 () Bool)

(assert (=> d!73503 m!334667))

(declare-fun m!334669 () Bool)

(assert (=> d!73503 m!334669))

(assert (=> b!216854 d!73503))

(declare-datatypes ((tuple2!18520 0))(
  ( (tuple2!18521 (_1!9918 (_ BitVec 64)) (_2!9918 BitStream!8424)) )
))
(declare-fun lt!343016 () tuple2!18520)

(declare-fun d!73505 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18520)

(assert (=> d!73505 (= lt!343016 (readNBitsLSBFirstsLoop!0 (_1!9911 lt!342881) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342873))))

(assert (=> d!73505 (= (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!342881) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342873) (tuple2!18505 (_2!9918 lt!343016) (_1!9918 lt!343016)))))

(declare-fun bs!17957 () Bool)

(assert (= bs!17957 d!73505))

(declare-fun m!334671 () Bool)

(assert (=> bs!17957 m!334671))

(assert (=> b!216854 d!73505))

(declare-fun d!73507 () Bool)

(assert (=> d!73507 (= (invariant!0 (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204) (size!4658 (buf!5199 (_2!9909 lt!342867)))) (and (bvsge (currentBit!9781 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9781 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9786 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9786 thiss!1204) (size!4658 (buf!5199 (_2!9909 lt!342867)))) (and (= (currentBit!9781 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9786 thiss!1204) (size!4658 (buf!5199 (_2!9909 lt!342867))))))))))

(assert (=> b!216854 d!73507))

(declare-fun lt!343017 () tuple2!18520)

(declare-fun d!73509 () Bool)

(assert (=> d!73509 (= lt!343017 (readNBitsLSBFirstsLoop!0 (_1!9911 lt!342886) nBits!348 i!590 lt!342876))))

(assert (=> d!73509 (= (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!342886) nBits!348 i!590 lt!342876) (tuple2!18505 (_2!9918 lt!343017) (_1!9918 lt!343017)))))

(declare-fun bs!17958 () Bool)

(assert (= bs!17958 d!73509))

(declare-fun m!334673 () Bool)

(assert (=> bs!17958 m!334673))

(assert (=> b!216854 d!73509))

(declare-fun d!73511 () Bool)

(assert (=> d!73511 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))) ((_ sign_extend 32) (currentByte!9786 thiss!1204)) ((_ sign_extend 32) (currentBit!9781 thiss!1204)) lt!342878) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))) ((_ sign_extend 32) (currentByte!9786 thiss!1204)) ((_ sign_extend 32) (currentBit!9781 thiss!1204))) lt!342878))))

(declare-fun bs!17959 () Bool)

(assert (= bs!17959 d!73511))

(declare-fun m!334675 () Bool)

(assert (=> bs!17959 m!334675))

(assert (=> b!216854 d!73511))

(declare-fun d!73513 () Bool)

(declare-fun lt!343018 () tuple2!18518)

(assert (=> d!73513 (= lt!343018 (readBit!0 (_1!9911 lt!342886)))))

(assert (=> d!73513 (= (readBitPure!0 (_1!9911 lt!342886)) (tuple2!18509 (_2!9917 lt!343018) (_1!9917 lt!343018)))))

(declare-fun bs!17960 () Bool)

(assert (= bs!17960 d!73513))

(declare-fun m!334677 () Bool)

(assert (=> bs!17960 m!334677))

(assert (=> b!216854 d!73513))

(declare-fun lt!343068 () (_ BitVec 64))

(declare-fun e!147553 () Bool)

(declare-fun b!216964 () Bool)

(declare-fun lt!343067 () tuple2!18506)

(declare-fun lt!343077 () (_ BitVec 64))

(assert (=> b!216964 (= e!147553 (= (_1!9911 lt!343067) (withMovedBitIndex!0 (_2!9911 lt!343067) (bvsub lt!343077 lt!343068))))))

(assert (=> b!216964 (or (= (bvand lt!343077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343077 lt!343068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216964 (= lt!343068 (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342877))) (currentByte!9786 (_2!9909 lt!342877)) (currentBit!9781 (_2!9909 lt!342877))))))

(assert (=> b!216964 (= lt!343077 (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)))))

(declare-fun d!73515 () Bool)

(assert (=> d!73515 e!147553))

(declare-fun res!182544 () Bool)

(assert (=> d!73515 (=> (not res!182544) (not e!147553))))

(assert (=> d!73515 (= res!182544 (isPrefixOf!0 (_1!9911 lt!343067) (_2!9911 lt!343067)))))

(declare-fun lt!343069 () BitStream!8424)

(assert (=> d!73515 (= lt!343067 (tuple2!18507 lt!343069 (_2!9909 lt!342877)))))

(declare-fun lt!343061 () Unit!15435)

(declare-fun lt!343075 () Unit!15435)

(assert (=> d!73515 (= lt!343061 lt!343075)))

(assert (=> d!73515 (isPrefixOf!0 lt!343069 (_2!9909 lt!342877))))

(assert (=> d!73515 (= lt!343075 (lemmaIsPrefixTransitive!0 lt!343069 (_2!9909 lt!342877) (_2!9909 lt!342877)))))

(declare-fun lt!343072 () Unit!15435)

(declare-fun lt!343064 () Unit!15435)

(assert (=> d!73515 (= lt!343072 lt!343064)))

(assert (=> d!73515 (isPrefixOf!0 lt!343069 (_2!9909 lt!342877))))

(assert (=> d!73515 (= lt!343064 (lemmaIsPrefixTransitive!0 lt!343069 thiss!1204 (_2!9909 lt!342877)))))

(declare-fun lt!343078 () Unit!15435)

(declare-fun e!147552 () Unit!15435)

(assert (=> d!73515 (= lt!343078 e!147552)))

(declare-fun c!10601 () Bool)

(assert (=> d!73515 (= c!10601 (not (= (size!4658 (buf!5199 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!343059 () Unit!15435)

(declare-fun lt!343060 () Unit!15435)

(assert (=> d!73515 (= lt!343059 lt!343060)))

(assert (=> d!73515 (isPrefixOf!0 (_2!9909 lt!342877) (_2!9909 lt!342877))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8424) Unit!15435)

(assert (=> d!73515 (= lt!343060 (lemmaIsPrefixRefl!0 (_2!9909 lt!342877)))))

(declare-fun lt!343065 () Unit!15435)

(declare-fun lt!343063 () Unit!15435)

(assert (=> d!73515 (= lt!343065 lt!343063)))

(assert (=> d!73515 (= lt!343063 (lemmaIsPrefixRefl!0 (_2!9909 lt!342877)))))

(declare-fun lt!343070 () Unit!15435)

(declare-fun lt!343066 () Unit!15435)

(assert (=> d!73515 (= lt!343070 lt!343066)))

(assert (=> d!73515 (isPrefixOf!0 lt!343069 lt!343069)))

(assert (=> d!73515 (= lt!343066 (lemmaIsPrefixRefl!0 lt!343069))))

(declare-fun lt!343071 () Unit!15435)

(declare-fun lt!343074 () Unit!15435)

(assert (=> d!73515 (= lt!343071 lt!343074)))

(assert (=> d!73515 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!73515 (= lt!343074 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!73515 (= lt!343069 (BitStream!8425 (buf!5199 (_2!9909 lt!342877)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)))))

(assert (=> d!73515 (isPrefixOf!0 thiss!1204 (_2!9909 lt!342877))))

(assert (=> d!73515 (= (reader!0 thiss!1204 (_2!9909 lt!342877)) lt!343067)))

(declare-fun b!216965 () Bool)

(declare-fun Unit!15439 () Unit!15435)

(assert (=> b!216965 (= e!147552 Unit!15439)))

(declare-fun b!216966 () Bool)

(declare-fun res!182545 () Bool)

(assert (=> b!216966 (=> (not res!182545) (not e!147553))))

(assert (=> b!216966 (= res!182545 (isPrefixOf!0 (_2!9911 lt!343067) (_2!9909 lt!342877)))))

(declare-fun b!216967 () Bool)

(declare-fun lt!343073 () Unit!15435)

(assert (=> b!216967 (= e!147552 lt!343073)))

(declare-fun lt!343076 () (_ BitVec 64))

(assert (=> b!216967 (= lt!343076 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!343062 () (_ BitVec 64))

(assert (=> b!216967 (= lt!343062 (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10606 array!10606 (_ BitVec 64) (_ BitVec 64)) Unit!15435)

(assert (=> b!216967 (= lt!343073 (arrayBitRangesEqSymmetric!0 (buf!5199 thiss!1204) (buf!5199 (_2!9909 lt!342877)) lt!343076 lt!343062))))

(declare-fun arrayBitRangesEq!0 (array!10606 array!10606 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!216967 (arrayBitRangesEq!0 (buf!5199 (_2!9909 lt!342877)) (buf!5199 thiss!1204) lt!343076 lt!343062)))

(declare-fun b!216968 () Bool)

(declare-fun res!182543 () Bool)

(assert (=> b!216968 (=> (not res!182543) (not e!147553))))

(assert (=> b!216968 (= res!182543 (isPrefixOf!0 (_1!9911 lt!343067) thiss!1204))))

(assert (= (and d!73515 c!10601) b!216967))

(assert (= (and d!73515 (not c!10601)) b!216965))

(assert (= (and d!73515 res!182544) b!216968))

(assert (= (and b!216968 res!182543) b!216966))

(assert (= (and b!216966 res!182545) b!216964))

(declare-fun m!334679 () Bool)

(assert (=> b!216964 m!334679))

(assert (=> b!216964 m!334557))

(assert (=> b!216964 m!334545))

(declare-fun m!334681 () Bool)

(assert (=> b!216968 m!334681))

(declare-fun m!334683 () Bool)

(assert (=> b!216966 m!334683))

(assert (=> b!216967 m!334545))

(declare-fun m!334685 () Bool)

(assert (=> b!216967 m!334685))

(declare-fun m!334687 () Bool)

(assert (=> b!216967 m!334687))

(declare-fun m!334689 () Bool)

(assert (=> d!73515 m!334689))

(declare-fun m!334691 () Bool)

(assert (=> d!73515 m!334691))

(assert (=> d!73515 m!334559))

(declare-fun m!334693 () Bool)

(assert (=> d!73515 m!334693))

(declare-fun m!334695 () Bool)

(assert (=> d!73515 m!334695))

(declare-fun m!334697 () Bool)

(assert (=> d!73515 m!334697))

(declare-fun m!334699 () Bool)

(assert (=> d!73515 m!334699))

(declare-fun m!334701 () Bool)

(assert (=> d!73515 m!334701))

(declare-fun m!334703 () Bool)

(assert (=> d!73515 m!334703))

(declare-fun m!334705 () Bool)

(assert (=> d!73515 m!334705))

(declare-fun m!334707 () Bool)

(assert (=> d!73515 m!334707))

(assert (=> b!216854 d!73515))

(declare-fun d!73517 () Bool)

(assert (=> d!73517 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867))) lt!342863) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867)))) lt!342863))))

(declare-fun bs!17961 () Bool)

(assert (= bs!17961 d!73517))

(declare-fun m!334709 () Bool)

(assert (=> bs!17961 m!334709))

(assert (=> b!216854 d!73517))

(declare-fun e!147555 () Bool)

(declare-fun lt!343097 () (_ BitVec 64))

(declare-fun lt!343087 () tuple2!18506)

(declare-fun b!216969 () Bool)

(declare-fun lt!343088 () (_ BitVec 64))

(assert (=> b!216969 (= e!147555 (= (_1!9911 lt!343087) (withMovedBitIndex!0 (_2!9911 lt!343087) (bvsub lt!343097 lt!343088))))))

(assert (=> b!216969 (or (= (bvand lt!343097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343088 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343097 lt!343088) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216969 (= lt!343088 (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342877))) (currentByte!9786 (_2!9909 lt!342877)) (currentBit!9781 (_2!9909 lt!342877))))))

(assert (=> b!216969 (= lt!343097 (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))))))

(declare-fun d!73519 () Bool)

(assert (=> d!73519 e!147555))

(declare-fun res!182547 () Bool)

(assert (=> d!73519 (=> (not res!182547) (not e!147555))))

(assert (=> d!73519 (= res!182547 (isPrefixOf!0 (_1!9911 lt!343087) (_2!9911 lt!343087)))))

(declare-fun lt!343089 () BitStream!8424)

(assert (=> d!73519 (= lt!343087 (tuple2!18507 lt!343089 (_2!9909 lt!342877)))))

(declare-fun lt!343081 () Unit!15435)

(declare-fun lt!343095 () Unit!15435)

(assert (=> d!73519 (= lt!343081 lt!343095)))

(assert (=> d!73519 (isPrefixOf!0 lt!343089 (_2!9909 lt!342877))))

(assert (=> d!73519 (= lt!343095 (lemmaIsPrefixTransitive!0 lt!343089 (_2!9909 lt!342877) (_2!9909 lt!342877)))))

(declare-fun lt!343092 () Unit!15435)

(declare-fun lt!343084 () Unit!15435)

(assert (=> d!73519 (= lt!343092 lt!343084)))

(assert (=> d!73519 (isPrefixOf!0 lt!343089 (_2!9909 lt!342877))))

(assert (=> d!73519 (= lt!343084 (lemmaIsPrefixTransitive!0 lt!343089 (_2!9909 lt!342867) (_2!9909 lt!342877)))))

(declare-fun lt!343098 () Unit!15435)

(declare-fun e!147554 () Unit!15435)

(assert (=> d!73519 (= lt!343098 e!147554)))

(declare-fun c!10602 () Bool)

(assert (=> d!73519 (= c!10602 (not (= (size!4658 (buf!5199 (_2!9909 lt!342867))) #b00000000000000000000000000000000)))))

(declare-fun lt!343079 () Unit!15435)

(declare-fun lt!343080 () Unit!15435)

(assert (=> d!73519 (= lt!343079 lt!343080)))

(assert (=> d!73519 (isPrefixOf!0 (_2!9909 lt!342877) (_2!9909 lt!342877))))

(assert (=> d!73519 (= lt!343080 (lemmaIsPrefixRefl!0 (_2!9909 lt!342877)))))

(declare-fun lt!343085 () Unit!15435)

(declare-fun lt!343083 () Unit!15435)

(assert (=> d!73519 (= lt!343085 lt!343083)))

(assert (=> d!73519 (= lt!343083 (lemmaIsPrefixRefl!0 (_2!9909 lt!342877)))))

(declare-fun lt!343090 () Unit!15435)

(declare-fun lt!343086 () Unit!15435)

(assert (=> d!73519 (= lt!343090 lt!343086)))

(assert (=> d!73519 (isPrefixOf!0 lt!343089 lt!343089)))

(assert (=> d!73519 (= lt!343086 (lemmaIsPrefixRefl!0 lt!343089))))

(declare-fun lt!343091 () Unit!15435)

(declare-fun lt!343094 () Unit!15435)

(assert (=> d!73519 (= lt!343091 lt!343094)))

(assert (=> d!73519 (isPrefixOf!0 (_2!9909 lt!342867) (_2!9909 lt!342867))))

(assert (=> d!73519 (= lt!343094 (lemmaIsPrefixRefl!0 (_2!9909 lt!342867)))))

(assert (=> d!73519 (= lt!343089 (BitStream!8425 (buf!5199 (_2!9909 lt!342877)) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))))))

(assert (=> d!73519 (isPrefixOf!0 (_2!9909 lt!342867) (_2!9909 lt!342877))))

(assert (=> d!73519 (= (reader!0 (_2!9909 lt!342867) (_2!9909 lt!342877)) lt!343087)))

(declare-fun b!216970 () Bool)

(declare-fun Unit!15440 () Unit!15435)

(assert (=> b!216970 (= e!147554 Unit!15440)))

(declare-fun b!216971 () Bool)

(declare-fun res!182548 () Bool)

(assert (=> b!216971 (=> (not res!182548) (not e!147555))))

(assert (=> b!216971 (= res!182548 (isPrefixOf!0 (_2!9911 lt!343087) (_2!9909 lt!342877)))))

(declare-fun b!216972 () Bool)

(declare-fun lt!343093 () Unit!15435)

(assert (=> b!216972 (= e!147554 lt!343093)))

(declare-fun lt!343096 () (_ BitVec 64))

(assert (=> b!216972 (= lt!343096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!343082 () (_ BitVec 64))

(assert (=> b!216972 (= lt!343082 (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))))))

(assert (=> b!216972 (= lt!343093 (arrayBitRangesEqSymmetric!0 (buf!5199 (_2!9909 lt!342867)) (buf!5199 (_2!9909 lt!342877)) lt!343096 lt!343082))))

(assert (=> b!216972 (arrayBitRangesEq!0 (buf!5199 (_2!9909 lt!342877)) (buf!5199 (_2!9909 lt!342867)) lt!343096 lt!343082)))

(declare-fun b!216973 () Bool)

(declare-fun res!182546 () Bool)

(assert (=> b!216973 (=> (not res!182546) (not e!147555))))

(assert (=> b!216973 (= res!182546 (isPrefixOf!0 (_1!9911 lt!343087) (_2!9909 lt!342867)))))

(assert (= (and d!73519 c!10602) b!216972))

(assert (= (and d!73519 (not c!10602)) b!216970))

(assert (= (and d!73519 res!182547) b!216973))

(assert (= (and b!216973 res!182546) b!216971))

(assert (= (and b!216971 res!182548) b!216969))

(declare-fun m!334711 () Bool)

(assert (=> b!216969 m!334711))

(assert (=> b!216969 m!334557))

(assert (=> b!216969 m!334543))

(declare-fun m!334713 () Bool)

(assert (=> b!216973 m!334713))

(declare-fun m!334715 () Bool)

(assert (=> b!216971 m!334715))

(assert (=> b!216972 m!334543))

(declare-fun m!334717 () Bool)

(assert (=> b!216972 m!334717))

(declare-fun m!334719 () Bool)

(assert (=> b!216972 m!334719))

(declare-fun m!334721 () Bool)

(assert (=> d!73519 m!334721))

(declare-fun m!334723 () Bool)

(assert (=> d!73519 m!334723))

(assert (=> d!73519 m!334573))

(declare-fun m!334725 () Bool)

(assert (=> d!73519 m!334725))

(declare-fun m!334727 () Bool)

(assert (=> d!73519 m!334727))

(declare-fun m!334729 () Bool)

(assert (=> d!73519 m!334729))

(assert (=> d!73519 m!334699))

(declare-fun m!334731 () Bool)

(assert (=> d!73519 m!334731))

(assert (=> d!73519 m!334703))

(declare-fun m!334733 () Bool)

(assert (=> d!73519 m!334733))

(declare-fun m!334735 () Bool)

(assert (=> d!73519 m!334735))

(assert (=> b!216854 d!73519))

(declare-fun d!73521 () Bool)

(assert (=> d!73521 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!216854 d!73521))

(declare-fun d!73523 () Bool)

(assert (=> d!73523 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))) ((_ sign_extend 32) (currentByte!9786 thiss!1204)) ((_ sign_extend 32) (currentBit!9781 thiss!1204)) lt!342878)))

(declare-fun lt!343099 () Unit!15435)

(assert (=> d!73523 (= lt!343099 (choose!9 thiss!1204 (buf!5199 (_2!9909 lt!342877)) lt!342878 (BitStream!8425 (buf!5199 (_2!9909 lt!342877)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204))))))

(assert (=> d!73523 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5199 (_2!9909 lt!342877)) lt!342878) lt!343099)))

(declare-fun bs!17962 () Bool)

(assert (= bs!17962 d!73523))

(assert (=> bs!17962 m!334511))

(declare-fun m!334737 () Bool)

(assert (=> bs!17962 m!334737))

(assert (=> b!216854 d!73523))

(declare-fun d!73525 () Bool)

(declare-fun lt!343100 () tuple2!18518)

(assert (=> d!73525 (= lt!343100 (readBit!0 lt!342860))))

(assert (=> d!73525 (= (readBitPure!0 lt!342860) (tuple2!18509 (_2!9917 lt!343100) (_1!9917 lt!343100)))))

(declare-fun bs!17963 () Bool)

(assert (= bs!17963 d!73525))

(declare-fun m!334739 () Bool)

(assert (=> bs!17963 m!334739))

(assert (=> b!216854 d!73525))

(declare-fun d!73527 () Bool)

(declare-fun e!147558 () Bool)

(assert (=> d!73527 e!147558))

(declare-fun res!182551 () Bool)

(assert (=> d!73527 (=> (not res!182551) (not e!147558))))

(declare-fun lt!343110 () tuple2!18508)

(declare-fun lt!343109 () tuple2!18508)

(assert (=> d!73527 (= res!182551 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!343110))) (currentByte!9786 (_1!9912 lt!343110)) (currentBit!9781 (_1!9912 lt!343110))) (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!343109))) (currentByte!9786 (_1!9912 lt!343109)) (currentBit!9781 (_1!9912 lt!343109)))))))

(declare-fun lt!343111 () BitStream!8424)

(declare-fun lt!343112 () Unit!15435)

(declare-fun choose!50 (BitStream!8424 BitStream!8424 BitStream!8424 tuple2!18508 tuple2!18508 BitStream!8424 Bool tuple2!18508 tuple2!18508 BitStream!8424 Bool) Unit!15435)

(assert (=> d!73527 (= lt!343112 (choose!50 lt!342860 (_2!9909 lt!342877) lt!343111 lt!343110 (tuple2!18509 (_1!9912 lt!343110) (_2!9912 lt!343110)) (_1!9912 lt!343110) (_2!9912 lt!343110) lt!343109 (tuple2!18509 (_1!9912 lt!343109) (_2!9912 lt!343109)) (_1!9912 lt!343109) (_2!9912 lt!343109)))))

(assert (=> d!73527 (= lt!343109 (readBitPure!0 lt!343111))))

(assert (=> d!73527 (= lt!343110 (readBitPure!0 lt!342860))))

(assert (=> d!73527 (= lt!343111 (BitStream!8425 (buf!5199 (_2!9909 lt!342877)) (currentByte!9786 lt!342860) (currentBit!9781 lt!342860)))))

(assert (=> d!73527 (invariant!0 (currentBit!9781 lt!342860) (currentByte!9786 lt!342860) (size!4658 (buf!5199 (_2!9909 lt!342877))))))

(assert (=> d!73527 (= (readBitPrefixLemma!0 lt!342860 (_2!9909 lt!342877)) lt!343112)))

(declare-fun b!216976 () Bool)

(assert (=> b!216976 (= e!147558 (= (_2!9912 lt!343110) (_2!9912 lt!343109)))))

(assert (= (and d!73527 res!182551) b!216976))

(declare-fun m!334741 () Bool)

(assert (=> d!73527 m!334741))

(assert (=> d!73527 m!334515))

(declare-fun m!334743 () Bool)

(assert (=> d!73527 m!334743))

(declare-fun m!334745 () Bool)

(assert (=> d!73527 m!334745))

(declare-fun m!334747 () Bool)

(assert (=> d!73527 m!334747))

(declare-fun m!334749 () Bool)

(assert (=> d!73527 m!334749))

(assert (=> b!216854 d!73527))

(declare-fun d!73529 () Bool)

(declare-fun lt!343113 () tuple2!18518)

(assert (=> d!73529 (= lt!343113 (readBit!0 (readerFrom!0 (_2!9909 lt!342867) (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204))))))

(assert (=> d!73529 (= (readBitPure!0 (readerFrom!0 (_2!9909 lt!342867) (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204))) (tuple2!18509 (_2!9917 lt!343113) (_1!9917 lt!343113)))))

(declare-fun bs!17964 () Bool)

(assert (= bs!17964 d!73529))

(assert (=> bs!17964 m!334565))

(declare-fun m!334751 () Bool)

(assert (=> bs!17964 m!334751))

(assert (=> b!216855 d!73529))

(declare-fun d!73531 () Bool)

(declare-fun e!147561 () Bool)

(assert (=> d!73531 e!147561))

(declare-fun res!182555 () Bool)

(assert (=> d!73531 (=> (not res!182555) (not e!147561))))

(assert (=> d!73531 (= res!182555 (invariant!0 (currentBit!9781 (_2!9909 lt!342867)) (currentByte!9786 (_2!9909 lt!342867)) (size!4658 (buf!5199 (_2!9909 lt!342867)))))))

(assert (=> d!73531 (= (readerFrom!0 (_2!9909 lt!342867) (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204)) (BitStream!8425 (buf!5199 (_2!9909 lt!342867)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)))))

(declare-fun b!216979 () Bool)

(assert (=> b!216979 (= e!147561 (invariant!0 (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204) (size!4658 (buf!5199 (_2!9909 lt!342867)))))))

(assert (= (and d!73531 res!182555) b!216979))

(declare-fun m!334753 () Bool)

(assert (=> d!73531 m!334753))

(assert (=> b!216979 m!334529))

(assert (=> b!216855 d!73531))

(declare-fun d!73533 () Bool)

(declare-fun e!147562 () Bool)

(assert (=> d!73533 e!147562))

(declare-fun res!182556 () Bool)

(assert (=> d!73533 (=> (not res!182556) (not e!147562))))

(declare-fun lt!343118 () (_ BitVec 64))

(declare-fun lt!343116 () (_ BitVec 64))

(declare-fun lt!343115 () (_ BitVec 64))

(assert (=> d!73533 (= res!182556 (= lt!343116 (bvsub lt!343115 lt!343118)))))

(assert (=> d!73533 (or (= (bvand lt!343115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343118 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343115 lt!343118) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73533 (= lt!343118 (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9912 lt!342870)))) ((_ sign_extend 32) (currentByte!9786 (_1!9912 lt!342870))) ((_ sign_extend 32) (currentBit!9781 (_1!9912 lt!342870)))))))

(declare-fun lt!343119 () (_ BitVec 64))

(declare-fun lt!343114 () (_ BitVec 64))

(assert (=> d!73533 (= lt!343115 (bvmul lt!343119 lt!343114))))

(assert (=> d!73533 (or (= lt!343119 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343114 (bvsdiv (bvmul lt!343119 lt!343114) lt!343119)))))

(assert (=> d!73533 (= lt!343114 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73533 (= lt!343119 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9912 lt!342870)))))))

(assert (=> d!73533 (= lt!343116 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9786 (_1!9912 lt!342870))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9781 (_1!9912 lt!342870)))))))

(assert (=> d!73533 (invariant!0 (currentBit!9781 (_1!9912 lt!342870)) (currentByte!9786 (_1!9912 lt!342870)) (size!4658 (buf!5199 (_1!9912 lt!342870))))))

(assert (=> d!73533 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!342870))) (currentByte!9786 (_1!9912 lt!342870)) (currentBit!9781 (_1!9912 lt!342870))) lt!343116)))

(declare-fun b!216980 () Bool)

(declare-fun res!182557 () Bool)

(assert (=> b!216980 (=> (not res!182557) (not e!147562))))

(assert (=> b!216980 (= res!182557 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343116))))

(declare-fun b!216981 () Bool)

(declare-fun lt!343117 () (_ BitVec 64))

(assert (=> b!216981 (= e!147562 (bvsle lt!343116 (bvmul lt!343117 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216981 (or (= lt!343117 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343117 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343117)))))

(assert (=> b!216981 (= lt!343117 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9912 lt!342870)))))))

(assert (= (and d!73533 res!182556) b!216980))

(assert (= (and b!216980 res!182557) b!216981))

(declare-fun m!334755 () Bool)

(assert (=> d!73533 m!334755))

(declare-fun m!334757 () Bool)

(assert (=> d!73533 m!334757))

(assert (=> b!216853 d!73533))

(declare-fun d!73535 () Bool)

(assert (=> d!73535 (= (invariant!0 (currentBit!9781 (_2!9909 lt!342877)) (currentByte!9786 (_2!9909 lt!342877)) (size!4658 (buf!5199 (_2!9909 lt!342877)))) (and (bvsge (currentBit!9781 (_2!9909 lt!342877)) #b00000000000000000000000000000000) (bvslt (currentBit!9781 (_2!9909 lt!342877)) #b00000000000000000000000000001000) (bvsge (currentByte!9786 (_2!9909 lt!342877)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9786 (_2!9909 lt!342877)) (size!4658 (buf!5199 (_2!9909 lt!342877)))) (and (= (currentBit!9781 (_2!9909 lt!342877)) #b00000000000000000000000000000000) (= (currentByte!9786 (_2!9909 lt!342877)) (size!4658 (buf!5199 (_2!9909 lt!342877))))))))))

(assert (=> b!216842 d!73535))

(declare-fun d!73537 () Bool)

(assert (=> d!73537 (= (invariant!0 (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204) (size!4658 (buf!5199 (_2!9909 lt!342877)))) (and (bvsge (currentBit!9781 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9781 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9786 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9786 thiss!1204) (size!4658 (buf!5199 (_2!9909 lt!342877)))) (and (= (currentBit!9781 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9786 thiss!1204) (size!4658 (buf!5199 (_2!9909 lt!342877))))))))))

(assert (=> b!216843 d!73537))

(declare-fun d!73539 () Bool)

(declare-fun e!147563 () Bool)

(assert (=> d!73539 e!147563))

(declare-fun res!182558 () Bool)

(assert (=> d!73539 (=> (not res!182558) (not e!147563))))

(declare-fun lt!343121 () (_ BitVec 64))

(declare-fun lt!343122 () (_ BitVec 64))

(declare-fun lt!343124 () (_ BitVec 64))

(assert (=> d!73539 (= res!182558 (= lt!343122 (bvsub lt!343121 lt!343124)))))

(assert (=> d!73539 (or (= (bvand lt!343121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343124 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343121 lt!343124) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73539 (= lt!343124 (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342867)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867)))))))

(declare-fun lt!343125 () (_ BitVec 64))

(declare-fun lt!343120 () (_ BitVec 64))

(assert (=> d!73539 (= lt!343121 (bvmul lt!343125 lt!343120))))

(assert (=> d!73539 (or (= lt!343125 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343120 (bvsdiv (bvmul lt!343125 lt!343120) lt!343125)))))

(assert (=> d!73539 (= lt!343120 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73539 (= lt!343125 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342867)))))))

(assert (=> d!73539 (= lt!343122 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867)))))))

(assert (=> d!73539 (invariant!0 (currentBit!9781 (_2!9909 lt!342867)) (currentByte!9786 (_2!9909 lt!342867)) (size!4658 (buf!5199 (_2!9909 lt!342867))))))

(assert (=> d!73539 (= (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))) lt!343122)))

(declare-fun b!216982 () Bool)

(declare-fun res!182559 () Bool)

(assert (=> b!216982 (=> (not res!182559) (not e!147563))))

(assert (=> b!216982 (= res!182559 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343122))))

(declare-fun b!216983 () Bool)

(declare-fun lt!343123 () (_ BitVec 64))

(assert (=> b!216983 (= e!147563 (bvsle lt!343122 (bvmul lt!343123 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216983 (or (= lt!343123 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343123 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343123)))))

(assert (=> b!216983 (= lt!343123 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342867)))))))

(assert (= (and d!73539 res!182558) b!216982))

(assert (= (and b!216982 res!182559) b!216983))

(declare-fun m!334759 () Bool)

(assert (=> d!73539 m!334759))

(assert (=> d!73539 m!334753))

(assert (=> b!216864 d!73539))

(declare-fun d!73541 () Bool)

(declare-fun e!147564 () Bool)

(assert (=> d!73541 e!147564))

(declare-fun res!182560 () Bool)

(assert (=> d!73541 (=> (not res!182560) (not e!147564))))

(declare-fun lt!343127 () (_ BitVec 64))

(declare-fun lt!343130 () (_ BitVec 64))

(declare-fun lt!343128 () (_ BitVec 64))

(assert (=> d!73541 (= res!182560 (= lt!343128 (bvsub lt!343127 lt!343130)))))

(assert (=> d!73541 (or (= (bvand lt!343127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343130 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343127 lt!343130) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73541 (= lt!343130 (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 thiss!1204))) ((_ sign_extend 32) (currentByte!9786 thiss!1204)) ((_ sign_extend 32) (currentBit!9781 thiss!1204))))))

(declare-fun lt!343131 () (_ BitVec 64))

(declare-fun lt!343126 () (_ BitVec 64))

(assert (=> d!73541 (= lt!343127 (bvmul lt!343131 lt!343126))))

(assert (=> d!73541 (or (= lt!343131 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343126 (bvsdiv (bvmul lt!343131 lt!343126) lt!343131)))))

(assert (=> d!73541 (= lt!343126 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73541 (= lt!343131 ((_ sign_extend 32) (size!4658 (buf!5199 thiss!1204))))))

(assert (=> d!73541 (= lt!343128 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9786 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9781 thiss!1204))))))

(assert (=> d!73541 (invariant!0 (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204) (size!4658 (buf!5199 thiss!1204)))))

(assert (=> d!73541 (= (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)) lt!343128)))

(declare-fun b!216984 () Bool)

(declare-fun res!182561 () Bool)

(assert (=> b!216984 (=> (not res!182561) (not e!147564))))

(assert (=> b!216984 (= res!182561 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343128))))

(declare-fun b!216985 () Bool)

(declare-fun lt!343129 () (_ BitVec 64))

(assert (=> b!216985 (= e!147564 (bvsle lt!343128 (bvmul lt!343129 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216985 (or (= lt!343129 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343129 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343129)))))

(assert (=> b!216985 (= lt!343129 ((_ sign_extend 32) (size!4658 (buf!5199 thiss!1204))))))

(assert (= (and d!73541 res!182560) b!216984))

(assert (= (and b!216984 res!182561) b!216985))

(declare-fun m!334761 () Bool)

(assert (=> d!73541 m!334761))

(assert (=> d!73541 m!334547))

(assert (=> b!216864 d!73541))

(declare-fun d!73543 () Bool)

(declare-fun e!147570 () Bool)

(assert (=> d!73543 e!147570))

(declare-fun res!182573 () Bool)

(assert (=> d!73543 (=> (not res!182573) (not e!147570))))

(declare-fun lt!343143 () tuple2!18502)

(assert (=> d!73543 (= res!182573 (= (size!4658 (buf!5199 thiss!1204)) (size!4658 (buf!5199 (_2!9909 lt!343143)))))))

(declare-fun choose!16 (BitStream!8424 Bool) tuple2!18502)

(assert (=> d!73543 (= lt!343143 (choose!16 thiss!1204 lt!342883))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!73543 (validate_offset_bit!0 ((_ sign_extend 32) (size!4658 (buf!5199 thiss!1204))) ((_ sign_extend 32) (currentByte!9786 thiss!1204)) ((_ sign_extend 32) (currentBit!9781 thiss!1204)))))

(assert (=> d!73543 (= (appendBit!0 thiss!1204 lt!342883) lt!343143)))

(declare-fun b!216998 () Bool)

(declare-fun e!147569 () Bool)

(declare-fun lt!343142 () tuple2!18508)

(assert (=> b!216998 (= e!147569 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!343142))) (currentByte!9786 (_1!9912 lt!343142)) (currentBit!9781 (_1!9912 lt!343142))) (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343143))) (currentByte!9786 (_2!9909 lt!343143)) (currentBit!9781 (_2!9909 lt!343143)))))))

(declare-fun b!216997 () Bool)

(assert (=> b!216997 (= e!147570 e!147569)))

(declare-fun res!182571 () Bool)

(assert (=> b!216997 (=> (not res!182571) (not e!147569))))

(assert (=> b!216997 (= res!182571 (and (= (_2!9912 lt!343142) lt!342883) (= (_1!9912 lt!343142) (_2!9909 lt!343143))))))

(assert (=> b!216997 (= lt!343142 (readBitPure!0 (readerFrom!0 (_2!9909 lt!343143) (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204))))))

(declare-fun b!216995 () Bool)

(declare-fun res!182570 () Bool)

(assert (=> b!216995 (=> (not res!182570) (not e!147570))))

(declare-fun lt!343140 () (_ BitVec 64))

(declare-fun lt!343141 () (_ BitVec 64))

(assert (=> b!216995 (= res!182570 (= (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343143))) (currentByte!9786 (_2!9909 lt!343143)) (currentBit!9781 (_2!9909 lt!343143))) (bvadd lt!343141 lt!343140)))))

(assert (=> b!216995 (or (not (= (bvand lt!343141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343140 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343141 lt!343140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216995 (= lt!343140 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216995 (= lt!343141 (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)))))

(declare-fun b!216996 () Bool)

(declare-fun res!182572 () Bool)

(assert (=> b!216996 (=> (not res!182572) (not e!147570))))

(assert (=> b!216996 (= res!182572 (isPrefixOf!0 thiss!1204 (_2!9909 lt!343143)))))

(assert (= (and d!73543 res!182573) b!216995))

(assert (= (and b!216995 res!182570) b!216996))

(assert (= (and b!216996 res!182572) b!216997))

(assert (= (and b!216997 res!182571) b!216998))

(declare-fun m!334763 () Bool)

(assert (=> b!216997 m!334763))

(assert (=> b!216997 m!334763))

(declare-fun m!334765 () Bool)

(assert (=> b!216997 m!334765))

(declare-fun m!334767 () Bool)

(assert (=> b!216998 m!334767))

(declare-fun m!334769 () Bool)

(assert (=> b!216998 m!334769))

(declare-fun m!334771 () Bool)

(assert (=> b!216996 m!334771))

(assert (=> b!216995 m!334769))

(assert (=> b!216995 m!334545))

(declare-fun m!334773 () Bool)

(assert (=> d!73543 m!334773))

(declare-fun m!334775 () Bool)

(assert (=> d!73543 m!334775))

(assert (=> b!216864 d!73543))

(declare-fun d!73545 () Bool)

(assert (=> d!73545 (= (array_inv!4399 (buf!5199 thiss!1204)) (bvsge (size!4658 (buf!5199 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!216857 d!73545))

(declare-fun d!73547 () Bool)

(declare-fun res!182582 () Bool)

(declare-fun e!147575 () Bool)

(assert (=> d!73547 (=> (not res!182582) (not e!147575))))

(assert (=> d!73547 (= res!182582 (= (size!4658 (buf!5199 thiss!1204)) (size!4658 (buf!5199 (_2!9909 lt!342867)))))))

(assert (=> d!73547 (= (isPrefixOf!0 thiss!1204 (_2!9909 lt!342867)) e!147575)))

(declare-fun b!217005 () Bool)

(declare-fun res!182581 () Bool)

(assert (=> b!217005 (=> (not res!182581) (not e!147575))))

(assert (=> b!217005 (= res!182581 (bvsle (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)) (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867)))))))

(declare-fun b!217006 () Bool)

(declare-fun e!147576 () Bool)

(assert (=> b!217006 (= e!147575 e!147576)))

(declare-fun res!182580 () Bool)

(assert (=> b!217006 (=> res!182580 e!147576)))

(assert (=> b!217006 (= res!182580 (= (size!4658 (buf!5199 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217007 () Bool)

(assert (=> b!217007 (= e!147576 (arrayBitRangesEq!0 (buf!5199 thiss!1204) (buf!5199 (_2!9909 lt!342867)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204))))))

(assert (= (and d!73547 res!182582) b!217005))

(assert (= (and b!217005 res!182581) b!217006))

(assert (= (and b!217006 (not res!182580)) b!217007))

(assert (=> b!217005 m!334545))

(assert (=> b!217005 m!334543))

(assert (=> b!217007 m!334545))

(assert (=> b!217007 m!334545))

(declare-fun m!334777 () Bool)

(assert (=> b!217007 m!334777))

(assert (=> b!216846 d!73547))

(declare-fun d!73549 () Bool)

(declare-fun e!147577 () Bool)

(assert (=> d!73549 e!147577))

(declare-fun res!182583 () Bool)

(assert (=> d!73549 (=> (not res!182583) (not e!147577))))

(declare-fun lt!343146 () (_ BitVec 64))

(declare-fun lt!343148 () (_ BitVec 64))

(declare-fun lt!343145 () (_ BitVec 64))

(assert (=> d!73549 (= res!182583 (= lt!343146 (bvsub lt!343145 lt!343148)))))

(assert (=> d!73549 (or (= (bvand lt!343145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343145 lt!343148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73549 (= lt!343148 (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342877))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342877)))))))

(declare-fun lt!343149 () (_ BitVec 64))

(declare-fun lt!343144 () (_ BitVec 64))

(assert (=> d!73549 (= lt!343145 (bvmul lt!343149 lt!343144))))

(assert (=> d!73549 (or (= lt!343149 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343144 (bvsdiv (bvmul lt!343149 lt!343144) lt!343149)))))

(assert (=> d!73549 (= lt!343144 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73549 (= lt!343149 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))))))

(assert (=> d!73549 (= lt!343146 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342877)))))))

(assert (=> d!73549 (invariant!0 (currentBit!9781 (_2!9909 lt!342877)) (currentByte!9786 (_2!9909 lt!342877)) (size!4658 (buf!5199 (_2!9909 lt!342877))))))

(assert (=> d!73549 (= (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342877))) (currentByte!9786 (_2!9909 lt!342877)) (currentBit!9781 (_2!9909 lt!342877))) lt!343146)))

(declare-fun b!217008 () Bool)

(declare-fun res!182584 () Bool)

(assert (=> b!217008 (=> (not res!182584) (not e!147577))))

(assert (=> b!217008 (= res!182584 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343146))))

(declare-fun b!217009 () Bool)

(declare-fun lt!343147 () (_ BitVec 64))

(assert (=> b!217009 (= e!147577 (bvsle lt!343146 (bvmul lt!343147 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217009 (or (= lt!343147 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343147 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343147)))))

(assert (=> b!217009 (= lt!343147 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342877)))))))

(assert (= (and d!73549 res!182583) b!217008))

(assert (= (and b!217008 res!182584) b!217009))

(declare-fun m!334779 () Bool)

(assert (=> d!73549 m!334779))

(assert (=> d!73549 m!334491))

(assert (=> b!216866 d!73549))

(declare-fun d!73551 () Bool)

(declare-fun res!182587 () Bool)

(declare-fun e!147578 () Bool)

(assert (=> d!73551 (=> (not res!182587) (not e!147578))))

(assert (=> d!73551 (= res!182587 (= (size!4658 (buf!5199 thiss!1204)) (size!4658 (buf!5199 (_2!9909 lt!342877)))))))

(assert (=> d!73551 (= (isPrefixOf!0 thiss!1204 (_2!9909 lt!342877)) e!147578)))

(declare-fun b!217010 () Bool)

(declare-fun res!182586 () Bool)

(assert (=> b!217010 (=> (not res!182586) (not e!147578))))

(assert (=> b!217010 (= res!182586 (bvsle (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204)) (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342877))) (currentByte!9786 (_2!9909 lt!342877)) (currentBit!9781 (_2!9909 lt!342877)))))))

(declare-fun b!217011 () Bool)

(declare-fun e!147579 () Bool)

(assert (=> b!217011 (= e!147578 e!147579)))

(declare-fun res!182585 () Bool)

(assert (=> b!217011 (=> res!182585 e!147579)))

(assert (=> b!217011 (= res!182585 (= (size!4658 (buf!5199 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217012 () Bool)

(assert (=> b!217012 (= e!147579 (arrayBitRangesEq!0 (buf!5199 thiss!1204) (buf!5199 (_2!9909 lt!342877)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4658 (buf!5199 thiss!1204)) (currentByte!9786 thiss!1204) (currentBit!9781 thiss!1204))))))

(assert (= (and d!73551 res!182587) b!217010))

(assert (= (and b!217010 res!182586) b!217011))

(assert (= (and b!217011 (not res!182585)) b!217012))

(assert (=> b!217010 m!334545))

(assert (=> b!217010 m!334557))

(assert (=> b!217012 m!334545))

(assert (=> b!217012 m!334545))

(declare-fun m!334781 () Bool)

(assert (=> b!217012 m!334781))

(assert (=> b!216866 d!73551))

(declare-fun d!73553 () Bool)

(assert (=> d!73553 (isPrefixOf!0 thiss!1204 (_2!9909 lt!342877))))

(declare-fun lt!343152 () Unit!15435)

(declare-fun choose!30 (BitStream!8424 BitStream!8424 BitStream!8424) Unit!15435)

(assert (=> d!73553 (= lt!343152 (choose!30 thiss!1204 (_2!9909 lt!342867) (_2!9909 lt!342877)))))

(assert (=> d!73553 (isPrefixOf!0 thiss!1204 (_2!9909 lt!342867))))

(assert (=> d!73553 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9909 lt!342867) (_2!9909 lt!342877)) lt!343152)))

(declare-fun bs!17965 () Bool)

(assert (= bs!17965 d!73553))

(assert (=> bs!17965 m!334559))

(declare-fun m!334783 () Bool)

(assert (=> bs!17965 m!334783))

(assert (=> bs!17965 m!334541))

(assert (=> b!216866 d!73553))

(declare-fun b!217149 () Bool)

(declare-fun e!147668 () (_ BitVec 64))

(assert (=> b!217149 (= e!147668 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!217150 () Bool)

(declare-fun e!147661 () Bool)

(declare-fun lt!343534 () tuple2!18508)

(declare-fun lt!343556 () tuple2!18508)

(assert (=> b!217150 (= e!147661 (= (_2!9912 lt!343534) (_2!9912 lt!343556)))))

(declare-fun b!217151 () Bool)

(declare-fun e!147663 () Bool)

(declare-fun lt!343555 () tuple2!18504)

(declare-fun lt!343538 () tuple2!18506)

(assert (=> b!217151 (= e!147663 (= (_1!9910 lt!343555) (_2!9911 lt!343538)))))

(declare-fun b!217152 () Bool)

(declare-fun e!147666 () Bool)

(declare-fun lt!343569 () tuple2!18508)

(declare-fun lt!343530 () tuple2!18502)

(assert (=> b!217152 (= e!147666 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!343569))) (currentByte!9786 (_1!9912 lt!343569)) (currentBit!9781 (_1!9912 lt!343569))) (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343530))) (currentByte!9786 (_2!9909 lt!343530)) (currentBit!9781 (_2!9909 lt!343530)))))))

(declare-fun b!217153 () Bool)

(declare-fun res!182719 () Bool)

(assert (=> b!217153 (= res!182719 (= (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343530))) (currentByte!9786 (_2!9909 lt!343530)) (currentBit!9781 (_2!9909 lt!343530))) (bvadd (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!147662 () Bool)

(assert (=> b!217153 (=> (not res!182719) (not e!147662))))

(declare-fun b!217154 () Bool)

(declare-fun e!147664 () tuple2!18502)

(declare-fun lt!343540 () tuple2!18502)

(assert (=> b!217154 (= e!147664 (tuple2!18503 (_1!9909 lt!343540) (_2!9909 lt!343540)))))

(declare-fun lt!343528 () Bool)

(assert (=> b!217154 (= lt!343528 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217154 (= lt!343530 (appendBit!0 (_2!9909 lt!342867) lt!343528))))

(declare-fun res!182717 () Bool)

(assert (=> b!217154 (= res!182717 (= (size!4658 (buf!5199 (_2!9909 lt!342867))) (size!4658 (buf!5199 (_2!9909 lt!343530)))))))

(assert (=> b!217154 (=> (not res!182717) (not e!147662))))

(assert (=> b!217154 e!147662))

(declare-fun lt!343560 () tuple2!18502)

(assert (=> b!217154 (= lt!343560 lt!343530)))

(assert (=> b!217154 (= lt!343540 (appendBitsLSBFirstLoopTR!0 (_2!9909 lt!343560) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!343557 () Unit!15435)

(assert (=> b!217154 (= lt!343557 (lemmaIsPrefixTransitive!0 (_2!9909 lt!342867) (_2!9909 lt!343560) (_2!9909 lt!343540)))))

(declare-fun call!3396 () Bool)

(assert (=> b!217154 call!3396))

(declare-fun lt!343578 () Unit!15435)

(assert (=> b!217154 (= lt!343578 lt!343557)))

(assert (=> b!217154 (invariant!0 (currentBit!9781 (_2!9909 lt!342867)) (currentByte!9786 (_2!9909 lt!342867)) (size!4658 (buf!5199 (_2!9909 lt!343560))))))

(declare-fun lt!343561 () BitStream!8424)

(assert (=> b!217154 (= lt!343561 (BitStream!8425 (buf!5199 (_2!9909 lt!343560)) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))))))

(assert (=> b!217154 (invariant!0 (currentBit!9781 lt!343561) (currentByte!9786 lt!343561) (size!4658 (buf!5199 (_2!9909 lt!343540))))))

(declare-fun lt!343535 () BitStream!8424)

(assert (=> b!217154 (= lt!343535 (BitStream!8425 (buf!5199 (_2!9909 lt!343540)) (currentByte!9786 lt!343561) (currentBit!9781 lt!343561)))))

(assert (=> b!217154 (= lt!343534 (readBitPure!0 lt!343561))))

(assert (=> b!217154 (= lt!343556 (readBitPure!0 lt!343535))))

(declare-fun lt!343573 () Unit!15435)

(assert (=> b!217154 (= lt!343573 (readBitPrefixLemma!0 lt!343561 (_2!9909 lt!343540)))))

(declare-fun res!182712 () Bool)

(assert (=> b!217154 (= res!182712 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!343534))) (currentByte!9786 (_1!9912 lt!343534)) (currentBit!9781 (_1!9912 lt!343534))) (bitIndex!0 (size!4658 (buf!5199 (_1!9912 lt!343556))) (currentByte!9786 (_1!9912 lt!343556)) (currentBit!9781 (_1!9912 lt!343556)))))))

(assert (=> b!217154 (=> (not res!182712) (not e!147661))))

(assert (=> b!217154 e!147661))

(declare-fun lt!343583 () Unit!15435)

(assert (=> b!217154 (= lt!343583 lt!343573)))

(declare-fun lt!343533 () tuple2!18506)

(assert (=> b!217154 (= lt!343533 (reader!0 (_2!9909 lt!342867) (_2!9909 lt!343540)))))

(declare-fun lt!343548 () tuple2!18506)

(assert (=> b!217154 (= lt!343548 (reader!0 (_2!9909 lt!343560) (_2!9909 lt!343540)))))

(declare-fun lt!343546 () tuple2!18508)

(assert (=> b!217154 (= lt!343546 (readBitPure!0 (_1!9911 lt!343533)))))

(assert (=> b!217154 (= (_2!9912 lt!343546) lt!343528)))

(declare-fun lt!343580 () Unit!15435)

(declare-fun Unit!15441 () Unit!15435)

(assert (=> b!217154 (= lt!343580 Unit!15441)))

(declare-fun lt!343550 () (_ BitVec 64))

(assert (=> b!217154 (= lt!343550 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!343537 () (_ BitVec 64))

(assert (=> b!217154 (= lt!343537 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!343568 () Unit!15435)

(assert (=> b!217154 (= lt!343568 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9909 lt!342867) (buf!5199 (_2!9909 lt!343540)) lt!343537))))

(assert (=> b!217154 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!343540)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867))) lt!343537)))

(declare-fun lt!343574 () Unit!15435)

(assert (=> b!217154 (= lt!343574 lt!343568)))

(declare-fun lt!343543 () tuple2!18504)

(assert (=> b!217154 (= lt!343543 (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!343533) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!343550))))

(declare-fun lt!343575 () (_ BitVec 64))

(assert (=> b!217154 (= lt!343575 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!343571 () Unit!15435)

(assert (=> b!217154 (= lt!343571 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9909 lt!343560) (buf!5199 (_2!9909 lt!343540)) lt!343575))))

(assert (=> b!217154 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!343540)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!343560))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!343560))) lt!343575)))

(declare-fun lt!343581 () Unit!15435)

(assert (=> b!217154 (= lt!343581 lt!343571)))

(declare-fun lt!343577 () tuple2!18504)

(assert (=> b!217154 (= lt!343577 (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!343548) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!343550 (ite (_2!9912 lt!343546) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!343536 () tuple2!18504)

(assert (=> b!217154 (= lt!343536 (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!343533) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!343550))))

(declare-fun c!10611 () Bool)

(assert (=> b!217154 (= c!10611 (_2!9912 (readBitPure!0 (_1!9911 lt!343533))))))

(declare-fun lt!343541 () tuple2!18504)

(assert (=> b!217154 (= lt!343541 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9911 lt!343533) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!343550 e!147668)))))

(declare-fun lt!343547 () Unit!15435)

(assert (=> b!217154 (= lt!343547 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9911 lt!343533) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!343550))))

(assert (=> b!217154 (and (= (_2!9910 lt!343536) (_2!9910 lt!343541)) (= (_1!9910 lt!343536) (_1!9910 lt!343541)))))

(declare-fun lt!343552 () Unit!15435)

(assert (=> b!217154 (= lt!343552 lt!343547)))

(assert (=> b!217154 (= (_1!9911 lt!343533) (withMovedBitIndex!0 (_2!9911 lt!343533) (bvsub (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))) (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343540))) (currentByte!9786 (_2!9909 lt!343540)) (currentBit!9781 (_2!9909 lt!343540))))))))

(declare-fun lt!343576 () Unit!15435)

(declare-fun Unit!15442 () Unit!15435)

(assert (=> b!217154 (= lt!343576 Unit!15442)))

(assert (=> b!217154 (= (_1!9911 lt!343548) (withMovedBitIndex!0 (_2!9911 lt!343548) (bvsub (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343560))) (currentByte!9786 (_2!9909 lt!343560)) (currentBit!9781 (_2!9909 lt!343560))) (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343540))) (currentByte!9786 (_2!9909 lt!343540)) (currentBit!9781 (_2!9909 lt!343540))))))))

(declare-fun lt!343542 () Unit!15435)

(declare-fun Unit!15443 () Unit!15435)

(assert (=> b!217154 (= lt!343542 Unit!15443)))

(assert (=> b!217154 (= (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))) (bvsub (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343560))) (currentByte!9786 (_2!9909 lt!343560)) (currentBit!9781 (_2!9909 lt!343560))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!343566 () Unit!15435)

(declare-fun Unit!15444 () Unit!15435)

(assert (=> b!217154 (= lt!343566 Unit!15444)))

(assert (=> b!217154 (= (_2!9910 lt!343543) (_2!9910 lt!343577))))

(declare-fun lt!343562 () Unit!15435)

(declare-fun Unit!15445 () Unit!15435)

(assert (=> b!217154 (= lt!343562 Unit!15445)))

(assert (=> b!217154 (invariant!0 (currentBit!9781 (_2!9909 lt!343540)) (currentByte!9786 (_2!9909 lt!343540)) (size!4658 (buf!5199 (_2!9909 lt!343540))))))

(declare-fun lt!343559 () Unit!15435)

(declare-fun Unit!15446 () Unit!15435)

(assert (=> b!217154 (= lt!343559 Unit!15446)))

(assert (=> b!217154 (= (size!4658 (buf!5199 (_2!9909 lt!342867))) (size!4658 (buf!5199 (_2!9909 lt!343540))))))

(declare-fun lt!343539 () Unit!15435)

(declare-fun Unit!15447 () Unit!15435)

(assert (=> b!217154 (= lt!343539 Unit!15447)))

(assert (=> b!217154 (= (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343540))) (currentByte!9786 (_2!9909 lt!343540)) (currentBit!9781 (_2!9909 lt!343540))) (bvsub (bvadd (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!343570 () Unit!15435)

(declare-fun Unit!15448 () Unit!15435)

(assert (=> b!217154 (= lt!343570 Unit!15448)))

(declare-fun lt!343531 () Unit!15435)

(declare-fun Unit!15449 () Unit!15435)

(assert (=> b!217154 (= lt!343531 Unit!15449)))

(declare-fun lt!343567 () tuple2!18506)

(assert (=> b!217154 (= lt!343567 (reader!0 (_2!9909 lt!342867) (_2!9909 lt!343540)))))

(declare-fun lt!343532 () (_ BitVec 64))

(assert (=> b!217154 (= lt!343532 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!343549 () Unit!15435)

(assert (=> b!217154 (= lt!343549 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9909 lt!342867) (buf!5199 (_2!9909 lt!343540)) lt!343532))))

(assert (=> b!217154 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!343540)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867))) lt!343532)))

(declare-fun lt!343544 () Unit!15435)

(assert (=> b!217154 (= lt!343544 lt!343549)))

(declare-fun lt!343565 () tuple2!18504)

(assert (=> b!217154 (= lt!343565 (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!343567) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!182718 () Bool)

(assert (=> b!217154 (= res!182718 (= (_2!9910 lt!343565) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!147669 () Bool)

(assert (=> b!217154 (=> (not res!182718) (not e!147669))))

(assert (=> b!217154 e!147669))

(declare-fun lt!343582 () Unit!15435)

(declare-fun Unit!15450 () Unit!15435)

(assert (=> b!217154 (= lt!343582 Unit!15450)))

(declare-fun b!217155 () Bool)

(declare-fun res!182714 () Bool)

(declare-fun e!147667 () Bool)

(assert (=> b!217155 (=> (not res!182714) (not e!147667))))

(declare-fun lt!343579 () (_ BitVec 64))

(declare-fun lt!343563 () (_ BitVec 64))

(declare-fun lt!343551 () tuple2!18502)

(assert (=> b!217155 (= res!182714 (= (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!343551))) (currentByte!9786 (_2!9909 lt!343551)) (currentBit!9781 (_2!9909 lt!343551))) (bvsub lt!343579 lt!343563)))))

(assert (=> b!217155 (or (= (bvand lt!343579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343579 lt!343563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217155 (= lt!343563 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!343572 () (_ BitVec 64))

(declare-fun lt!343529 () (_ BitVec 64))

(assert (=> b!217155 (= lt!343579 (bvadd lt!343572 lt!343529))))

(assert (=> b!217155 (or (not (= (bvand lt!343572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343529 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343572 lt!343529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217155 (= lt!343529 ((_ sign_extend 32) nBits!348))))

(assert (=> b!217155 (= lt!343572 (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))))))

(declare-fun b!217156 () Bool)

(assert (=> b!217156 (= e!147668 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!217157 () Bool)

(assert (=> b!217157 (= lt!343569 (readBitPure!0 (readerFrom!0 (_2!9909 lt!343530) (currentBit!9781 (_2!9909 lt!342867)) (currentByte!9786 (_2!9909 lt!342867)))))))

(declare-fun res!182709 () Bool)

(assert (=> b!217157 (= res!182709 (and (= (_2!9912 lt!343569) lt!343528) (= (_1!9912 lt!343569) (_2!9909 lt!343530))))))

(assert (=> b!217157 (=> (not res!182709) (not e!147666))))

(assert (=> b!217157 (= e!147662 e!147666)))

(declare-fun b!217158 () Bool)

(declare-fun res!182710 () Bool)

(assert (=> b!217158 (= res!182710 (isPrefixOf!0 (_2!9909 lt!342867) (_2!9909 lt!343530)))))

(assert (=> b!217158 (=> (not res!182710) (not e!147662))))

(declare-fun b!217159 () Bool)

(declare-fun res!182720 () Bool)

(assert (=> b!217159 (=> (not res!182720) (not e!147667))))

(assert (=> b!217159 (= res!182720 (isPrefixOf!0 (_2!9909 lt!342867) (_2!9909 lt!343551)))))

(declare-fun d!73555 () Bool)

(assert (=> d!73555 e!147667))

(declare-fun res!182713 () Bool)

(assert (=> d!73555 (=> (not res!182713) (not e!147667))))

(assert (=> d!73555 (= res!182713 (invariant!0 (currentBit!9781 (_2!9909 lt!343551)) (currentByte!9786 (_2!9909 lt!343551)) (size!4658 (buf!5199 (_2!9909 lt!343551)))))))

(assert (=> d!73555 (= lt!343551 e!147664)))

(declare-fun c!10612 () Bool)

(assert (=> d!73555 (= c!10612 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!73555 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73555 (= (appendBitsLSBFirstLoopTR!0 (_2!9909 lt!342867) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!343551)))

(declare-fun b!217160 () Bool)

(assert (=> b!217160 (= e!147669 (= (_1!9910 lt!343565) (_2!9911 lt!343567)))))

(declare-fun b!217161 () Bool)

(declare-fun res!182716 () Bool)

(assert (=> b!217161 (=> (not res!182716) (not e!147667))))

(assert (=> b!217161 (= res!182716 (= (size!4658 (buf!5199 (_2!9909 lt!342867))) (size!4658 (buf!5199 (_2!9909 lt!343551)))))))

(declare-fun b!217162 () Bool)

(assert (=> b!217162 (= e!147667 e!147663)))

(declare-fun res!182711 () Bool)

(assert (=> b!217162 (=> (not res!182711) (not e!147663))))

(assert (=> b!217162 (= res!182711 (= (_2!9910 lt!343555) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!217162 (= lt!343555 (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!343538) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!343564 () Unit!15435)

(declare-fun lt!343554 () Unit!15435)

(assert (=> b!217162 (= lt!343564 lt!343554)))

(declare-fun lt!343545 () (_ BitVec 64))

(assert (=> b!217162 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!343551)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867))) lt!343545)))

(assert (=> b!217162 (= lt!343554 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9909 lt!342867) (buf!5199 (_2!9909 lt!343551)) lt!343545))))

(declare-fun e!147665 () Bool)

(assert (=> b!217162 e!147665))

(declare-fun res!182715 () Bool)

(assert (=> b!217162 (=> (not res!182715) (not e!147665))))

(assert (=> b!217162 (= res!182715 (and (= (size!4658 (buf!5199 (_2!9909 lt!342867))) (size!4658 (buf!5199 (_2!9909 lt!343551)))) (bvsge lt!343545 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217162 (= lt!343545 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!217162 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!217162 (= lt!343538 (reader!0 (_2!9909 lt!342867) (_2!9909 lt!343551)))))

(declare-fun bm!3393 () Bool)

(assert (=> bm!3393 (= call!3396 (isPrefixOf!0 (_2!9909 lt!342867) (ite c!10612 (_2!9909 lt!342867) (_2!9909 lt!343540))))))

(declare-fun b!217163 () Bool)

(assert (=> b!217163 (= e!147665 (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9909 lt!342867)))) ((_ sign_extend 32) (currentByte!9786 (_2!9909 lt!342867))) ((_ sign_extend 32) (currentBit!9781 (_2!9909 lt!342867))) lt!343545))))

(declare-fun b!217164 () Bool)

(declare-fun Unit!15451 () Unit!15435)

(assert (=> b!217164 (= e!147664 (tuple2!18503 Unit!15451 (_2!9909 lt!342867)))))

(declare-fun lt!343558 () Unit!15435)

(assert (=> b!217164 (= lt!343558 (lemmaIsPrefixRefl!0 (_2!9909 lt!342867)))))

(assert (=> b!217164 call!3396))

(declare-fun lt!343553 () Unit!15435)

(assert (=> b!217164 (= lt!343553 lt!343558)))

(assert (= (and d!73555 c!10612) b!217164))

(assert (= (and d!73555 (not c!10612)) b!217154))

(assert (= (and b!217154 res!182717) b!217153))

(assert (= (and b!217153 res!182719) b!217158))

(assert (= (and b!217158 res!182710) b!217157))

(assert (= (and b!217157 res!182709) b!217152))

(assert (= (and b!217154 res!182712) b!217150))

(assert (= (and b!217154 c!10611) b!217149))

(assert (= (and b!217154 (not c!10611)) b!217156))

(assert (= (and b!217154 res!182718) b!217160))

(assert (= (or b!217164 b!217154) bm!3393))

(assert (= (and d!73555 res!182713) b!217161))

(assert (= (and b!217161 res!182716) b!217155))

(assert (= (and b!217155 res!182714) b!217159))

(assert (= (and b!217159 res!182720) b!217162))

(assert (= (and b!217162 res!182715) b!217163))

(assert (= (and b!217162 res!182711) b!217151))

(declare-fun m!334983 () Bool)

(assert (=> bm!3393 m!334983))

(declare-fun m!334985 () Bool)

(assert (=> d!73555 m!334985))

(declare-fun m!334987 () Bool)

(assert (=> b!217162 m!334987))

(declare-fun m!334989 () Bool)

(assert (=> b!217162 m!334989))

(declare-fun m!334991 () Bool)

(assert (=> b!217162 m!334991))

(declare-fun m!334993 () Bool)

(assert (=> b!217162 m!334993))

(declare-fun m!334995 () Bool)

(assert (=> b!217162 m!334995))

(assert (=> b!217162 m!334571))

(declare-fun m!334997 () Bool)

(assert (=> b!217163 m!334997))

(declare-fun m!334999 () Bool)

(assert (=> b!217152 m!334999))

(declare-fun m!335001 () Bool)

(assert (=> b!217152 m!335001))

(declare-fun m!335003 () Bool)

(assert (=> b!217157 m!335003))

(assert (=> b!217157 m!335003))

(declare-fun m!335005 () Bool)

(assert (=> b!217157 m!335005))

(assert (=> b!217153 m!335001))

(assert (=> b!217153 m!334543))

(assert (=> b!217164 m!334733))

(declare-fun m!335007 () Bool)

(assert (=> b!217159 m!335007))

(assert (=> b!217154 m!334543))

(declare-fun m!335009 () Bool)

(assert (=> b!217154 m!335009))

(declare-fun m!335011 () Bool)

(assert (=> b!217154 m!335011))

(declare-fun m!335013 () Bool)

(assert (=> b!217154 m!335013))

(declare-fun m!335015 () Bool)

(assert (=> b!217154 m!335015))

(declare-fun m!335017 () Bool)

(assert (=> b!217154 m!335017))

(declare-fun m!335019 () Bool)

(assert (=> b!217154 m!335019))

(declare-fun m!335021 () Bool)

(assert (=> b!217154 m!335021))

(declare-fun m!335023 () Bool)

(assert (=> b!217154 m!335023))

(assert (=> b!217154 m!334993))

(declare-fun m!335025 () Bool)

(assert (=> b!217154 m!335025))

(declare-fun m!335027 () Bool)

(assert (=> b!217154 m!335027))

(declare-fun m!335029 () Bool)

(assert (=> b!217154 m!335029))

(declare-fun m!335031 () Bool)

(assert (=> b!217154 m!335031))

(declare-fun m!335033 () Bool)

(assert (=> b!217154 m!335033))

(declare-fun m!335035 () Bool)

(assert (=> b!217154 m!335035))

(declare-fun m!335037 () Bool)

(assert (=> b!217154 m!335037))

(declare-fun m!335039 () Bool)

(assert (=> b!217154 m!335039))

(declare-fun m!335041 () Bool)

(assert (=> b!217154 m!335041))

(assert (=> b!217154 m!334571))

(declare-fun m!335043 () Bool)

(assert (=> b!217154 m!335043))

(declare-fun m!335045 () Bool)

(assert (=> b!217154 m!335045))

(declare-fun m!335047 () Bool)

(assert (=> b!217154 m!335047))

(declare-fun m!335049 () Bool)

(assert (=> b!217154 m!335049))

(declare-fun m!335051 () Bool)

(assert (=> b!217154 m!335051))

(declare-fun m!335053 () Bool)

(assert (=> b!217154 m!335053))

(declare-fun m!335055 () Bool)

(assert (=> b!217154 m!335055))

(declare-fun m!335057 () Bool)

(assert (=> b!217154 m!335057))

(declare-fun m!335059 () Bool)

(assert (=> b!217154 m!335059))

(declare-fun m!335061 () Bool)

(assert (=> b!217154 m!335061))

(declare-fun m!335063 () Bool)

(assert (=> b!217154 m!335063))

(declare-fun m!335065 () Bool)

(assert (=> b!217154 m!335065))

(assert (=> b!217154 m!335053))

(declare-fun m!335067 () Bool)

(assert (=> b!217154 m!335067))

(declare-fun m!335069 () Bool)

(assert (=> b!217158 m!335069))

(declare-fun m!335071 () Bool)

(assert (=> b!217155 m!335071))

(assert (=> b!217155 m!334543))

(assert (=> b!216866 d!73555))

(declare-fun d!73663 () Bool)

(assert (=> d!73663 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!216867 d!73663))

(declare-fun d!73665 () Bool)

(declare-fun e!147674 () Bool)

(assert (=> d!73665 e!147674))

(declare-fun res!182723 () Bool)

(assert (=> d!73665 (=> (not res!182723) (not e!147674))))

(declare-fun lt!343597 () (_ BitVec 64))

(declare-fun lt!343596 () BitStream!8424)

(assert (=> d!73665 (= res!182723 (= (bvadd lt!343597 (bvsub lt!342868 lt!342869)) (bitIndex!0 (size!4658 (buf!5199 lt!343596)) (currentByte!9786 lt!343596) (currentBit!9781 lt!343596))))))

(assert (=> d!73665 (or (not (= (bvand lt!343597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342868 lt!342869) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343597 (bvsub lt!342868 lt!342869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73665 (= lt!343597 (bitIndex!0 (size!4658 (buf!5199 (_2!9911 lt!342881))) (currentByte!9786 (_2!9911 lt!342881)) (currentBit!9781 (_2!9911 lt!342881))))))

(declare-fun moveBitIndex!0 (BitStream!8424 (_ BitVec 64)) tuple2!18502)

(assert (=> d!73665 (= lt!343596 (_2!9909 (moveBitIndex!0 (_2!9911 lt!342881) (bvsub lt!342868 lt!342869))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8424 (_ BitVec 64)) Bool)

(assert (=> d!73665 (moveBitIndexPrecond!0 (_2!9911 lt!342881) (bvsub lt!342868 lt!342869))))

(assert (=> d!73665 (= (withMovedBitIndex!0 (_2!9911 lt!342881) (bvsub lt!342868 lt!342869)) lt!343596)))

(declare-fun b!217171 () Bool)

(assert (=> b!217171 (= e!147674 (= (size!4658 (buf!5199 (_2!9911 lt!342881))) (size!4658 (buf!5199 lt!343596))))))

(assert (= (and d!73665 res!182723) b!217171))

(declare-fun m!335073 () Bool)

(assert (=> d!73665 m!335073))

(declare-fun m!335075 () Bool)

(assert (=> d!73665 m!335075))

(declare-fun m!335077 () Bool)

(assert (=> d!73665 m!335077))

(declare-fun m!335079 () Bool)

(assert (=> d!73665 m!335079))

(assert (=> b!216856 d!73665))

(declare-fun d!73667 () Bool)

(assert (=> d!73667 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4658 (buf!5199 thiss!1204))) ((_ sign_extend 32) (currentByte!9786 thiss!1204)) ((_ sign_extend 32) (currentBit!9781 thiss!1204)) lt!342878) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 thiss!1204))) ((_ sign_extend 32) (currentByte!9786 thiss!1204)) ((_ sign_extend 32) (currentBit!9781 thiss!1204))) lt!342878))))

(declare-fun bs!17988 () Bool)

(assert (= bs!17988 d!73667))

(assert (=> bs!17988 m!334761))

(assert (=> b!216849 d!73667))

(declare-fun d!73669 () Bool)

(assert (=> d!73669 (= (invariant!0 (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204) (size!4658 (buf!5199 thiss!1204))) (and (bvsge (currentBit!9781 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9781 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9786 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9786 thiss!1204) (size!4658 (buf!5199 thiss!1204))) (and (= (currentBit!9781 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9786 thiss!1204) (size!4658 (buf!5199 thiss!1204)))))))))

(assert (=> b!216860 d!73669))

(declare-fun d!73671 () Bool)

(declare-fun res!182734 () Bool)

(declare-fun e!147679 () Bool)

(assert (=> d!73671 (=> (not res!182734) (not e!147679))))

(assert (=> d!73671 (= res!182734 (= (size!4658 (buf!5199 (_2!9909 lt!342867))) (size!4658 (buf!5199 (_2!9909 lt!342877)))))))

(assert (=> d!73671 (= (isPrefixOf!0 (_2!9909 lt!342867) (_2!9909 lt!342877)) e!147679)))

(declare-fun b!217180 () Bool)

(declare-fun res!182733 () Bool)

(assert (=> b!217180 (=> (not res!182733) (not e!147679))))

(assert (=> b!217180 (= res!182733 (bvsle (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867))) (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342877))) (currentByte!9786 (_2!9909 lt!342877)) (currentBit!9781 (_2!9909 lt!342877)))))))

(declare-fun b!217181 () Bool)

(declare-fun e!147680 () Bool)

(assert (=> b!217181 (= e!147679 e!147680)))

(declare-fun res!182732 () Bool)

(assert (=> b!217181 (=> res!182732 e!147680)))

(assert (=> b!217181 (= res!182732 (= (size!4658 (buf!5199 (_2!9909 lt!342867))) #b00000000000000000000000000000000))))

(declare-fun b!217182 () Bool)

(assert (=> b!217182 (= e!147680 (arrayBitRangesEq!0 (buf!5199 (_2!9909 lt!342867)) (buf!5199 (_2!9909 lt!342877)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4658 (buf!5199 (_2!9909 lt!342867))) (currentByte!9786 (_2!9909 lt!342867)) (currentBit!9781 (_2!9909 lt!342867)))))))

(assert (= (and d!73671 res!182734) b!217180))

(assert (= (and b!217180 res!182733) b!217181))

(assert (= (and b!217181 (not res!182732)) b!217182))

(assert (=> b!217180 m!334543))

(assert (=> b!217180 m!334557))

(assert (=> b!217182 m!334543))

(assert (=> b!217182 m!334543))

(declare-fun m!335081 () Bool)

(assert (=> b!217182 m!335081))

(assert (=> b!216859 d!73671))

(declare-fun d!73673 () Bool)

(declare-fun lt!343696 () tuple2!18504)

(declare-fun lt!343699 () tuple2!18504)

(assert (=> d!73673 (and (= (_2!9910 lt!343696) (_2!9910 lt!343699)) (= (_1!9910 lt!343696) (_1!9910 lt!343699)))))

(declare-fun lt!343701 () Bool)

(declare-fun lt!343697 () BitStream!8424)

(declare-fun lt!343700 () (_ BitVec 64))

(declare-fun lt!343698 () Unit!15435)

(declare-fun choose!56 (BitStream!8424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18504 tuple2!18504 BitStream!8424 (_ BitVec 64) Bool BitStream!8424 (_ BitVec 64) tuple2!18504 tuple2!18504 BitStream!8424 (_ BitVec 64)) Unit!15435)

(assert (=> d!73673 (= lt!343698 (choose!56 (_1!9911 lt!342886) nBits!348 i!590 lt!342876 lt!343696 (tuple2!18505 (_1!9910 lt!343696) (_2!9910 lt!343696)) (_1!9910 lt!343696) (_2!9910 lt!343696) lt!343701 lt!343697 lt!343700 lt!343699 (tuple2!18505 (_1!9910 lt!343699) (_2!9910 lt!343699)) (_1!9910 lt!343699) (_2!9910 lt!343699)))))

(assert (=> d!73673 (= lt!343699 (readNBitsLSBFirstsLoopPure!0 lt!343697 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!343700))))

(assert (=> d!73673 (= lt!343700 (bvor lt!342876 (ite lt!343701 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73673 (= lt!343697 (withMovedBitIndex!0 (_1!9911 lt!342886) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!73673 (= lt!343701 (_2!9912 (readBitPure!0 (_1!9911 lt!342886))))))

(assert (=> d!73673 (= lt!343696 (readNBitsLSBFirstsLoopPure!0 (_1!9911 lt!342886) nBits!348 i!590 lt!342876))))

(assert (=> d!73673 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9911 lt!342886) nBits!348 i!590 lt!342876) lt!343698)))

(declare-fun bs!17990 () Bool)

(assert (= bs!17990 d!73673))

(assert (=> bs!17990 m!334497))

(assert (=> bs!17990 m!334513))

(declare-fun m!335083 () Bool)

(assert (=> bs!17990 m!335083))

(declare-fun m!335085 () Bool)

(assert (=> bs!17990 m!335085))

(assert (=> bs!17990 m!334505))

(assert (=> b!216848 d!73673))

(declare-fun lt!343702 () tuple2!18520)

(declare-fun d!73675 () Bool)

(assert (=> d!73675 (= lt!343702 (readNBitsLSBFirstsLoop!0 lt!342885 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342873))))

(assert (=> d!73675 (= (readNBitsLSBFirstsLoopPure!0 lt!342885 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342873) (tuple2!18505 (_2!9918 lt!343702) (_1!9918 lt!343702)))))

(declare-fun bs!17991 () Bool)

(assert (= bs!17991 d!73675))

(declare-fun m!335087 () Bool)

(assert (=> bs!17991 m!335087))

(assert (=> b!216848 d!73675))

(declare-fun d!73677 () Bool)

(declare-fun e!147687 () Bool)

(assert (=> d!73677 e!147687))

(declare-fun res!182739 () Bool)

(assert (=> d!73677 (=> (not res!182739) (not e!147687))))

(declare-fun lt!343704 () (_ BitVec 64))

(declare-fun lt!343703 () BitStream!8424)

(assert (=> d!73677 (= res!182739 (= (bvadd lt!343704 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4658 (buf!5199 lt!343703)) (currentByte!9786 lt!343703) (currentBit!9781 lt!343703))))))

(assert (=> d!73677 (or (not (= (bvand lt!343704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343704 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73677 (= lt!343704 (bitIndex!0 (size!4658 (buf!5199 (_1!9911 lt!342886))) (currentByte!9786 (_1!9911 lt!342886)) (currentBit!9781 (_1!9911 lt!342886))))))

(assert (=> d!73677 (= lt!343703 (_2!9909 (moveBitIndex!0 (_1!9911 lt!342886) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!73677 (moveBitIndexPrecond!0 (_1!9911 lt!342886) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!73677 (= (withMovedBitIndex!0 (_1!9911 lt!342886) #b0000000000000000000000000000000000000000000000000000000000000001) lt!343703)))

(declare-fun b!217191 () Bool)

(assert (=> b!217191 (= e!147687 (= (size!4658 (buf!5199 (_1!9911 lt!342886))) (size!4658 (buf!5199 lt!343703))))))

(assert (= (and d!73677 res!182739) b!217191))

(declare-fun m!335089 () Bool)

(assert (=> d!73677 m!335089))

(declare-fun m!335091 () Bool)

(assert (=> d!73677 m!335091))

(declare-fun m!335093 () Bool)

(assert (=> d!73677 m!335093))

(declare-fun m!335095 () Bool)

(assert (=> d!73677 m!335095))

(assert (=> b!216848 d!73677))

(declare-fun d!73679 () Bool)

(declare-fun e!147690 () Bool)

(assert (=> d!73679 e!147690))

(declare-fun res!182746 () Bool)

(assert (=> d!73679 (=> (not res!182746) (not e!147690))))

(declare-fun lt!343711 () BitStream!8424)

(declare-fun lt!343712 () (_ BitVec 64))

(assert (=> d!73679 (= res!182746 (= (bvadd lt!343712 (bvsub lt!342861 lt!342869)) (bitIndex!0 (size!4658 (buf!5199 lt!343711)) (currentByte!9786 lt!343711) (currentBit!9781 lt!343711))))))

(assert (=> d!73679 (or (not (= (bvand lt!343712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342861 lt!342869) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343712 (bvsub lt!342861 lt!342869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73679 (= lt!343712 (bitIndex!0 (size!4658 (buf!5199 (_2!9911 lt!342886))) (currentByte!9786 (_2!9911 lt!342886)) (currentBit!9781 (_2!9911 lt!342886))))))

(assert (=> d!73679 (= lt!343711 (_2!9909 (moveBitIndex!0 (_2!9911 lt!342886) (bvsub lt!342861 lt!342869))))))

(assert (=> d!73679 (moveBitIndexPrecond!0 (_2!9911 lt!342886) (bvsub lt!342861 lt!342869))))

(assert (=> d!73679 (= (withMovedBitIndex!0 (_2!9911 lt!342886) (bvsub lt!342861 lt!342869)) lt!343711)))

(declare-fun b!217196 () Bool)

(assert (=> b!217196 (= e!147690 (= (size!4658 (buf!5199 (_2!9911 lt!342886))) (size!4658 (buf!5199 lt!343711))))))

(assert (= (and d!73679 res!182746) b!217196))

(declare-fun m!335097 () Bool)

(assert (=> d!73679 m!335097))

(assert (=> d!73679 m!334539))

(declare-fun m!335099 () Bool)

(assert (=> d!73679 m!335099))

(declare-fun m!335101 () Bool)

(assert (=> d!73679 m!335101))

(assert (=> b!216862 d!73679))

(declare-fun d!73681 () Bool)

(declare-fun e!147691 () Bool)

(assert (=> d!73681 e!147691))

(declare-fun res!182749 () Bool)

(assert (=> d!73681 (=> (not res!182749) (not e!147691))))

(declare-fun lt!343722 () (_ BitVec 64))

(declare-fun lt!343725 () (_ BitVec 64))

(declare-fun lt!343723 () (_ BitVec 64))

(assert (=> d!73681 (= res!182749 (= lt!343723 (bvsub lt!343722 lt!343725)))))

(assert (=> d!73681 (or (= (bvand lt!343722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343725 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343722 lt!343725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73681 (= lt!343725 (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9910 lt!342880)))) ((_ sign_extend 32) (currentByte!9786 (_1!9910 lt!342880))) ((_ sign_extend 32) (currentBit!9781 (_1!9910 lt!342880)))))))

(declare-fun lt!343726 () (_ BitVec 64))

(declare-fun lt!343721 () (_ BitVec 64))

(assert (=> d!73681 (= lt!343722 (bvmul lt!343726 lt!343721))))

(assert (=> d!73681 (or (= lt!343726 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343721 (bvsdiv (bvmul lt!343726 lt!343721) lt!343726)))))

(assert (=> d!73681 (= lt!343721 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73681 (= lt!343726 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9910 lt!342880)))))))

(assert (=> d!73681 (= lt!343723 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9786 (_1!9910 lt!342880))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9781 (_1!9910 lt!342880)))))))

(assert (=> d!73681 (invariant!0 (currentBit!9781 (_1!9910 lt!342880)) (currentByte!9786 (_1!9910 lt!342880)) (size!4658 (buf!5199 (_1!9910 lt!342880))))))

(assert (=> d!73681 (= (bitIndex!0 (size!4658 (buf!5199 (_1!9910 lt!342880))) (currentByte!9786 (_1!9910 lt!342880)) (currentBit!9781 (_1!9910 lt!342880))) lt!343723)))

(declare-fun b!217201 () Bool)

(declare-fun res!182750 () Bool)

(assert (=> b!217201 (=> (not res!182750) (not e!147691))))

(assert (=> b!217201 (= res!182750 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343723))))

(declare-fun b!217202 () Bool)

(declare-fun lt!343724 () (_ BitVec 64))

(assert (=> b!217202 (= e!147691 (bvsle lt!343723 (bvmul lt!343724 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217202 (or (= lt!343724 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343724 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343724)))))

(assert (=> b!217202 (= lt!343724 ((_ sign_extend 32) (size!4658 (buf!5199 (_1!9910 lt!342880)))))))

(assert (= (and d!73681 res!182749) b!217201))

(assert (= (and b!217201 res!182750) b!217202))

(declare-fun m!335103 () Bool)

(assert (=> d!73681 m!335103))

(declare-fun m!335105 () Bool)

(assert (=> d!73681 m!335105))

(assert (=> b!216863 d!73681))

(declare-fun d!73683 () Bool)

(declare-fun e!147696 () Bool)

(assert (=> d!73683 e!147696))

(declare-fun res!182755 () Bool)

(assert (=> d!73683 (=> (not res!182755) (not e!147696))))

(declare-fun lt!343735 () (_ BitVec 64))

(declare-fun lt!343733 () (_ BitVec 64))

(declare-fun lt!343732 () (_ BitVec 64))

(assert (=> d!73683 (= res!182755 (= lt!343733 (bvsub lt!343732 lt!343735)))))

(assert (=> d!73683 (or (= (bvand lt!343732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343732 lt!343735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73683 (= lt!343735 (remainingBits!0 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9911 lt!342886)))) ((_ sign_extend 32) (currentByte!9786 (_2!9911 lt!342886))) ((_ sign_extend 32) (currentBit!9781 (_2!9911 lt!342886)))))))

(declare-fun lt!343736 () (_ BitVec 64))

(declare-fun lt!343731 () (_ BitVec 64))

(assert (=> d!73683 (= lt!343732 (bvmul lt!343736 lt!343731))))

(assert (=> d!73683 (or (= lt!343736 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343731 (bvsdiv (bvmul lt!343736 lt!343731) lt!343736)))))

(assert (=> d!73683 (= lt!343731 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73683 (= lt!343736 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9911 lt!342886)))))))

(assert (=> d!73683 (= lt!343733 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9786 (_2!9911 lt!342886))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9781 (_2!9911 lt!342886)))))))

(assert (=> d!73683 (invariant!0 (currentBit!9781 (_2!9911 lt!342886)) (currentByte!9786 (_2!9911 lt!342886)) (size!4658 (buf!5199 (_2!9911 lt!342886))))))

(assert (=> d!73683 (= (bitIndex!0 (size!4658 (buf!5199 (_2!9911 lt!342886))) (currentByte!9786 (_2!9911 lt!342886)) (currentBit!9781 (_2!9911 lt!342886))) lt!343733)))

(declare-fun b!217207 () Bool)

(declare-fun res!182756 () Bool)

(assert (=> b!217207 (=> (not res!182756) (not e!147696))))

(assert (=> b!217207 (= res!182756 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343733))))

(declare-fun b!217208 () Bool)

(declare-fun lt!343734 () (_ BitVec 64))

(assert (=> b!217208 (= e!147696 (bvsle lt!343733 (bvmul lt!343734 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217208 (or (= lt!343734 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343734 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343734)))))

(assert (=> b!217208 (= lt!343734 ((_ sign_extend 32) (size!4658 (buf!5199 (_2!9911 lt!342886)))))))

(assert (= (and d!73683 res!182755) b!217207))

(assert (= (and b!217207 res!182756) b!217208))

(declare-fun m!335107 () Bool)

(assert (=> d!73683 m!335107))

(declare-fun m!335109 () Bool)

(assert (=> d!73683 m!335109))

(assert (=> b!216863 d!73683))

(assert (=> b!216861 d!73547))

(declare-fun d!73685 () Bool)

(assert (=> d!73685 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9781 thiss!1204) (currentByte!9786 thiss!1204) (size!4658 (buf!5199 thiss!1204))))))

(declare-fun bs!17992 () Bool)

(assert (= bs!17992 d!73685))

(assert (=> bs!17992 m!334547))

(assert (=> start!45032 d!73685))

(assert (=> b!216850 d!73539))

(assert (=> b!216850 d!73541))

(check-sat (not d!73555) (not b!216996) (not d!73499) (not d!73543) (not b!217158) (not d!73511) (not b!216971) (not d!73665) (not b!216964) (not b!216968) (not d!73667) (not d!73553) (not d!73531) (not d!73679) (not b!216979) (not d!73523) (not b!217007) (not b!217157) (not d!73677) (not d!73675) (not b!217153) (not b!217154) (not b!216969) (not d!73501) (not d!73525) (not d!73683) (not d!73549) (not b!217155) (not d!73519) (not d!73529) (not b!217182) (not d!73533) (not b!217180) (not b!217159) (not b!216997) (not d!73505) (not b!217005) (not d!73497) (not b!216998) (not b!216967) (not d!73509) (not d!73685) (not b!217163) (not d!73503) (not bm!3393) (not d!73673) (not b!217012) (not d!73541) (not d!73515) (not b!217162) (not d!73527) (not b!216995) (not d!73681) (not d!73539) (not b!216972) (not d!73517) (not b!217152) (not b!217010) (not d!73513) (not b!216973) (not b!216966) (not b!217164))
