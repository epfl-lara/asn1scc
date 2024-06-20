; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3488 () Bool)

(assert start!3488)

(declare-fun b!15099 () Bool)

(declare-fun res!14085 () Bool)

(declare-fun e!9437 () Bool)

(assert (=> b!15099 (=> (not res!14085) (not e!9437))))

(declare-datatypes ((array!895 0))(
  ( (array!896 (arr!807 (Array (_ BitVec 32) (_ BitVec 8))) (size!378 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!716 0))(
  ( (BitStream!717 (buf!735 array!895) (currentByte!1898 (_ BitVec 32)) (currentBit!1893 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!716)

(declare-datatypes ((Unit!1244 0))(
  ( (Unit!1245) )
))
(declare-datatypes ((tuple2!1742 0))(
  ( (tuple2!1743 (_1!932 Unit!1244) (_2!932 BitStream!716)) )
))
(declare-fun lt!22913 () tuple2!1742)

(declare-fun isPrefixOf!0 (BitStream!716 BitStream!716) Bool)

(assert (=> b!15099 (= res!14085 (isPrefixOf!0 thiss!1073 (_2!932 lt!22913)))))

(declare-fun b!15100 () Bool)

(declare-datatypes ((tuple2!1744 0))(
  ( (tuple2!1745 (_1!933 BitStream!716) (_2!933 Bool)) )
))
(declare-fun lt!22915 () tuple2!1744)

(declare-datatypes ((tuple2!1746 0))(
  ( (tuple2!1747 (_1!934 BitStream!716) (_2!934 BitStream!716)) )
))
(declare-fun lt!22909 () tuple2!1746)

(assert (=> b!15100 (= e!9437 (not (or (not (_2!933 lt!22915)) (not (= (_1!933 lt!22915) (_2!934 lt!22909))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!716 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1744)

(assert (=> b!15100 (= lt!22915 (checkBitsLoopPure!0 (_1!934 lt!22909) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15100 (validate_offset_bits!1 ((_ sign_extend 32) (size!378 (buf!735 (_2!932 lt!22913)))) ((_ sign_extend 32) (currentByte!1898 thiss!1073)) ((_ sign_extend 32) (currentBit!1893 thiss!1073)) nBits!313)))

(declare-fun lt!22911 () Unit!1244)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!716 array!895 (_ BitVec 64)) Unit!1244)

(assert (=> b!15100 (= lt!22911 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!735 (_2!932 lt!22913)) nBits!313))))

(declare-fun reader!0 (BitStream!716 BitStream!716) tuple2!1746)

(assert (=> b!15100 (= lt!22909 (reader!0 thiss!1073 (_2!932 lt!22913)))))

(declare-fun b!15101 () Bool)

(declare-fun e!9436 () Bool)

(declare-fun array_inv!367 (array!895) Bool)

(assert (=> b!15101 (= e!9436 (array_inv!367 (buf!735 thiss!1073)))))

(declare-fun b!15102 () Bool)

(declare-fun e!9438 () Bool)

(assert (=> b!15102 (= e!9438 (not true))))

(declare-fun lt!22914 () Bool)

(assert (=> b!15102 (= lt!22914 (isPrefixOf!0 thiss!1073 (_2!932 lt!22913)))))

(declare-fun lt!22912 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15102 (= lt!22912 (bitIndex!0 (size!378 (buf!735 (_2!932 lt!22913))) (currentByte!1898 (_2!932 lt!22913)) (currentBit!1893 (_2!932 lt!22913))))))

(declare-fun lt!22910 () (_ BitVec 64))

(assert (=> b!15102 (= lt!22910 (bitIndex!0 (size!378 (buf!735 thiss!1073)) (currentByte!1898 thiss!1073) (currentBit!1893 thiss!1073)))))

(assert (=> b!15102 e!9437))

(declare-fun res!14084 () Bool)

(assert (=> b!15102 (=> (not res!14084) (not e!9437))))

(assert (=> b!15102 (= res!14084 (= (size!378 (buf!735 thiss!1073)) (size!378 (buf!735 (_2!932 lt!22913)))))))

(declare-fun appendNBits!0 (BitStream!716 (_ BitVec 64) Bool) tuple2!1742)

(assert (=> b!15102 (= lt!22913 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15103 () Bool)

(declare-fun res!14086 () Bool)

(assert (=> b!15103 (=> (not res!14086) (not e!9437))))

(assert (=> b!15103 (= res!14086 (= (bitIndex!0 (size!378 (buf!735 (_2!932 lt!22913))) (currentByte!1898 (_2!932 lt!22913)) (currentBit!1893 (_2!932 lt!22913))) (bvadd (bitIndex!0 (size!378 (buf!735 thiss!1073)) (currentByte!1898 thiss!1073) (currentBit!1893 thiss!1073)) nBits!313)))))

(declare-fun res!14087 () Bool)

(assert (=> start!3488 (=> (not res!14087) (not e!9438))))

(assert (=> start!3488 (= res!14087 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3488 e!9438))

(assert (=> start!3488 true))

(declare-fun inv!12 (BitStream!716) Bool)

(assert (=> start!3488 (and (inv!12 thiss!1073) e!9436)))

(declare-fun b!15104 () Bool)

(declare-fun res!14083 () Bool)

(assert (=> b!15104 (=> (not res!14083) (not e!9438))))

(assert (=> b!15104 (= res!14083 (validate_offset_bits!1 ((_ sign_extend 32) (size!378 (buf!735 thiss!1073))) ((_ sign_extend 32) (currentByte!1898 thiss!1073)) ((_ sign_extend 32) (currentBit!1893 thiss!1073)) nBits!313))))

(assert (= (and start!3488 res!14087) b!15104))

(assert (= (and b!15104 res!14083) b!15102))

(assert (= (and b!15102 res!14084) b!15103))

(assert (= (and b!15103 res!14086) b!15099))

(assert (= (and b!15099 res!14085) b!15100))

(assert (= start!3488 b!15101))

(declare-fun m!21665 () Bool)

(assert (=> b!15102 m!21665))

(declare-fun m!21667 () Bool)

(assert (=> b!15102 m!21667))

(declare-fun m!21669 () Bool)

(assert (=> b!15102 m!21669))

(declare-fun m!21671 () Bool)

(assert (=> b!15102 m!21671))

(declare-fun m!21673 () Bool)

(assert (=> start!3488 m!21673))

(declare-fun m!21675 () Bool)

(assert (=> b!15104 m!21675))

(assert (=> b!15103 m!21667))

(assert (=> b!15103 m!21669))

(declare-fun m!21677 () Bool)

(assert (=> b!15101 m!21677))

(assert (=> b!15099 m!21665))

(declare-fun m!21679 () Bool)

(assert (=> b!15100 m!21679))

(declare-fun m!21681 () Bool)

(assert (=> b!15100 m!21681))

(declare-fun m!21683 () Bool)

(assert (=> b!15100 m!21683))

(declare-fun m!21685 () Bool)

(assert (=> b!15100 m!21685))

(push 1)

(assert (not b!15100))

(assert (not start!3488))

(assert (not b!15102))

(assert (not b!15101))

(assert (not b!15104))

(assert (not b!15099))

(assert (not b!15103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

