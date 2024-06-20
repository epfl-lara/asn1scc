; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25660 () Bool)

(assert start!25660)

(declare-fun b!130627 () Bool)

(declare-fun res!108296 () Bool)

(declare-fun e!86570 () Bool)

(assert (=> b!130627 (=> (not res!108296) (not e!86570))))

(declare-datatypes ((array!6040 0))(
  ( (array!6041 (arr!3357 (Array (_ BitVec 32) (_ BitVec 8))) (size!2734 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4732 0))(
  ( (BitStream!4733 (buf!3095 array!6040) (currentByte!5868 (_ BitVec 32)) (currentBit!5863 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8082 0))(
  ( (Unit!8083) )
))
(declare-datatypes ((tuple2!11236 0))(
  ( (tuple2!11237 (_1!5918 Unit!8082) (_2!5918 BitStream!4732)) )
))
(declare-fun lt!201619 () tuple2!11236)

(declare-fun lt!201613 () tuple2!11236)

(declare-fun isPrefixOf!0 (BitStream!4732 BitStream!4732) Bool)

(assert (=> b!130627 (= res!108296 (isPrefixOf!0 (_2!5918 lt!201619) (_2!5918 lt!201613)))))

(declare-fun b!130628 () Bool)

(declare-fun e!86565 () Bool)

(declare-fun thiss!1634 () BitStream!4732)

(declare-fun array_inv!2523 (array!6040) Bool)

(assert (=> b!130628 (= e!86565 (array_inv!2523 (buf!3095 thiss!1634)))))

(declare-fun e!86566 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!130629 () Bool)

(declare-fun arr!237 () array!6040)

(declare-datatypes ((tuple2!11238 0))(
  ( (tuple2!11239 (_1!5919 BitStream!4732) (_2!5919 array!6040)) )
))
(declare-fun lt!201620 () tuple2!11238)

(declare-fun arrayRangesEq!137 (array!6040 array!6040 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130629 (= e!86566 (not (arrayRangesEq!137 arr!237 (_2!5919 lt!201620) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130631 () Bool)

(declare-fun res!108300 () Bool)

(declare-fun e!86564 () Bool)

(assert (=> b!130631 (=> (not res!108300) (not e!86564))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130631 (= res!108300 (invariant!0 (currentBit!5863 thiss!1634) (currentByte!5868 thiss!1634) (size!2734 (buf!3095 thiss!1634))))))

(declare-fun b!130632 () Bool)

(declare-fun res!108293 () Bool)

(assert (=> b!130632 (=> (not res!108293) (not e!86564))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130632 (= res!108293 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2734 (buf!3095 thiss!1634))) ((_ sign_extend 32) (currentByte!5868 thiss!1634)) ((_ sign_extend 32) (currentBit!5863 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130633 () Bool)

(assert (=> b!130633 (= e!86564 (not true))))

(declare-datatypes ((tuple2!11240 0))(
  ( (tuple2!11241 (_1!5920 BitStream!4732) (_2!5920 BitStream!4732)) )
))
(declare-fun lt!201617 () tuple2!11240)

(declare-datatypes ((tuple2!11242 0))(
  ( (tuple2!11243 (_1!5921 BitStream!4732) (_2!5921 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!4732) tuple2!11242)

(assert (=> b!130633 (= (_2!5921 (readBytePure!0 (_1!5920 lt!201617))) (select (arr!3357 arr!237) from!447))))

(declare-fun lt!201608 () tuple2!11240)

(declare-fun reader!0 (BitStream!4732 BitStream!4732) tuple2!11240)

(assert (=> b!130633 (= lt!201608 (reader!0 (_2!5918 lt!201619) (_2!5918 lt!201613)))))

(assert (=> b!130633 (= lt!201617 (reader!0 thiss!1634 (_2!5918 lt!201613)))))

(declare-fun e!86571 () Bool)

(assert (=> b!130633 e!86571))

(declare-fun res!108304 () Bool)

(assert (=> b!130633 (=> (not res!108304) (not e!86571))))

(declare-fun lt!201605 () tuple2!11242)

(declare-fun lt!201618 () tuple2!11242)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130633 (= res!108304 (= (bitIndex!0 (size!2734 (buf!3095 (_1!5921 lt!201605))) (currentByte!5868 (_1!5921 lt!201605)) (currentBit!5863 (_1!5921 lt!201605))) (bitIndex!0 (size!2734 (buf!3095 (_1!5921 lt!201618))) (currentByte!5868 (_1!5921 lt!201618)) (currentBit!5863 (_1!5921 lt!201618)))))))

(declare-fun lt!201615 () Unit!8082)

(declare-fun lt!201611 () BitStream!4732)

(declare-fun readBytePrefixLemma!0 (BitStream!4732 BitStream!4732) Unit!8082)

(assert (=> b!130633 (= lt!201615 (readBytePrefixLemma!0 lt!201611 (_2!5918 lt!201613)))))

(assert (=> b!130633 (= lt!201618 (readBytePure!0 (BitStream!4733 (buf!3095 (_2!5918 lt!201613)) (currentByte!5868 thiss!1634) (currentBit!5863 thiss!1634))))))

(assert (=> b!130633 (= lt!201605 (readBytePure!0 lt!201611))))

(assert (=> b!130633 (= lt!201611 (BitStream!4733 (buf!3095 (_2!5918 lt!201619)) (currentByte!5868 thiss!1634) (currentBit!5863 thiss!1634)))))

(declare-fun e!86569 () Bool)

(assert (=> b!130633 e!86569))

(declare-fun res!108294 () Bool)

(assert (=> b!130633 (=> (not res!108294) (not e!86569))))

(assert (=> b!130633 (= res!108294 (isPrefixOf!0 thiss!1634 (_2!5918 lt!201613)))))

(declare-fun lt!201616 () Unit!8082)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4732 BitStream!4732 BitStream!4732) Unit!8082)

(assert (=> b!130633 (= lt!201616 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5918 lt!201619) (_2!5918 lt!201613)))))

(declare-fun e!86572 () Bool)

(assert (=> b!130633 e!86572))

(declare-fun res!108299 () Bool)

(assert (=> b!130633 (=> (not res!108299) (not e!86572))))

(assert (=> b!130633 (= res!108299 (= (size!2734 (buf!3095 (_2!5918 lt!201619))) (size!2734 (buf!3095 (_2!5918 lt!201613)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4732 array!6040 (_ BitVec 32) (_ BitVec 32)) tuple2!11236)

(assert (=> b!130633 (= lt!201613 (appendByteArrayLoop!0 (_2!5918 lt!201619) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130633 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2734 (buf!3095 (_2!5918 lt!201619)))) ((_ sign_extend 32) (currentByte!5868 (_2!5918 lt!201619))) ((_ sign_extend 32) (currentBit!5863 (_2!5918 lt!201619))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201607 () Unit!8082)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4732 BitStream!4732 (_ BitVec 64) (_ BitVec 32)) Unit!8082)

(assert (=> b!130633 (= lt!201607 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5918 lt!201619) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!86568 () Bool)

(assert (=> b!130633 e!86568))

(declare-fun res!108295 () Bool)

(assert (=> b!130633 (=> (not res!108295) (not e!86568))))

(assert (=> b!130633 (= res!108295 (= (size!2734 (buf!3095 thiss!1634)) (size!2734 (buf!3095 (_2!5918 lt!201619)))))))

(declare-fun appendByte!0 (BitStream!4732 (_ BitVec 8)) tuple2!11236)

(assert (=> b!130633 (= lt!201619 (appendByte!0 thiss!1634 (select (arr!3357 arr!237) from!447)))))

(declare-fun b!130634 () Bool)

(assert (=> b!130634 (= e!86571 (= (_2!5921 lt!201605) (_2!5921 lt!201618)))))

(declare-fun b!130635 () Bool)

(declare-fun res!108297 () Bool)

(assert (=> b!130635 (=> (not res!108297) (not e!86568))))

(assert (=> b!130635 (= res!108297 (isPrefixOf!0 thiss!1634 (_2!5918 lt!201619)))))

(declare-fun b!130636 () Bool)

(assert (=> b!130636 (= e!86570 (not e!86566))))

(declare-fun res!108301 () Bool)

(assert (=> b!130636 (=> res!108301 e!86566)))

(declare-fun lt!201614 () tuple2!11240)

(assert (=> b!130636 (= res!108301 (or (not (= (size!2734 (_2!5919 lt!201620)) (size!2734 arr!237))) (not (= (_1!5919 lt!201620) (_2!5920 lt!201614)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4732 array!6040 (_ BitVec 32) (_ BitVec 32)) tuple2!11238)

(assert (=> b!130636 (= lt!201620 (readByteArrayLoopPure!0 (_1!5920 lt!201614) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!201609 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130636 (validate_offset_bits!1 ((_ sign_extend 32) (size!2734 (buf!3095 (_2!5918 lt!201613)))) ((_ sign_extend 32) (currentByte!5868 (_2!5918 lt!201619))) ((_ sign_extend 32) (currentBit!5863 (_2!5918 lt!201619))) lt!201609)))

(declare-fun lt!201612 () Unit!8082)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4732 array!6040 (_ BitVec 64)) Unit!8082)

(assert (=> b!130636 (= lt!201612 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5918 lt!201619) (buf!3095 (_2!5918 lt!201613)) lt!201609))))

(assert (=> b!130636 (= lt!201614 (reader!0 (_2!5918 lt!201619) (_2!5918 lt!201613)))))

(declare-fun b!130637 () Bool)

(assert (=> b!130637 (= e!86572 e!86570)))

(declare-fun res!108292 () Bool)

(assert (=> b!130637 (=> (not res!108292) (not e!86570))))

(assert (=> b!130637 (= res!108292 (= (bitIndex!0 (size!2734 (buf!3095 (_2!5918 lt!201613))) (currentByte!5868 (_2!5918 lt!201613)) (currentBit!5863 (_2!5918 lt!201613))) (bvadd (bitIndex!0 (size!2734 (buf!3095 (_2!5918 lt!201619))) (currentByte!5868 (_2!5918 lt!201619)) (currentBit!5863 (_2!5918 lt!201619))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201609))))))

(assert (=> b!130637 (= lt!201609 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130638 () Bool)

(declare-fun res!108298 () Bool)

(assert (=> b!130638 (=> (not res!108298) (not e!86568))))

(assert (=> b!130638 (= res!108298 (= (bitIndex!0 (size!2734 (buf!3095 (_2!5918 lt!201619))) (currentByte!5868 (_2!5918 lt!201619)) (currentBit!5863 (_2!5918 lt!201619))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2734 (buf!3095 thiss!1634)) (currentByte!5868 thiss!1634) (currentBit!5863 thiss!1634)))))))

(declare-fun lt!201610 () tuple2!11240)

(declare-fun lt!201606 () tuple2!11242)

(declare-fun b!130639 () Bool)

(assert (=> b!130639 (= e!86568 (and (= (_2!5921 lt!201606) (select (arr!3357 arr!237) from!447)) (= (_1!5921 lt!201606) (_2!5920 lt!201610))))))

(assert (=> b!130639 (= lt!201606 (readBytePure!0 (_1!5920 lt!201610)))))

(assert (=> b!130639 (= lt!201610 (reader!0 thiss!1634 (_2!5918 lt!201619)))))

(declare-fun b!130640 () Bool)

(declare-fun res!108302 () Bool)

(assert (=> b!130640 (=> (not res!108302) (not e!86564))))

(assert (=> b!130640 (= res!108302 (bvslt from!447 to!404))))

(declare-fun b!130630 () Bool)

(assert (=> b!130630 (= e!86569 (invariant!0 (currentBit!5863 thiss!1634) (currentByte!5868 thiss!1634) (size!2734 (buf!3095 (_2!5918 lt!201619)))))))

(declare-fun res!108303 () Bool)

(assert (=> start!25660 (=> (not res!108303) (not e!86564))))

(assert (=> start!25660 (= res!108303 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2734 arr!237))))))

(assert (=> start!25660 e!86564))

(assert (=> start!25660 true))

(assert (=> start!25660 (array_inv!2523 arr!237)))

(declare-fun inv!12 (BitStream!4732) Bool)

(assert (=> start!25660 (and (inv!12 thiss!1634) e!86565)))

(assert (= (and start!25660 res!108303) b!130632))

(assert (= (and b!130632 res!108293) b!130640))

(assert (= (and b!130640 res!108302) b!130631))

(assert (= (and b!130631 res!108300) b!130633))

(assert (= (and b!130633 res!108295) b!130638))

(assert (= (and b!130638 res!108298) b!130635))

(assert (= (and b!130635 res!108297) b!130639))

(assert (= (and b!130633 res!108299) b!130637))

(assert (= (and b!130637 res!108292) b!130627))

(assert (= (and b!130627 res!108296) b!130636))

(assert (= (and b!130636 (not res!108301)) b!130629))

(assert (= (and b!130633 res!108294) b!130630))

(assert (= (and b!130633 res!108304) b!130634))

(assert (= start!25660 b!130628))

(declare-fun m!197029 () Bool)

(assert (=> b!130627 m!197029))

(declare-fun m!197031 () Bool)

(assert (=> b!130631 m!197031))

(declare-fun m!197033 () Bool)

(assert (=> b!130637 m!197033))

(declare-fun m!197035 () Bool)

(assert (=> b!130637 m!197035))

(declare-fun m!197037 () Bool)

(assert (=> b!130633 m!197037))

(declare-fun m!197039 () Bool)

(assert (=> b!130633 m!197039))

(declare-fun m!197041 () Bool)

(assert (=> b!130633 m!197041))

(declare-fun m!197043 () Bool)

(assert (=> b!130633 m!197043))

(declare-fun m!197045 () Bool)

(assert (=> b!130633 m!197045))

(declare-fun m!197047 () Bool)

(assert (=> b!130633 m!197047))

(declare-fun m!197049 () Bool)

(assert (=> b!130633 m!197049))

(declare-fun m!197051 () Bool)

(assert (=> b!130633 m!197051))

(declare-fun m!197053 () Bool)

(assert (=> b!130633 m!197053))

(declare-fun m!197055 () Bool)

(assert (=> b!130633 m!197055))

(declare-fun m!197057 () Bool)

(assert (=> b!130633 m!197057))

(declare-fun m!197059 () Bool)

(assert (=> b!130633 m!197059))

(declare-fun m!197061 () Bool)

(assert (=> b!130633 m!197061))

(assert (=> b!130633 m!197057))

(declare-fun m!197063 () Bool)

(assert (=> b!130633 m!197063))

(declare-fun m!197065 () Bool)

(assert (=> b!130633 m!197065))

(assert (=> b!130639 m!197057))

(declare-fun m!197067 () Bool)

(assert (=> b!130639 m!197067))

(declare-fun m!197069 () Bool)

(assert (=> b!130639 m!197069))

(declare-fun m!197071 () Bool)

(assert (=> b!130632 m!197071))

(declare-fun m!197073 () Bool)

(assert (=> b!130636 m!197073))

(declare-fun m!197075 () Bool)

(assert (=> b!130636 m!197075))

(declare-fun m!197077 () Bool)

(assert (=> b!130636 m!197077))

(assert (=> b!130636 m!197055))

(declare-fun m!197079 () Bool)

(assert (=> start!25660 m!197079))

(declare-fun m!197081 () Bool)

(assert (=> start!25660 m!197081))

(declare-fun m!197083 () Bool)

(assert (=> b!130629 m!197083))

(assert (=> b!130638 m!197035))

(declare-fun m!197085 () Bool)

(assert (=> b!130638 m!197085))

(declare-fun m!197087 () Bool)

(assert (=> b!130628 m!197087))

(declare-fun m!197089 () Bool)

(assert (=> b!130630 m!197089))

(declare-fun m!197091 () Bool)

(assert (=> b!130635 m!197091))

(push 1)

(assert (not b!130637))

(assert (not b!130633))

(assert (not b!130628))

(assert (not b!130630))

(assert (not start!25660))

(assert (not b!130635))

(assert (not b!130627))

(assert (not b!130638))

(assert (not b!130632))

(assert (not b!130636))

(assert (not b!130631))

(assert (not b!130629))

(assert (not b!130639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

