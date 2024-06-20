; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25672 () Bool)

(assert start!25672)

(declare-fun b!130879 () Bool)

(declare-fun e!86747 () Bool)

(declare-fun e!86746 () Bool)

(assert (=> b!130879 (= e!86747 e!86746)))

(declare-fun res!108529 () Bool)

(assert (=> b!130879 (=> (not res!108529) (not e!86746))))

(declare-fun lt!201906 () (_ BitVec 64))

(declare-datatypes ((array!6052 0))(
  ( (array!6053 (arr!3363 (Array (_ BitVec 32) (_ BitVec 8))) (size!2740 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4744 0))(
  ( (BitStream!4745 (buf!3101 array!6052) (currentByte!5874 (_ BitVec 32)) (currentBit!5869 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8094 0))(
  ( (Unit!8095) )
))
(declare-datatypes ((tuple2!11284 0))(
  ( (tuple2!11285 (_1!5942 Unit!8094) (_2!5942 BitStream!4744)) )
))
(declare-fun lt!201909 () tuple2!11284)

(declare-fun lt!201903 () tuple2!11284)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130879 (= res!108529 (= (bitIndex!0 (size!2740 (buf!3101 (_2!5942 lt!201903))) (currentByte!5874 (_2!5942 lt!201903)) (currentBit!5869 (_2!5942 lt!201903))) (bvadd (bitIndex!0 (size!2740 (buf!3101 (_2!5942 lt!201909))) (currentByte!5874 (_2!5942 lt!201909)) (currentBit!5869 (_2!5942 lt!201909))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201906))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!130879 (= lt!201906 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130880 () Bool)

(declare-fun res!108531 () Bool)

(declare-fun e!86749 () Bool)

(assert (=> b!130880 (=> (not res!108531) (not e!86749))))

(declare-fun thiss!1634 () BitStream!4744)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130880 (= res!108531 (invariant!0 (currentBit!5869 thiss!1634) (currentByte!5874 thiss!1634) (size!2740 (buf!3101 thiss!1634))))))

(declare-fun b!130881 () Bool)

(declare-fun e!86745 () Bool)

(declare-fun array_inv!2529 (array!6052) Bool)

(assert (=> b!130881 (= e!86745 (array_inv!2529 (buf!3101 thiss!1634)))))

(declare-fun b!130882 () Bool)

(declare-fun res!108536 () Bool)

(declare-fun e!86750 () Bool)

(assert (=> b!130882 (=> (not res!108536) (not e!86750))))

(declare-fun isPrefixOf!0 (BitStream!4744 BitStream!4744) Bool)

(assert (=> b!130882 (= res!108536 (isPrefixOf!0 thiss!1634 (_2!5942 lt!201909)))))

(declare-fun b!130883 () Bool)

(declare-fun e!86751 () Bool)

(declare-datatypes ((tuple2!11286 0))(
  ( (tuple2!11287 (_1!5943 BitStream!4744) (_2!5943 (_ BitVec 8))) )
))
(declare-fun lt!201897 () tuple2!11286)

(declare-fun lt!201895 () tuple2!11286)

(assert (=> b!130883 (= e!86751 (= (_2!5943 lt!201897) (_2!5943 lt!201895)))))

(declare-fun b!130884 () Bool)

(declare-fun e!86753 () Bool)

(assert (=> b!130884 (= e!86746 (not e!86753))))

(declare-fun res!108535 () Bool)

(assert (=> b!130884 (=> res!108535 e!86753)))

(declare-datatypes ((tuple2!11288 0))(
  ( (tuple2!11289 (_1!5944 BitStream!4744) (_2!5944 array!6052)) )
))
(declare-fun lt!201900 () tuple2!11288)

(declare-fun arr!237 () array!6052)

(declare-datatypes ((tuple2!11290 0))(
  ( (tuple2!11291 (_1!5945 BitStream!4744) (_2!5945 BitStream!4744)) )
))
(declare-fun lt!201896 () tuple2!11290)

(assert (=> b!130884 (= res!108535 (or (not (= (size!2740 (_2!5944 lt!201900)) (size!2740 arr!237))) (not (= (_1!5944 lt!201900) (_2!5945 lt!201896)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4744 array!6052 (_ BitVec 32) (_ BitVec 32)) tuple2!11288)

(assert (=> b!130884 (= lt!201900 (readByteArrayLoopPure!0 (_1!5945 lt!201896) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130884 (validate_offset_bits!1 ((_ sign_extend 32) (size!2740 (buf!3101 (_2!5942 lt!201903)))) ((_ sign_extend 32) (currentByte!5874 (_2!5942 lt!201909))) ((_ sign_extend 32) (currentBit!5869 (_2!5942 lt!201909))) lt!201906)))

(declare-fun lt!201899 () Unit!8094)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4744 array!6052 (_ BitVec 64)) Unit!8094)

(assert (=> b!130884 (= lt!201899 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5942 lt!201909) (buf!3101 (_2!5942 lt!201903)) lt!201906))))

(declare-fun reader!0 (BitStream!4744 BitStream!4744) tuple2!11290)

(assert (=> b!130884 (= lt!201896 (reader!0 (_2!5942 lt!201909) (_2!5942 lt!201903)))))

(declare-fun b!130885 () Bool)

(declare-fun res!108537 () Bool)

(assert (=> b!130885 (=> (not res!108537) (not e!86749))))

(assert (=> b!130885 (= res!108537 (bvslt from!447 to!404))))

(declare-fun b!130886 () Bool)

(declare-fun res!108534 () Bool)

(assert (=> b!130886 (=> (not res!108534) (not e!86750))))

(assert (=> b!130886 (= res!108534 (= (bitIndex!0 (size!2740 (buf!3101 (_2!5942 lt!201909))) (currentByte!5874 (_2!5942 lt!201909)) (currentBit!5869 (_2!5942 lt!201909))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2740 (buf!3101 thiss!1634)) (currentByte!5874 thiss!1634) (currentBit!5869 thiss!1634)))))))

(declare-fun b!130887 () Bool)

(assert (=> b!130887 (= e!86749 (not true))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130887 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2740 (buf!3101 (_2!5942 lt!201903)))) ((_ sign_extend 32) (currentByte!5874 thiss!1634)) ((_ sign_extend 32) (currentBit!5869 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!201904 () Unit!8094)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4744 array!6052 (_ BitVec 32)) Unit!8094)

(assert (=> b!130887 (= lt!201904 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3101 (_2!5942 lt!201903)) (bvsub to!404 from!447)))))

(declare-fun lt!201908 () tuple2!11290)

(declare-fun readBytePure!0 (BitStream!4744) tuple2!11286)

(assert (=> b!130887 (= (_2!5943 (readBytePure!0 (_1!5945 lt!201908))) (select (arr!3363 arr!237) from!447))))

(declare-fun lt!201902 () tuple2!11290)

(assert (=> b!130887 (= lt!201902 (reader!0 (_2!5942 lt!201909) (_2!5942 lt!201903)))))

(assert (=> b!130887 (= lt!201908 (reader!0 thiss!1634 (_2!5942 lt!201903)))))

(assert (=> b!130887 e!86751))

(declare-fun res!108530 () Bool)

(assert (=> b!130887 (=> (not res!108530) (not e!86751))))

(assert (=> b!130887 (= res!108530 (= (bitIndex!0 (size!2740 (buf!3101 (_1!5943 lt!201897))) (currentByte!5874 (_1!5943 lt!201897)) (currentBit!5869 (_1!5943 lt!201897))) (bitIndex!0 (size!2740 (buf!3101 (_1!5943 lt!201895))) (currentByte!5874 (_1!5943 lt!201895)) (currentBit!5869 (_1!5943 lt!201895)))))))

(declare-fun lt!201905 () Unit!8094)

(declare-fun lt!201901 () BitStream!4744)

(declare-fun readBytePrefixLemma!0 (BitStream!4744 BitStream!4744) Unit!8094)

(assert (=> b!130887 (= lt!201905 (readBytePrefixLemma!0 lt!201901 (_2!5942 lt!201903)))))

(assert (=> b!130887 (= lt!201895 (readBytePure!0 (BitStream!4745 (buf!3101 (_2!5942 lt!201903)) (currentByte!5874 thiss!1634) (currentBit!5869 thiss!1634))))))

(assert (=> b!130887 (= lt!201897 (readBytePure!0 lt!201901))))

(assert (=> b!130887 (= lt!201901 (BitStream!4745 (buf!3101 (_2!5942 lt!201909)) (currentByte!5874 thiss!1634) (currentBit!5869 thiss!1634)))))

(declare-fun e!86744 () Bool)

(assert (=> b!130887 e!86744))

(declare-fun res!108538 () Bool)

(assert (=> b!130887 (=> (not res!108538) (not e!86744))))

(assert (=> b!130887 (= res!108538 (isPrefixOf!0 thiss!1634 (_2!5942 lt!201903)))))

(declare-fun lt!201898 () Unit!8094)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4744 BitStream!4744 BitStream!4744) Unit!8094)

(assert (=> b!130887 (= lt!201898 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5942 lt!201909) (_2!5942 lt!201903)))))

(assert (=> b!130887 e!86747))

(declare-fun res!108527 () Bool)

(assert (=> b!130887 (=> (not res!108527) (not e!86747))))

(assert (=> b!130887 (= res!108527 (= (size!2740 (buf!3101 (_2!5942 lt!201909))) (size!2740 (buf!3101 (_2!5942 lt!201903)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4744 array!6052 (_ BitVec 32) (_ BitVec 32)) tuple2!11284)

(assert (=> b!130887 (= lt!201903 (appendByteArrayLoop!0 (_2!5942 lt!201909) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130887 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2740 (buf!3101 (_2!5942 lt!201909)))) ((_ sign_extend 32) (currentByte!5874 (_2!5942 lt!201909))) ((_ sign_extend 32) (currentBit!5869 (_2!5942 lt!201909))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201907 () Unit!8094)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4744 BitStream!4744 (_ BitVec 64) (_ BitVec 32)) Unit!8094)

(assert (=> b!130887 (= lt!201907 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5942 lt!201909) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130887 e!86750))

(declare-fun res!108526 () Bool)

(assert (=> b!130887 (=> (not res!108526) (not e!86750))))

(assert (=> b!130887 (= res!108526 (= (size!2740 (buf!3101 thiss!1634)) (size!2740 (buf!3101 (_2!5942 lt!201909)))))))

(declare-fun appendByte!0 (BitStream!4744 (_ BitVec 8)) tuple2!11284)

(assert (=> b!130887 (= lt!201909 (appendByte!0 thiss!1634 (select (arr!3363 arr!237) from!447)))))

(declare-fun b!130888 () Bool)

(assert (=> b!130888 (= e!86744 (invariant!0 (currentBit!5869 thiss!1634) (currentByte!5874 thiss!1634) (size!2740 (buf!3101 (_2!5942 lt!201909)))))))

(declare-fun b!130889 () Bool)

(declare-fun arrayRangesEq!143 (array!6052 array!6052 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130889 (= e!86753 (not (arrayRangesEq!143 arr!237 (_2!5944 lt!201900) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130890 () Bool)

(declare-fun res!108533 () Bool)

(assert (=> b!130890 (=> (not res!108533) (not e!86746))))

(assert (=> b!130890 (= res!108533 (isPrefixOf!0 (_2!5942 lt!201909) (_2!5942 lt!201903)))))

(declare-fun res!108532 () Bool)

(assert (=> start!25672 (=> (not res!108532) (not e!86749))))

(assert (=> start!25672 (= res!108532 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2740 arr!237))))))

(assert (=> start!25672 e!86749))

(assert (=> start!25672 true))

(assert (=> start!25672 (array_inv!2529 arr!237)))

(declare-fun inv!12 (BitStream!4744) Bool)

(assert (=> start!25672 (and (inv!12 thiss!1634) e!86745)))

(declare-fun b!130891 () Bool)

(declare-fun res!108528 () Bool)

(assert (=> b!130891 (=> (not res!108528) (not e!86749))))

(assert (=> b!130891 (= res!108528 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2740 (buf!3101 thiss!1634))) ((_ sign_extend 32) (currentByte!5874 thiss!1634)) ((_ sign_extend 32) (currentBit!5869 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!201911 () tuple2!11286)

(declare-fun b!130892 () Bool)

(declare-fun lt!201910 () tuple2!11290)

(assert (=> b!130892 (= e!86750 (and (= (_2!5943 lt!201911) (select (arr!3363 arr!237) from!447)) (= (_1!5943 lt!201911) (_2!5945 lt!201910))))))

(assert (=> b!130892 (= lt!201911 (readBytePure!0 (_1!5945 lt!201910)))))

(assert (=> b!130892 (= lt!201910 (reader!0 thiss!1634 (_2!5942 lt!201909)))))

(assert (= (and start!25672 res!108532) b!130891))

(assert (= (and b!130891 res!108528) b!130885))

(assert (= (and b!130885 res!108537) b!130880))

(assert (= (and b!130880 res!108531) b!130887))

(assert (= (and b!130887 res!108526) b!130886))

(assert (= (and b!130886 res!108534) b!130882))

(assert (= (and b!130882 res!108536) b!130892))

(assert (= (and b!130887 res!108527) b!130879))

(assert (= (and b!130879 res!108529) b!130890))

(assert (= (and b!130890 res!108533) b!130884))

(assert (= (and b!130884 (not res!108535)) b!130889))

(assert (= (and b!130887 res!108538) b!130888))

(assert (= (and b!130887 res!108530) b!130883))

(assert (= start!25672 b!130881))

(declare-fun m!197413 () Bool)

(assert (=> b!130884 m!197413))

(declare-fun m!197415 () Bool)

(assert (=> b!130884 m!197415))

(declare-fun m!197417 () Bool)

(assert (=> b!130884 m!197417))

(declare-fun m!197419 () Bool)

(assert (=> b!130884 m!197419))

(declare-fun m!197421 () Bool)

(assert (=> b!130882 m!197421))

(declare-fun m!197423 () Bool)

(assert (=> b!130889 m!197423))

(declare-fun m!197425 () Bool)

(assert (=> b!130886 m!197425))

(declare-fun m!197427 () Bool)

(assert (=> b!130886 m!197427))

(declare-fun m!197429 () Bool)

(assert (=> b!130881 m!197429))

(assert (=> b!130887 m!197419))

(declare-fun m!197431 () Bool)

(assert (=> b!130887 m!197431))

(declare-fun m!197433 () Bool)

(assert (=> b!130887 m!197433))

(declare-fun m!197435 () Bool)

(assert (=> b!130887 m!197435))

(declare-fun m!197437 () Bool)

(assert (=> b!130887 m!197437))

(declare-fun m!197439 () Bool)

(assert (=> b!130887 m!197439))

(declare-fun m!197441 () Bool)

(assert (=> b!130887 m!197441))

(declare-fun m!197443 () Bool)

(assert (=> b!130887 m!197443))

(declare-fun m!197445 () Bool)

(assert (=> b!130887 m!197445))

(declare-fun m!197447 () Bool)

(assert (=> b!130887 m!197447))

(declare-fun m!197449 () Bool)

(assert (=> b!130887 m!197449))

(assert (=> b!130887 m!197447))

(declare-fun m!197451 () Bool)

(assert (=> b!130887 m!197451))

(declare-fun m!197453 () Bool)

(assert (=> b!130887 m!197453))

(declare-fun m!197455 () Bool)

(assert (=> b!130887 m!197455))

(declare-fun m!197457 () Bool)

(assert (=> b!130887 m!197457))

(declare-fun m!197459 () Bool)

(assert (=> b!130887 m!197459))

(declare-fun m!197461 () Bool)

(assert (=> b!130887 m!197461))

(declare-fun m!197463 () Bool)

(assert (=> b!130879 m!197463))

(assert (=> b!130879 m!197425))

(declare-fun m!197465 () Bool)

(assert (=> b!130890 m!197465))

(declare-fun m!197467 () Bool)

(assert (=> start!25672 m!197467))

(declare-fun m!197469 () Bool)

(assert (=> start!25672 m!197469))

(assert (=> b!130892 m!197447))

(declare-fun m!197471 () Bool)

(assert (=> b!130892 m!197471))

(declare-fun m!197473 () Bool)

(assert (=> b!130892 m!197473))

(declare-fun m!197475 () Bool)

(assert (=> b!130880 m!197475))

(declare-fun m!197477 () Bool)

(assert (=> b!130891 m!197477))

(declare-fun m!197479 () Bool)

(assert (=> b!130888 m!197479))

(push 1)

(assert (not b!130882))

(assert (not b!130890))

(assert (not b!130888))

(assert (not start!25672))

(assert (not b!130891))

(assert (not b!130881))

(assert (not b!130887))

(assert (not b!130886))

(assert (not b!130879))

(assert (not b!130880))

(assert (not b!130892))

(assert (not b!130884))

(assert (not b!130889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

