; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25490 () Bool)

(assert start!25490)

(declare-fun b!129026 () Bool)

(declare-fun res!106816 () Bool)

(declare-fun e!85526 () Bool)

(assert (=> b!129026 (=> (not res!106816) (not e!85526))))

(declare-datatypes ((array!5975 0))(
  ( (array!5976 (arr!3320 (Array (_ BitVec 32) (_ BitVec 8))) (size!2703 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4670 0))(
  ( (BitStream!4671 (buf!3061 array!5975) (currentByte!5822 (_ BitVec 32)) (currentBit!5817 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4670)

(declare-datatypes ((Unit!8011 0))(
  ( (Unit!8012) )
))
(declare-datatypes ((tuple2!10984 0))(
  ( (tuple2!10985 (_1!5789 Unit!8011) (_2!5789 BitStream!4670)) )
))
(declare-fun lt!199697 () tuple2!10984)

(declare-fun isPrefixOf!0 (BitStream!4670 BitStream!4670) Bool)

(assert (=> b!129026 (= res!106816 (isPrefixOf!0 thiss!1634 (_2!5789 lt!199697)))))

(declare-fun b!129027 () Bool)

(declare-fun res!106815 () Bool)

(declare-fun e!85525 () Bool)

(assert (=> b!129027 (=> (not res!106815) (not e!85525))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!129027 (= res!106815 (bvslt from!447 to!404))))

(declare-fun b!129028 () Bool)

(declare-fun e!85522 () Bool)

(declare-fun array_inv!2492 (array!5975) Bool)

(assert (=> b!129028 (= e!85522 (array_inv!2492 (buf!3061 thiss!1634)))))

(declare-fun b!129029 () Bool)

(declare-fun res!106817 () Bool)

(assert (=> b!129029 (=> (not res!106817) (not e!85525))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129029 (= res!106817 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2703 (buf!3061 thiss!1634))) ((_ sign_extend 32) (currentByte!5822 thiss!1634)) ((_ sign_extend 32) (currentBit!5817 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129030 () Bool)

(declare-fun res!106814 () Bool)

(assert (=> b!129030 (=> (not res!106814) (not e!85526))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129030 (= res!106814 (= (bitIndex!0 (size!2703 (buf!3061 (_2!5789 lt!199697))) (currentByte!5822 (_2!5789 lt!199697)) (currentBit!5817 (_2!5789 lt!199697))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2703 (buf!3061 thiss!1634)) (currentByte!5822 thiss!1634) (currentBit!5817 thiss!1634)))))))

(declare-fun b!129031 () Bool)

(declare-fun res!106813 () Bool)

(assert (=> b!129031 (=> (not res!106813) (not e!85525))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129031 (= res!106813 (invariant!0 (currentBit!5817 thiss!1634) (currentByte!5822 thiss!1634) (size!2703 (buf!3061 thiss!1634))))))

(declare-fun b!129032 () Bool)

(declare-datatypes ((tuple2!10986 0))(
  ( (tuple2!10987 (_1!5790 BitStream!4670) (_2!5790 BitStream!4670)) )
))
(declare-fun lt!199699 () tuple2!10986)

(declare-datatypes ((tuple2!10988 0))(
  ( (tuple2!10989 (_1!5791 BitStream!4670) (_2!5791 (_ BitVec 8))) )
))
(declare-fun lt!199700 () tuple2!10988)

(declare-fun arr!237 () array!5975)

(assert (=> b!129032 (= e!85526 (and (= (_2!5791 lt!199700) (select (arr!3320 arr!237) from!447)) (= (_1!5791 lt!199700) (_2!5790 lt!199699))))))

(declare-fun readBytePure!0 (BitStream!4670) tuple2!10988)

(assert (=> b!129032 (= lt!199700 (readBytePure!0 (_1!5790 lt!199699)))))

(declare-fun reader!0 (BitStream!4670 BitStream!4670) tuple2!10986)

(assert (=> b!129032 (= lt!199699 (reader!0 thiss!1634 (_2!5789 lt!199697)))))

(declare-fun b!129025 () Bool)

(assert (=> b!129025 (= e!85525 (not true))))

(assert (=> b!129025 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2703 (buf!3061 (_2!5789 lt!199697)))) ((_ sign_extend 32) (currentByte!5822 (_2!5789 lt!199697))) ((_ sign_extend 32) (currentBit!5817 (_2!5789 lt!199697))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199698 () Unit!8011)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4670 BitStream!4670 (_ BitVec 64) (_ BitVec 32)) Unit!8011)

(assert (=> b!129025 (= lt!199698 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5789 lt!199697) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129025 e!85526))

(declare-fun res!106818 () Bool)

(assert (=> b!129025 (=> (not res!106818) (not e!85526))))

(assert (=> b!129025 (= res!106818 (= (size!2703 (buf!3061 thiss!1634)) (size!2703 (buf!3061 (_2!5789 lt!199697)))))))

(declare-fun appendByte!0 (BitStream!4670 (_ BitVec 8)) tuple2!10984)

(assert (=> b!129025 (= lt!199697 (appendByte!0 thiss!1634 (select (arr!3320 arr!237) from!447)))))

(declare-fun res!106819 () Bool)

(assert (=> start!25490 (=> (not res!106819) (not e!85525))))

(assert (=> start!25490 (= res!106819 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2703 arr!237))))))

(assert (=> start!25490 e!85525))

(assert (=> start!25490 true))

(assert (=> start!25490 (array_inv!2492 arr!237)))

(declare-fun inv!12 (BitStream!4670) Bool)

(assert (=> start!25490 (and (inv!12 thiss!1634) e!85522)))

(assert (= (and start!25490 res!106819) b!129029))

(assert (= (and b!129029 res!106817) b!129027))

(assert (= (and b!129027 res!106815) b!129031))

(assert (= (and b!129031 res!106813) b!129025))

(assert (= (and b!129025 res!106818) b!129030))

(assert (= (and b!129030 res!106814) b!129026))

(assert (= (and b!129026 res!106816) b!129032))

(assert (= start!25490 b!129028))

(declare-fun m!194793 () Bool)

(assert (=> b!129026 m!194793))

(declare-fun m!194795 () Bool)

(assert (=> b!129025 m!194795))

(declare-fun m!194797 () Bool)

(assert (=> b!129025 m!194797))

(declare-fun m!194799 () Bool)

(assert (=> b!129025 m!194799))

(assert (=> b!129025 m!194799))

(declare-fun m!194801 () Bool)

(assert (=> b!129025 m!194801))

(declare-fun m!194803 () Bool)

(assert (=> start!25490 m!194803))

(declare-fun m!194805 () Bool)

(assert (=> start!25490 m!194805))

(declare-fun m!194807 () Bool)

(assert (=> b!129028 m!194807))

(declare-fun m!194809 () Bool)

(assert (=> b!129029 m!194809))

(assert (=> b!129032 m!194799))

(declare-fun m!194811 () Bool)

(assert (=> b!129032 m!194811))

(declare-fun m!194813 () Bool)

(assert (=> b!129032 m!194813))

(declare-fun m!194815 () Bool)

(assert (=> b!129031 m!194815))

(declare-fun m!194817 () Bool)

(assert (=> b!129030 m!194817))

(declare-fun m!194819 () Bool)

(assert (=> b!129030 m!194819))

(push 1)

