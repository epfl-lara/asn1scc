; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25376 () Bool)

(assert start!25376)

(declare-fun b!128128 () Bool)

(declare-fun res!106029 () Bool)

(declare-fun e!84965 () Bool)

(assert (=> b!128128 (=> (not res!106029) (not e!84965))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128128 (= res!106029 (bvslt from!447 to!404))))

(declare-fun b!128129 () Bool)

(declare-datatypes ((array!5912 0))(
  ( (array!5913 (arr!3290 (Array (_ BitVec 32) (_ BitVec 8))) (size!2673 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4610 0))(
  ( (BitStream!4611 (buf!3031 array!5912) (currentByte!5783 (_ BitVec 32)) (currentBit!5778 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4610)

(assert (=> b!128129 (= e!84965 (not (and (bvsle ((_ sign_extend 32) (size!2673 (buf!3031 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5783 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5778 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun e!84961 () Bool)

(assert (=> b!128129 e!84961))

(declare-fun res!106024 () Bool)

(assert (=> b!128129 (=> (not res!106024) (not e!84961))))

(declare-datatypes ((Unit!7948 0))(
  ( (Unit!7949) )
))
(declare-datatypes ((tuple2!10798 0))(
  ( (tuple2!10799 (_1!5696 Unit!7948) (_2!5696 BitStream!4610)) )
))
(declare-fun lt!199059 () tuple2!10798)

(assert (=> b!128129 (= res!106024 (= (size!2673 (buf!3031 thiss!1634)) (size!2673 (buf!3031 (_2!5696 lt!199059)))))))

(declare-fun arr!237 () array!5912)

(declare-fun appendByte!0 (BitStream!4610 (_ BitVec 8)) tuple2!10798)

(assert (=> b!128129 (= lt!199059 (appendByte!0 thiss!1634 (select (arr!3290 arr!237) from!447)))))

(declare-fun b!128130 () Bool)

(declare-fun res!106030 () Bool)

(assert (=> b!128130 (=> (not res!106030) (not e!84961))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128130 (= res!106030 (= (bitIndex!0 (size!2673 (buf!3031 (_2!5696 lt!199059))) (currentByte!5783 (_2!5696 lt!199059)) (currentBit!5778 (_2!5696 lt!199059))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2673 (buf!3031 thiss!1634)) (currentByte!5783 thiss!1634) (currentBit!5778 thiss!1634)))))))

(declare-datatypes ((tuple2!10800 0))(
  ( (tuple2!10801 (_1!5697 BitStream!4610) (_2!5697 (_ BitVec 8))) )
))
(declare-fun lt!199060 () tuple2!10800)

(declare-datatypes ((tuple2!10802 0))(
  ( (tuple2!10803 (_1!5698 BitStream!4610) (_2!5698 BitStream!4610)) )
))
(declare-fun lt!199061 () tuple2!10802)

(declare-fun b!128131 () Bool)

(assert (=> b!128131 (= e!84961 (and (= (_2!5697 lt!199060) (select (arr!3290 arr!237) from!447)) (= (_1!5697 lt!199060) (_2!5698 lt!199061))))))

(declare-fun readBytePure!0 (BitStream!4610) tuple2!10800)

(assert (=> b!128131 (= lt!199060 (readBytePure!0 (_1!5698 lt!199061)))))

(declare-fun reader!0 (BitStream!4610 BitStream!4610) tuple2!10802)

(assert (=> b!128131 (= lt!199061 (reader!0 thiss!1634 (_2!5696 lt!199059)))))

(declare-fun b!128132 () Bool)

(declare-fun res!106027 () Bool)

(assert (=> b!128132 (=> (not res!106027) (not e!84961))))

(declare-fun isPrefixOf!0 (BitStream!4610 BitStream!4610) Bool)

(assert (=> b!128132 (= res!106027 (isPrefixOf!0 thiss!1634 (_2!5696 lt!199059)))))

(declare-fun b!128133 () Bool)

(declare-fun res!106025 () Bool)

(assert (=> b!128133 (=> (not res!106025) (not e!84965))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128133 (= res!106025 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2673 (buf!3031 thiss!1634))) ((_ sign_extend 32) (currentByte!5783 thiss!1634)) ((_ sign_extend 32) (currentBit!5778 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!106028 () Bool)

(assert (=> start!25376 (=> (not res!106028) (not e!84965))))

(assert (=> start!25376 (= res!106028 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2673 arr!237))))))

(assert (=> start!25376 e!84965))

(assert (=> start!25376 true))

(declare-fun array_inv!2462 (array!5912) Bool)

(assert (=> start!25376 (array_inv!2462 arr!237)))

(declare-fun e!84964 () Bool)

(declare-fun inv!12 (BitStream!4610) Bool)

(assert (=> start!25376 (and (inv!12 thiss!1634) e!84964)))

(declare-fun b!128134 () Bool)

(declare-fun res!106026 () Bool)

(assert (=> b!128134 (=> (not res!106026) (not e!84965))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128134 (= res!106026 (invariant!0 (currentBit!5778 thiss!1634) (currentByte!5783 thiss!1634) (size!2673 (buf!3031 thiss!1634))))))

(declare-fun b!128135 () Bool)

(assert (=> b!128135 (= e!84964 (array_inv!2462 (buf!3031 thiss!1634)))))

(assert (= (and start!25376 res!106028) b!128133))

(assert (= (and b!128133 res!106025) b!128128))

(assert (= (and b!128128 res!106029) b!128134))

(assert (= (and b!128134 res!106026) b!128129))

(assert (= (and b!128129 res!106024) b!128130))

(assert (= (and b!128130 res!106030) b!128132))

(assert (= (and b!128132 res!106027) b!128131))

(assert (= start!25376 b!128135))

(declare-fun m!193891 () Bool)

(assert (=> b!128135 m!193891))

(declare-fun m!193893 () Bool)

(assert (=> b!128131 m!193893))

(declare-fun m!193895 () Bool)

(assert (=> b!128131 m!193895))

(declare-fun m!193897 () Bool)

(assert (=> b!128131 m!193897))

(declare-fun m!193899 () Bool)

(assert (=> b!128132 m!193899))

(assert (=> b!128129 m!193893))

(assert (=> b!128129 m!193893))

(declare-fun m!193901 () Bool)

(assert (=> b!128129 m!193901))

(declare-fun m!193903 () Bool)

(assert (=> b!128133 m!193903))

(declare-fun m!193905 () Bool)

(assert (=> start!25376 m!193905))

(declare-fun m!193907 () Bool)

(assert (=> start!25376 m!193907))

(declare-fun m!193909 () Bool)

(assert (=> b!128130 m!193909))

(declare-fun m!193911 () Bool)

(assert (=> b!128130 m!193911))

(declare-fun m!193913 () Bool)

(assert (=> b!128134 m!193913))

(push 1)

(assert (not b!128135))

(assert (not b!128134))

(assert (not start!25376))

(assert (not b!128131))

(assert (not b!128129))

(assert (not b!128133))

(assert (not b!128130))

(assert (not b!128132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

