; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25146 () Bool)

(assert start!25146)

(declare-fun res!105526 () Bool)

(declare-fun e!84025 () Bool)

(assert (=> start!25146 (=> (not res!105526) (not e!84025))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5771 0))(
  ( (array!5772 (arr!3228 (Array (_ BitVec 32) (_ BitVec 8))) (size!2611 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5771)

(assert (=> start!25146 (= res!105526 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2611 arr!227))))))

(assert (=> start!25146 e!84025))

(assert (=> start!25146 true))

(declare-fun array_inv!2400 (array!5771) Bool)

(assert (=> start!25146 (array_inv!2400 arr!227)))

(declare-datatypes ((BitStream!4546 0))(
  ( (BitStream!4547 (buf!2999 array!5771) (currentByte!5744 (_ BitVec 32)) (currentBit!5739 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4546)

(declare-fun e!84019 () Bool)

(declare-fun inv!12 (BitStream!4546) Bool)

(assert (=> start!25146 (and (inv!12 thiss!1614) e!84019)))

(declare-fun b!127299 () Bool)

(declare-fun res!105528 () Bool)

(assert (=> b!127299 (=> (not res!105528) (not e!84025))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127299 (= res!105528 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2611 (buf!2999 thiss!1614))) ((_ sign_extend 32) (currentByte!5744 thiss!1614)) ((_ sign_extend 32) (currentBit!5739 thiss!1614)) noOfBytes!1))))

(declare-fun b!127300 () Bool)

(assert (=> b!127300 (= e!84019 (array_inv!2400 (buf!2999 thiss!1614)))))

(declare-fun b!127301 () Bool)

(declare-fun e!84020 () Bool)

(assert (=> b!127301 (= e!84025 (not e!84020))))

(declare-fun res!105532 () Bool)

(assert (=> b!127301 (=> res!105532 e!84020)))

(declare-datatypes ((Unit!7825 0))(
  ( (Unit!7826) )
))
(declare-datatypes ((tuple2!10714 0))(
  ( (tuple2!10715 (_1!5645 Unit!7825) (_2!5645 BitStream!4546)) )
))
(declare-fun lt!198737 () tuple2!10714)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127301 (= res!105532 (not (= (bitIndex!0 (size!2611 (buf!2999 (_2!5645 lt!198737))) (currentByte!5744 (_2!5645 lt!198737)) (currentBit!5739 (_2!5645 lt!198737))) (bvadd (bitIndex!0 (size!2611 (buf!2999 thiss!1614)) (currentByte!5744 thiss!1614) (currentBit!5739 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!84021 () Bool)

(assert (=> b!127301 e!84021))

(declare-fun res!105529 () Bool)

(assert (=> b!127301 (=> (not res!105529) (not e!84021))))

(assert (=> b!127301 (= res!105529 (= (size!2611 (buf!2999 thiss!1614)) (size!2611 (buf!2999 (_2!5645 lt!198737)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4546 array!5771 (_ BitVec 32) (_ BitVec 32)) tuple2!10714)

(assert (=> b!127301 (= lt!198737 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((tuple2!10716 0))(
  ( (tuple2!10717 (_1!5646 BitStream!4546) (_2!5646 array!5771)) )
))
(declare-fun lt!198734 () tuple2!10716)

(declare-fun e!84023 () Bool)

(declare-fun b!127302 () Bool)

(declare-fun arrayRangesEq!95 (array!5771 array!5771 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127302 (= e!84023 (not (arrayRangesEq!95 arr!227 (_2!5646 lt!198734) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127303 () Bool)

(declare-fun e!84022 () Bool)

(assert (=> b!127303 (= e!84021 e!84022)))

(declare-fun res!105531 () Bool)

(assert (=> b!127303 (=> (not res!105531) (not e!84022))))

(declare-fun lt!198735 () (_ BitVec 64))

(assert (=> b!127303 (= res!105531 (= (bitIndex!0 (size!2611 (buf!2999 (_2!5645 lt!198737))) (currentByte!5744 (_2!5645 lt!198737)) (currentBit!5739 (_2!5645 lt!198737))) (bvadd (bitIndex!0 (size!2611 (buf!2999 thiss!1614)) (currentByte!5744 thiss!1614) (currentBit!5739 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198735))))))

(assert (=> b!127303 (= lt!198735 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127304 () Bool)

(declare-fun res!105527 () Bool)

(assert (=> b!127304 (=> (not res!105527) (not e!84022))))

(declare-fun isPrefixOf!0 (BitStream!4546 BitStream!4546) Bool)

(assert (=> b!127304 (= res!105527 (isPrefixOf!0 thiss!1614 (_2!5645 lt!198737)))))

(declare-fun b!127305 () Bool)

(assert (=> b!127305 (= e!84022 (not e!84023))))

(declare-fun res!105530 () Bool)

(assert (=> b!127305 (=> res!105530 e!84023)))

(declare-datatypes ((tuple2!10718 0))(
  ( (tuple2!10719 (_1!5647 BitStream!4546) (_2!5647 BitStream!4546)) )
))
(declare-fun lt!198732 () tuple2!10718)

(assert (=> b!127305 (= res!105530 (or (not (= (size!2611 (_2!5646 lt!198734)) (size!2611 arr!227))) (not (= (_1!5646 lt!198734) (_2!5647 lt!198732)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4546 array!5771 (_ BitVec 32) (_ BitVec 32)) tuple2!10716)

(assert (=> b!127305 (= lt!198734 (readByteArrayLoopPure!0 (_1!5647 lt!198732) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127305 (validate_offset_bits!1 ((_ sign_extend 32) (size!2611 (buf!2999 (_2!5645 lt!198737)))) ((_ sign_extend 32) (currentByte!5744 thiss!1614)) ((_ sign_extend 32) (currentBit!5739 thiss!1614)) lt!198735)))

(declare-fun lt!198733 () Unit!7825)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4546 array!5771 (_ BitVec 64)) Unit!7825)

(assert (=> b!127305 (= lt!198733 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2999 (_2!5645 lt!198737)) lt!198735))))

(declare-fun reader!0 (BitStream!4546 BitStream!4546) tuple2!10718)

(assert (=> b!127305 (= lt!198732 (reader!0 thiss!1614 (_2!5645 lt!198737)))))

(declare-fun b!127306 () Bool)

(assert (=> b!127306 (= e!84020 true)))

(declare-fun lt!198736 () tuple2!10718)

(assert (=> b!127306 (= lt!198736 (reader!0 thiss!1614 (_2!5645 lt!198737)))))

(declare-fun b!127307 () Bool)

(declare-fun res!105525 () Bool)

(assert (=> b!127307 (=> res!105525 e!84020)))

(assert (=> b!127307 (= res!105525 (not (isPrefixOf!0 thiss!1614 (_2!5645 lt!198737))))))

(assert (= (and start!25146 res!105526) b!127299))

(assert (= (and b!127299 res!105528) b!127301))

(assert (= (and b!127301 res!105529) b!127303))

(assert (= (and b!127303 res!105531) b!127304))

(assert (= (and b!127304 res!105527) b!127305))

(assert (= (and b!127305 (not res!105530)) b!127302))

(assert (= (and b!127301 (not res!105532)) b!127307))

(assert (= (and b!127307 (not res!105525)) b!127306))

(assert (= start!25146 b!127300))

(declare-fun m!192999 () Bool)

(assert (=> b!127306 m!192999))

(declare-fun m!193001 () Bool)

(assert (=> start!25146 m!193001))

(declare-fun m!193003 () Bool)

(assert (=> start!25146 m!193003))

(declare-fun m!193005 () Bool)

(assert (=> b!127307 m!193005))

(declare-fun m!193007 () Bool)

(assert (=> b!127301 m!193007))

(declare-fun m!193009 () Bool)

(assert (=> b!127301 m!193009))

(declare-fun m!193011 () Bool)

(assert (=> b!127301 m!193011))

(declare-fun m!193013 () Bool)

(assert (=> b!127299 m!193013))

(assert (=> b!127303 m!193007))

(assert (=> b!127303 m!193009))

(assert (=> b!127304 m!193005))

(declare-fun m!193015 () Bool)

(assert (=> b!127300 m!193015))

(declare-fun m!193017 () Bool)

(assert (=> b!127302 m!193017))

(declare-fun m!193019 () Bool)

(assert (=> b!127305 m!193019))

(declare-fun m!193021 () Bool)

(assert (=> b!127305 m!193021))

(declare-fun m!193023 () Bool)

(assert (=> b!127305 m!193023))

(assert (=> b!127305 m!192999))

(push 1)

(assert (not start!25146))

(assert (not b!127299))

(assert (not b!127300))

(assert (not b!127306))

(assert (not b!127304))

(assert (not b!127303))

(assert (not b!127302))

(assert (not b!127305))

(assert (not b!127307))

(assert (not b!127301))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

