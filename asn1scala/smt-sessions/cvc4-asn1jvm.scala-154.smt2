; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3650 () Bool)

(assert start!3650)

(declare-fun res!14720 () Bool)

(declare-fun e!9894 () Bool)

(assert (=> start!3650 (=> (not res!14720) (not e!9894))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3650 (= res!14720 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3650 e!9894))

(assert (=> start!3650 true))

(declare-datatypes ((array!955 0))(
  ( (array!956 (arr!834 (Array (_ BitVec 32) (_ BitVec 8))) (size!405 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!770 0))(
  ( (BitStream!771 (buf!768 array!955) (currentByte!1937 (_ BitVec 32)) (currentBit!1932 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!770)

(declare-fun e!9891 () Bool)

(declare-fun inv!12 (BitStream!770) Bool)

(assert (=> start!3650 (and (inv!12 thiss!1073) e!9891)))

(declare-fun b!15849 () Bool)

(declare-fun res!14717 () Bool)

(declare-fun e!9893 () Bool)

(assert (=> b!15849 (=> (not res!14717) (not e!9893))))

(declare-datatypes ((Unit!1303 0))(
  ( (Unit!1304) )
))
(declare-datatypes ((tuple2!1914 0))(
  ( (tuple2!1915 (_1!1018 Unit!1303) (_2!1018 BitStream!770)) )
))
(declare-fun lt!24219 () tuple2!1914)

(declare-fun isPrefixOf!0 (BitStream!770 BitStream!770) Bool)

(assert (=> b!15849 (= res!14717 (isPrefixOf!0 thiss!1073 (_2!1018 lt!24219)))))

(declare-fun b!15850 () Bool)

(declare-datatypes ((tuple2!1916 0))(
  ( (tuple2!1917 (_1!1019 BitStream!770) (_2!1019 Bool)) )
))
(declare-fun lt!24215 () tuple2!1916)

(declare-datatypes ((tuple2!1918 0))(
  ( (tuple2!1919 (_1!1020 BitStream!770) (_2!1020 BitStream!770)) )
))
(declare-fun lt!24218 () tuple2!1918)

(assert (=> b!15850 (= e!9893 (not (or (not (_2!1019 lt!24215)) (not (= (_1!1019 lt!24215) (_2!1020 lt!24218))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!770 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1916)

(assert (=> b!15850 (= lt!24215 (checkBitsLoopPure!0 (_1!1020 lt!24218) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15850 (validate_offset_bits!1 ((_ sign_extend 32) (size!405 (buf!768 (_2!1018 lt!24219)))) ((_ sign_extend 32) (currentByte!1937 thiss!1073)) ((_ sign_extend 32) (currentBit!1932 thiss!1073)) nBits!313)))

(declare-fun lt!24217 () Unit!1303)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!770 array!955 (_ BitVec 64)) Unit!1303)

(assert (=> b!15850 (= lt!24217 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!768 (_2!1018 lt!24219)) nBits!313))))

(declare-fun reader!0 (BitStream!770 BitStream!770) tuple2!1918)

(assert (=> b!15850 (= lt!24218 (reader!0 thiss!1073 (_2!1018 lt!24219)))))

(declare-fun b!15851 () Bool)

(assert (=> b!15851 (= e!9894 (not true))))

(declare-fun lt!24213 () tuple2!1918)

(assert (=> b!15851 (= lt!24213 (reader!0 thiss!1073 (_2!1018 lt!24219)))))

(declare-fun lt!24216 () Bool)

(assert (=> b!15851 (= lt!24216 (isPrefixOf!0 thiss!1073 (_2!1018 lt!24219)))))

(declare-fun lt!24214 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15851 (= lt!24214 (bitIndex!0 (size!405 (buf!768 (_2!1018 lt!24219))) (currentByte!1937 (_2!1018 lt!24219)) (currentBit!1932 (_2!1018 lt!24219))))))

(declare-fun lt!24220 () (_ BitVec 64))

(assert (=> b!15851 (= lt!24220 (bitIndex!0 (size!405 (buf!768 thiss!1073)) (currentByte!1937 thiss!1073) (currentBit!1932 thiss!1073)))))

(assert (=> b!15851 e!9893))

(declare-fun res!14719 () Bool)

(assert (=> b!15851 (=> (not res!14719) (not e!9893))))

(assert (=> b!15851 (= res!14719 (= (size!405 (buf!768 thiss!1073)) (size!405 (buf!768 (_2!1018 lt!24219)))))))

(declare-fun appendNBits!0 (BitStream!770 (_ BitVec 64) Bool) tuple2!1914)

(assert (=> b!15851 (= lt!24219 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15852 () Bool)

(declare-fun res!14718 () Bool)

(assert (=> b!15852 (=> (not res!14718) (not e!9894))))

(assert (=> b!15852 (= res!14718 (validate_offset_bits!1 ((_ sign_extend 32) (size!405 (buf!768 thiss!1073))) ((_ sign_extend 32) (currentByte!1937 thiss!1073)) ((_ sign_extend 32) (currentBit!1932 thiss!1073)) nBits!313))))

(declare-fun b!15853 () Bool)

(declare-fun res!14716 () Bool)

(assert (=> b!15853 (=> (not res!14716) (not e!9893))))

(assert (=> b!15853 (= res!14716 (= (bitIndex!0 (size!405 (buf!768 (_2!1018 lt!24219))) (currentByte!1937 (_2!1018 lt!24219)) (currentBit!1932 (_2!1018 lt!24219))) (bvadd (bitIndex!0 (size!405 (buf!768 thiss!1073)) (currentByte!1937 thiss!1073) (currentBit!1932 thiss!1073)) nBits!313)))))

(declare-fun b!15854 () Bool)

(declare-fun array_inv!394 (array!955) Bool)

(assert (=> b!15854 (= e!9891 (array_inv!394 (buf!768 thiss!1073)))))

(assert (= (and start!3650 res!14720) b!15852))

(assert (= (and b!15852 res!14718) b!15851))

(assert (= (and b!15851 res!14719) b!15853))

(assert (= (and b!15853 res!14716) b!15849))

(assert (= (and b!15849 res!14717) b!15850))

(assert (= start!3650 b!15854))

(declare-fun m!22601 () Bool)

(assert (=> b!15849 m!22601))

(declare-fun m!22603 () Bool)

(assert (=> b!15850 m!22603))

(declare-fun m!22605 () Bool)

(assert (=> b!15850 m!22605))

(declare-fun m!22607 () Bool)

(assert (=> b!15850 m!22607))

(declare-fun m!22609 () Bool)

(assert (=> b!15850 m!22609))

(declare-fun m!22611 () Bool)

(assert (=> b!15852 m!22611))

(declare-fun m!22613 () Bool)

(assert (=> start!3650 m!22613))

(declare-fun m!22615 () Bool)

(assert (=> b!15853 m!22615))

(declare-fun m!22617 () Bool)

(assert (=> b!15853 m!22617))

(assert (=> b!15851 m!22617))

(assert (=> b!15851 m!22601))

(declare-fun m!22619 () Bool)

(assert (=> b!15851 m!22619))

(assert (=> b!15851 m!22615))

(assert (=> b!15851 m!22609))

(declare-fun m!22621 () Bool)

(assert (=> b!15854 m!22621))

(push 1)

(assert (not b!15852))

(assert (not b!15853))

(assert (not b!15854))

(assert (not b!15850))

(assert (not b!15849))

(assert (not start!3650))

(assert (not b!15851))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

