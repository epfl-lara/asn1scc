; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25518 () Bool)

(assert start!25518)

(declare-fun b!129617 () Bool)

(declare-fun res!107376 () Bool)

(declare-fun e!85908 () Bool)

(assert (=> b!129617 (=> (not res!107376) (not e!85908))))

(declare-datatypes ((array!6003 0))(
  ( (array!6004 (arr!3334 (Array (_ BitVec 32) (_ BitVec 8))) (size!2717 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4698 0))(
  ( (BitStream!4699 (buf!3075 array!6003) (currentByte!5836 (_ BitVec 32)) (currentBit!5831 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4698)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129617 (= res!107376 (invariant!0 (currentBit!5831 thiss!1634) (currentByte!5836 thiss!1634) (size!2717 (buf!3075 thiss!1634))))))

(declare-fun b!129618 () Bool)

(declare-fun e!85902 () Bool)

(declare-fun e!85901 () Bool)

(assert (=> b!129618 (= e!85902 e!85901)))

(declare-fun res!107372 () Bool)

(assert (=> b!129618 (=> (not res!107372) (not e!85901))))

(declare-datatypes ((Unit!8039 0))(
  ( (Unit!8040) )
))
(declare-datatypes ((tuple2!11094 0))(
  ( (tuple2!11095 (_1!5844 Unit!8039) (_2!5844 BitStream!4698)) )
))
(declare-fun lt!200207 () tuple2!11094)

(declare-fun lt!200199 () tuple2!11094)

(declare-fun lt!200208 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129618 (= res!107372 (= (bitIndex!0 (size!2717 (buf!3075 (_2!5844 lt!200207))) (currentByte!5836 (_2!5844 lt!200207)) (currentBit!5831 (_2!5844 lt!200207))) (bvadd (bitIndex!0 (size!2717 (buf!3075 (_2!5844 lt!200199))) (currentByte!5836 (_2!5844 lt!200199)) (currentBit!5831 (_2!5844 lt!200199))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200208))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!129618 (= lt!200208 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129619 () Bool)

(declare-fun res!107370 () Bool)

(declare-fun e!85904 () Bool)

(assert (=> b!129619 (=> res!107370 e!85904)))

(declare-fun lt!200198 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6003 array!6003 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129619 (= res!107370 (not (arrayBitRangesEq!0 (buf!3075 (_2!5844 lt!200199)) (buf!3075 (_2!5844 lt!200207)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200198)))))

(declare-fun b!129620 () Bool)

(declare-fun e!85905 () Bool)

(assert (=> b!129620 (= e!85905 (invariant!0 (currentBit!5831 thiss!1634) (currentByte!5836 thiss!1634) (size!2717 (buf!3075 (_2!5844 lt!200199)))))))

(declare-fun b!129621 () Bool)

(declare-fun e!85910 () Bool)

(declare-fun array_inv!2506 (array!6003) Bool)

(assert (=> b!129621 (= e!85910 (array_inv!2506 (buf!3075 thiss!1634)))))

(declare-fun arr!237 () array!6003)

(declare-fun b!129622 () Bool)

(declare-datatypes ((tuple2!11096 0))(
  ( (tuple2!11097 (_1!5845 BitStream!4698) (_2!5845 BitStream!4698)) )
))
(declare-fun lt!200201 () tuple2!11096)

(declare-datatypes ((tuple2!11098 0))(
  ( (tuple2!11099 (_1!5846 BitStream!4698) (_2!5846 (_ BitVec 8))) )
))
(declare-fun lt!200200 () tuple2!11098)

(declare-fun e!85907 () Bool)

(assert (=> b!129622 (= e!85907 (and (= (_2!5846 lt!200200) (select (arr!3334 arr!237) from!447)) (= (_1!5846 lt!200200) (_2!5845 lt!200201))))))

(declare-fun readBytePure!0 (BitStream!4698) tuple2!11098)

(assert (=> b!129622 (= lt!200200 (readBytePure!0 (_1!5845 lt!200201)))))

(declare-fun reader!0 (BitStream!4698 BitStream!4698) tuple2!11096)

(assert (=> b!129622 (= lt!200201 (reader!0 thiss!1634 (_2!5844 lt!200199)))))

(declare-fun b!129623 () Bool)

(declare-fun res!107365 () Bool)

(assert (=> b!129623 (=> (not res!107365) (not e!85907))))

(assert (=> b!129623 (= res!107365 (= (bitIndex!0 (size!2717 (buf!3075 (_2!5844 lt!200199))) (currentByte!5836 (_2!5844 lt!200199)) (currentBit!5831 (_2!5844 lt!200199))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2717 (buf!3075 thiss!1634)) (currentByte!5836 thiss!1634) (currentBit!5831 thiss!1634)))))))

(declare-fun b!129624 () Bool)

(declare-fun res!107363 () Bool)

(assert (=> b!129624 (=> (not res!107363) (not e!85901))))

(declare-fun isPrefixOf!0 (BitStream!4698 BitStream!4698) Bool)

(assert (=> b!129624 (= res!107363 (isPrefixOf!0 (_2!5844 lt!200199) (_2!5844 lt!200207)))))

(declare-datatypes ((tuple2!11100 0))(
  ( (tuple2!11101 (_1!5847 BitStream!4698) (_2!5847 array!6003)) )
))
(declare-fun lt!200209 () tuple2!11100)

(declare-fun e!85906 () Bool)

(declare-fun b!129625 () Bool)

(declare-fun arrayRangesEq!120 (array!6003 array!6003 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129625 (= e!85906 (not (arrayRangesEq!120 arr!237 (_2!5847 lt!200209) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129626 () Bool)

(declare-fun res!107369 () Bool)

(assert (=> b!129626 (=> res!107369 e!85904)))

(assert (=> b!129626 (= res!107369 (bvsgt lt!200198 (bitIndex!0 (size!2717 (buf!3075 (_2!5844 lt!200207))) (currentByte!5836 (_2!5844 lt!200207)) (currentBit!5831 (_2!5844 lt!200207)))))))

(declare-fun b!129627 () Bool)

(declare-fun res!107364 () Bool)

(assert (=> b!129627 (=> (not res!107364) (not e!85908))))

(assert (=> b!129627 (= res!107364 (bvslt from!447 to!404))))

(declare-fun b!129628 () Bool)

(assert (=> b!129628 (= e!85904 true)))

(declare-fun lt!200206 () tuple2!11098)

(assert (=> b!129628 (= lt!200206 (readBytePure!0 (BitStream!4699 (buf!3075 (_2!5844 lt!200207)) (currentByte!5836 thiss!1634) (currentBit!5831 thiss!1634))))))

(declare-fun lt!200202 () tuple2!11098)

(assert (=> b!129628 (= lt!200202 (readBytePure!0 (BitStream!4699 (buf!3075 (_2!5844 lt!200199)) (currentByte!5836 thiss!1634) (currentBit!5831 thiss!1634))))))

(declare-fun b!129629 () Bool)

(declare-fun res!107367 () Bool)

(assert (=> b!129629 (=> (not res!107367) (not e!85907))))

(assert (=> b!129629 (= res!107367 (isPrefixOf!0 thiss!1634 (_2!5844 lt!200199)))))

(declare-fun b!129630 () Bool)

(assert (=> b!129630 (= e!85901 (not e!85906))))

(declare-fun res!107377 () Bool)

(assert (=> b!129630 (=> res!107377 e!85906)))

(declare-fun lt!200210 () tuple2!11096)

(assert (=> b!129630 (= res!107377 (or (not (= (size!2717 (_2!5847 lt!200209)) (size!2717 arr!237))) (not (= (_1!5847 lt!200209) (_2!5845 lt!200210)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4698 array!6003 (_ BitVec 32) (_ BitVec 32)) tuple2!11100)

(assert (=> b!129630 (= lt!200209 (readByteArrayLoopPure!0 (_1!5845 lt!200210) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129630 (validate_offset_bits!1 ((_ sign_extend 32) (size!2717 (buf!3075 (_2!5844 lt!200207)))) ((_ sign_extend 32) (currentByte!5836 (_2!5844 lt!200199))) ((_ sign_extend 32) (currentBit!5831 (_2!5844 lt!200199))) lt!200208)))

(declare-fun lt!200204 () Unit!8039)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4698 array!6003 (_ BitVec 64)) Unit!8039)

(assert (=> b!129630 (= lt!200204 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5844 lt!200199) (buf!3075 (_2!5844 lt!200207)) lt!200208))))

(assert (=> b!129630 (= lt!200210 (reader!0 (_2!5844 lt!200199) (_2!5844 lt!200207)))))

(declare-fun b!129631 () Bool)

(assert (=> b!129631 (= e!85908 (not e!85904))))

(declare-fun res!107366 () Bool)

(assert (=> b!129631 (=> res!107366 e!85904)))

(assert (=> b!129631 (= res!107366 (bvsgt lt!200198 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2717 (buf!3075 (_2!5844 lt!200199)))))))))

(assert (=> b!129631 (= lt!200198 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2717 (buf!3075 (_2!5844 lt!200199))) (currentByte!5836 thiss!1634) (currentBit!5831 thiss!1634))))))

(assert (=> b!129631 e!85905))

(declare-fun res!107375 () Bool)

(assert (=> b!129631 (=> (not res!107375) (not e!85905))))

(assert (=> b!129631 (= res!107375 (isPrefixOf!0 thiss!1634 (_2!5844 lt!200207)))))

(declare-fun lt!200205 () Unit!8039)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4698 BitStream!4698 BitStream!4698) Unit!8039)

(assert (=> b!129631 (= lt!200205 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5844 lt!200199) (_2!5844 lt!200207)))))

(assert (=> b!129631 e!85902))

(declare-fun res!107374 () Bool)

(assert (=> b!129631 (=> (not res!107374) (not e!85902))))

(assert (=> b!129631 (= res!107374 (= (size!2717 (buf!3075 (_2!5844 lt!200199))) (size!2717 (buf!3075 (_2!5844 lt!200207)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4698 array!6003 (_ BitVec 32) (_ BitVec 32)) tuple2!11094)

(assert (=> b!129631 (= lt!200207 (appendByteArrayLoop!0 (_2!5844 lt!200199) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129631 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2717 (buf!3075 (_2!5844 lt!200199)))) ((_ sign_extend 32) (currentByte!5836 (_2!5844 lt!200199))) ((_ sign_extend 32) (currentBit!5831 (_2!5844 lt!200199))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200203 () Unit!8039)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4698 BitStream!4698 (_ BitVec 64) (_ BitVec 32)) Unit!8039)

(assert (=> b!129631 (= lt!200203 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5844 lt!200199) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129631 e!85907))

(declare-fun res!107368 () Bool)

(assert (=> b!129631 (=> (not res!107368) (not e!85907))))

(assert (=> b!129631 (= res!107368 (= (size!2717 (buf!3075 thiss!1634)) (size!2717 (buf!3075 (_2!5844 lt!200199)))))))

(declare-fun appendByte!0 (BitStream!4698 (_ BitVec 8)) tuple2!11094)

(assert (=> b!129631 (= lt!200199 (appendByte!0 thiss!1634 (select (arr!3334 arr!237) from!447)))))

(declare-fun res!107371 () Bool)

(assert (=> start!25518 (=> (not res!107371) (not e!85908))))

(assert (=> start!25518 (= res!107371 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2717 arr!237))))))

(assert (=> start!25518 e!85908))

(assert (=> start!25518 true))

(assert (=> start!25518 (array_inv!2506 arr!237)))

(declare-fun inv!12 (BitStream!4698) Bool)

(assert (=> start!25518 (and (inv!12 thiss!1634) e!85910)))

(declare-fun b!129632 () Bool)

(declare-fun res!107373 () Bool)

(assert (=> b!129632 (=> (not res!107373) (not e!85908))))

(assert (=> b!129632 (= res!107373 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2717 (buf!3075 thiss!1634))) ((_ sign_extend 32) (currentByte!5836 thiss!1634)) ((_ sign_extend 32) (currentBit!5831 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!25518 res!107371) b!129632))

(assert (= (and b!129632 res!107373) b!129627))

(assert (= (and b!129627 res!107364) b!129617))

(assert (= (and b!129617 res!107376) b!129631))

(assert (= (and b!129631 res!107368) b!129623))

(assert (= (and b!129623 res!107365) b!129629))

(assert (= (and b!129629 res!107367) b!129622))

(assert (= (and b!129631 res!107374) b!129618))

(assert (= (and b!129618 res!107372) b!129624))

(assert (= (and b!129624 res!107363) b!129630))

(assert (= (and b!129630 (not res!107377)) b!129625))

(assert (= (and b!129631 res!107375) b!129620))

(assert (= (and b!129631 (not res!107366)) b!129626))

(assert (= (and b!129626 (not res!107369)) b!129619))

(assert (= (and b!129619 (not res!107370)) b!129628))

(assert (= start!25518 b!129621))

(declare-fun m!195491 () Bool)

(assert (=> b!129619 m!195491))

(declare-fun m!195493 () Bool)

(assert (=> b!129622 m!195493))

(declare-fun m!195495 () Bool)

(assert (=> b!129622 m!195495))

(declare-fun m!195497 () Bool)

(assert (=> b!129622 m!195497))

(declare-fun m!195499 () Bool)

(assert (=> b!129621 m!195499))

(declare-fun m!195501 () Bool)

(assert (=> b!129630 m!195501))

(declare-fun m!195503 () Bool)

(assert (=> b!129630 m!195503))

(declare-fun m!195505 () Bool)

(assert (=> b!129630 m!195505))

(declare-fun m!195507 () Bool)

(assert (=> b!129630 m!195507))

(declare-fun m!195509 () Bool)

(assert (=> b!129620 m!195509))

(declare-fun m!195511 () Bool)

(assert (=> b!129625 m!195511))

(declare-fun m!195513 () Bool)

(assert (=> b!129623 m!195513))

(declare-fun m!195515 () Bool)

(assert (=> b!129623 m!195515))

(declare-fun m!195517 () Bool)

(assert (=> b!129631 m!195517))

(declare-fun m!195519 () Bool)

(assert (=> b!129631 m!195519))

(declare-fun m!195521 () Bool)

(assert (=> b!129631 m!195521))

(declare-fun m!195523 () Bool)

(assert (=> b!129631 m!195523))

(assert (=> b!129631 m!195493))

(declare-fun m!195525 () Bool)

(assert (=> b!129631 m!195525))

(assert (=> b!129631 m!195493))

(declare-fun m!195527 () Bool)

(assert (=> b!129631 m!195527))

(declare-fun m!195529 () Bool)

(assert (=> b!129631 m!195529))

(declare-fun m!195531 () Bool)

(assert (=> b!129629 m!195531))

(declare-fun m!195533 () Bool)

(assert (=> b!129624 m!195533))

(declare-fun m!195535 () Bool)

(assert (=> b!129628 m!195535))

(declare-fun m!195537 () Bool)

(assert (=> b!129628 m!195537))

(declare-fun m!195539 () Bool)

(assert (=> b!129626 m!195539))

(declare-fun m!195541 () Bool)

(assert (=> b!129617 m!195541))

(assert (=> b!129618 m!195539))

(assert (=> b!129618 m!195513))

(declare-fun m!195543 () Bool)

(assert (=> b!129632 m!195543))

(declare-fun m!195545 () Bool)

(assert (=> start!25518 m!195545))

(declare-fun m!195547 () Bool)

(assert (=> start!25518 m!195547))

(check-sat (not b!129619) (not b!129622) (not b!129630) (not start!25518) (not b!129617) (not b!129628) (not b!129624) (not b!129623) (not b!129620) (not b!129621) (not b!129632) (not b!129626) (not b!129618) (not b!129625) (not b!129629) (not b!129631))
