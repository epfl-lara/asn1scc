; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39948 () Bool)

(assert start!39948)

(declare-fun b!181712 () Bool)

(declare-fun res!150951 () Bool)

(declare-fun e!126161 () Bool)

(assert (=> b!181712 (=> (not res!150951) (not e!126161))))

(declare-datatypes ((array!9708 0))(
  ( (array!9709 (arr!5211 (Array (_ BitVec 32) (_ BitVec 8))) (size!4281 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7670 0))(
  ( (BitStream!7671 (buf!4730 array!9708) (currentByte!8952 (_ BitVec 32)) (currentBit!8947 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7670)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181712 (= res!150951 (invariant!0 (currentBit!8947 thiss!1204) (currentByte!8952 thiss!1204) (size!4281 (buf!4730 thiss!1204))))))

(declare-fun b!181713 () Bool)

(declare-fun e!126155 () Bool)

(declare-fun e!126162 () Bool)

(assert (=> b!181713 (= e!126155 e!126162)))

(declare-fun res!150950 () Bool)

(assert (=> b!181713 (=> (not res!150950) (not e!126162))))

(declare-datatypes ((tuple2!15660 0))(
  ( (tuple2!15661 (_1!8475 BitStream!7670) (_2!8475 Bool)) )
))
(declare-fun lt!279148 () tuple2!15660)

(declare-fun lt!279150 () Bool)

(declare-datatypes ((Unit!13059 0))(
  ( (Unit!13060) )
))
(declare-datatypes ((tuple2!15662 0))(
  ( (tuple2!15663 (_1!8476 Unit!13059) (_2!8476 BitStream!7670)) )
))
(declare-fun lt!279145 () tuple2!15662)

(assert (=> b!181713 (= res!150950 (and (= (_2!8475 lt!279148) lt!279150) (= (_1!8475 lt!279148) (_2!8476 lt!279145))))))

(declare-fun readBitPure!0 (BitStream!7670) tuple2!15660)

(declare-fun readerFrom!0 (BitStream!7670 (_ BitVec 32) (_ BitVec 32)) BitStream!7670)

(assert (=> b!181713 (= lt!279148 (readBitPure!0 (readerFrom!0 (_2!8476 lt!279145) (currentBit!8947 thiss!1204) (currentByte!8952 thiss!1204))))))

(declare-fun b!181714 () Bool)

(declare-fun res!150946 () Bool)

(declare-fun e!126160 () Bool)

(assert (=> b!181714 (=> res!150946 e!126160)))

(declare-fun lt!279155 () tuple2!15662)

(declare-fun isPrefixOf!0 (BitStream!7670 BitStream!7670) Bool)

(assert (=> b!181714 (= res!150946 (not (isPrefixOf!0 (_2!8476 lt!279145) (_2!8476 lt!279155))))))

(declare-fun b!181715 () Bool)

(declare-fun e!126153 () Bool)

(assert (=> b!181715 (= e!126153 (invariant!0 (currentBit!8947 thiss!1204) (currentByte!8952 thiss!1204) (size!4281 (buf!4730 (_2!8476 lt!279155)))))))

(declare-fun b!181716 () Bool)

(declare-fun res!150952 () Bool)

(assert (=> b!181716 (=> res!150952 e!126160)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!279154 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!279151 () (_ BitVec 64))

(assert (=> b!181716 (= res!150952 (or (not (= (size!4281 (buf!4730 (_2!8476 lt!279155))) (size!4281 (buf!4730 thiss!1204)))) (not (= lt!279151 (bvsub (bvadd lt!279154 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181718 () Bool)

(declare-fun e!126158 () Bool)

(declare-fun lt!279138 () tuple2!15660)

(declare-fun lt!279140 () tuple2!15660)

(assert (=> b!181718 (= e!126158 (= (_2!8475 lt!279138) (_2!8475 lt!279140)))))

(declare-fun b!181719 () Bool)

(declare-fun res!150953 () Bool)

(assert (=> b!181719 (=> (not res!150953) (not e!126155))))

(assert (=> b!181719 (= res!150953 (isPrefixOf!0 thiss!1204 (_2!8476 lt!279145)))))

(declare-fun b!181720 () Bool)

(declare-fun lt!279152 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181720 (= e!126162 (= (bitIndex!0 (size!4281 (buf!4730 (_1!8475 lt!279148))) (currentByte!8952 (_1!8475 lt!279148)) (currentBit!8947 (_1!8475 lt!279148))) lt!279152))))

(declare-fun b!181721 () Bool)

(declare-fun e!126157 () Bool)

(assert (=> b!181721 (= e!126157 e!126161)))

(declare-fun res!150958 () Bool)

(assert (=> b!181721 (=> (not res!150958) (not e!126161))))

(declare-fun lt!279146 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181721 (= res!150958 (validate_offset_bits!1 ((_ sign_extend 32) (size!4281 (buf!4730 thiss!1204))) ((_ sign_extend 32) (currentByte!8952 thiss!1204)) ((_ sign_extend 32) (currentBit!8947 thiss!1204)) lt!279146))))

(assert (=> b!181721 (= lt!279146 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!181722 () Bool)

(declare-fun res!150954 () Bool)

(assert (=> b!181722 (=> res!150954 e!126160)))

(assert (=> b!181722 (= res!150954 (not (isPrefixOf!0 thiss!1204 (_2!8476 lt!279145))))))

(declare-fun b!181723 () Bool)

(declare-fun e!126159 () Bool)

(assert (=> b!181723 (= e!126159 e!126160)))

(declare-fun res!150956 () Bool)

(assert (=> b!181723 (=> res!150956 e!126160)))

(declare-fun lt!279143 () (_ BitVec 64))

(assert (=> b!181723 (= res!150956 (not (= lt!279151 (bvsub (bvsub (bvadd lt!279143 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!181723 (= lt!279151 (bitIndex!0 (size!4281 (buf!4730 (_2!8476 lt!279155))) (currentByte!8952 (_2!8476 lt!279155)) (currentBit!8947 (_2!8476 lt!279155))))))

(assert (=> b!181723 (isPrefixOf!0 thiss!1204 (_2!8476 lt!279155))))

(declare-fun lt!279142 () Unit!13059)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7670 BitStream!7670 BitStream!7670) Unit!13059)

(assert (=> b!181723 (= lt!279142 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8476 lt!279145) (_2!8476 lt!279155)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15662)

(assert (=> b!181723 (= lt!279155 (appendBitsLSBFirstLoopTR!0 (_2!8476 lt!279145) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181717 () Bool)

(assert (=> b!181717 (= e!126160 true)))

(declare-datatypes ((tuple2!15664 0))(
  ( (tuple2!15665 (_1!8477 BitStream!7670) (_2!8477 BitStream!7670)) )
))
(declare-fun lt!279137 () tuple2!15664)

(declare-datatypes ((tuple2!15666 0))(
  ( (tuple2!15667 (_1!8478 BitStream!7670) (_2!8478 (_ BitVec 64))) )
))
(declare-fun lt!279141 () tuple2!15666)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15666)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181717 (= lt!279141 (readNBitsLSBFirstsLoopPure!0 (_1!8477 lt!279137) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!181717 (validate_offset_bits!1 ((_ sign_extend 32) (size!4281 (buf!4730 (_2!8476 lt!279155)))) ((_ sign_extend 32) (currentByte!8952 thiss!1204)) ((_ sign_extend 32) (currentBit!8947 thiss!1204)) lt!279146)))

(declare-fun lt!279144 () Unit!13059)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7670 array!9708 (_ BitVec 64)) Unit!13059)

(assert (=> b!181717 (= lt!279144 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4730 (_2!8476 lt!279155)) lt!279146))))

(assert (=> b!181717 (= (_2!8475 (readBitPure!0 (_1!8477 lt!279137))) lt!279150)))

(declare-fun lt!279139 () tuple2!15664)

(declare-fun reader!0 (BitStream!7670 BitStream!7670) tuple2!15664)

(assert (=> b!181717 (= lt!279139 (reader!0 (_2!8476 lt!279145) (_2!8476 lt!279155)))))

(assert (=> b!181717 (= lt!279137 (reader!0 thiss!1204 (_2!8476 lt!279155)))))

(assert (=> b!181717 e!126158))

(declare-fun res!150955 () Bool)

(assert (=> b!181717 (=> (not res!150955) (not e!126158))))

(assert (=> b!181717 (= res!150955 (= (bitIndex!0 (size!4281 (buf!4730 (_1!8475 lt!279138))) (currentByte!8952 (_1!8475 lt!279138)) (currentBit!8947 (_1!8475 lt!279138))) (bitIndex!0 (size!4281 (buf!4730 (_1!8475 lt!279140))) (currentByte!8952 (_1!8475 lt!279140)) (currentBit!8947 (_1!8475 lt!279140)))))))

(declare-fun lt!279153 () Unit!13059)

(declare-fun lt!279149 () BitStream!7670)

(declare-fun readBitPrefixLemma!0 (BitStream!7670 BitStream!7670) Unit!13059)

(assert (=> b!181717 (= lt!279153 (readBitPrefixLemma!0 lt!279149 (_2!8476 lt!279155)))))

(assert (=> b!181717 (= lt!279140 (readBitPure!0 (BitStream!7671 (buf!4730 (_2!8476 lt!279155)) (currentByte!8952 thiss!1204) (currentBit!8947 thiss!1204))))))

(assert (=> b!181717 (= lt!279138 (readBitPure!0 lt!279149))))

(assert (=> b!181717 e!126153))

(declare-fun res!150960 () Bool)

(assert (=> b!181717 (=> (not res!150960) (not e!126153))))

(assert (=> b!181717 (= res!150960 (invariant!0 (currentBit!8947 thiss!1204) (currentByte!8952 thiss!1204) (size!4281 (buf!4730 (_2!8476 lt!279145)))))))

(assert (=> b!181717 (= lt!279149 (BitStream!7671 (buf!4730 (_2!8476 lt!279145)) (currentByte!8952 thiss!1204) (currentBit!8947 thiss!1204)))))

(declare-fun res!150949 () Bool)

(assert (=> start!39948 (=> (not res!150949) (not e!126157))))

(assert (=> start!39948 (= res!150949 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39948 e!126157))

(assert (=> start!39948 true))

(declare-fun e!126154 () Bool)

(declare-fun inv!12 (BitStream!7670) Bool)

(assert (=> start!39948 (and (inv!12 thiss!1204) e!126154)))

(declare-fun b!181724 () Bool)

(declare-fun e!126163 () Bool)

(assert (=> b!181724 (= e!126163 e!126155)))

(declare-fun res!150957 () Bool)

(assert (=> b!181724 (=> (not res!150957) (not e!126155))))

(declare-fun lt!279147 () (_ BitVec 64))

(assert (=> b!181724 (= res!150957 (= lt!279152 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279147)))))

(assert (=> b!181724 (= lt!279152 (bitIndex!0 (size!4281 (buf!4730 (_2!8476 lt!279145))) (currentByte!8952 (_2!8476 lt!279145)) (currentBit!8947 (_2!8476 lt!279145))))))

(assert (=> b!181724 (= lt!279147 (bitIndex!0 (size!4281 (buf!4730 thiss!1204)) (currentByte!8952 thiss!1204) (currentBit!8947 thiss!1204)))))

(declare-fun b!181725 () Bool)

(declare-fun res!150947 () Bool)

(assert (=> b!181725 (=> res!150947 e!126160)))

(assert (=> b!181725 (= res!150947 (not (invariant!0 (currentBit!8947 (_2!8476 lt!279155)) (currentByte!8952 (_2!8476 lt!279155)) (size!4281 (buf!4730 (_2!8476 lt!279155))))))))

(declare-fun b!181726 () Bool)

(declare-fun array_inv!4022 (array!9708) Bool)

(assert (=> b!181726 (= e!126154 (array_inv!4022 (buf!4730 thiss!1204)))))

(declare-fun b!181727 () Bool)

(declare-fun res!150948 () Bool)

(assert (=> b!181727 (=> (not res!150948) (not e!126161))))

(assert (=> b!181727 (= res!150948 (not (= i!590 nBits!348)))))

(declare-fun b!181728 () Bool)

(assert (=> b!181728 (= e!126161 (not e!126159))))

(declare-fun res!150959 () Bool)

(assert (=> b!181728 (=> res!150959 e!126159)))

(assert (=> b!181728 (= res!150959 (not (= lt!279143 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279154))))))

(assert (=> b!181728 (= lt!279143 (bitIndex!0 (size!4281 (buf!4730 (_2!8476 lt!279145))) (currentByte!8952 (_2!8476 lt!279145)) (currentBit!8947 (_2!8476 lt!279145))))))

(assert (=> b!181728 (= lt!279154 (bitIndex!0 (size!4281 (buf!4730 thiss!1204)) (currentByte!8952 thiss!1204) (currentBit!8947 thiss!1204)))))

(assert (=> b!181728 e!126163))

(declare-fun res!150945 () Bool)

(assert (=> b!181728 (=> (not res!150945) (not e!126163))))

(assert (=> b!181728 (= res!150945 (= (size!4281 (buf!4730 thiss!1204)) (size!4281 (buf!4730 (_2!8476 lt!279145)))))))

(declare-fun appendBit!0 (BitStream!7670 Bool) tuple2!15662)

(assert (=> b!181728 (= lt!279145 (appendBit!0 thiss!1204 lt!279150))))

(assert (=> b!181728 (= lt!279150 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39948 res!150949) b!181721))

(assert (= (and b!181721 res!150958) b!181712))

(assert (= (and b!181712 res!150951) b!181727))

(assert (= (and b!181727 res!150948) b!181728))

(assert (= (and b!181728 res!150945) b!181724))

(assert (= (and b!181724 res!150957) b!181719))

(assert (= (and b!181719 res!150953) b!181713))

(assert (= (and b!181713 res!150950) b!181720))

(assert (= (and b!181728 (not res!150959)) b!181723))

(assert (= (and b!181723 (not res!150956)) b!181725))

(assert (= (and b!181725 (not res!150947)) b!181716))

(assert (= (and b!181716 (not res!150952)) b!181714))

(assert (= (and b!181714 (not res!150946)) b!181722))

(assert (= (and b!181722 (not res!150954)) b!181717))

(assert (= (and b!181717 res!150960) b!181715))

(assert (= (and b!181717 res!150955) b!181718))

(assert (= start!39948 b!181726))

(declare-fun m!282797 () Bool)

(assert (=> b!181728 m!282797))

(declare-fun m!282799 () Bool)

(assert (=> b!181728 m!282799))

(declare-fun m!282801 () Bool)

(assert (=> b!181728 m!282801))

(declare-fun m!282803 () Bool)

(assert (=> b!181723 m!282803))

(declare-fun m!282805 () Bool)

(assert (=> b!181723 m!282805))

(declare-fun m!282807 () Bool)

(assert (=> b!181723 m!282807))

(declare-fun m!282809 () Bool)

(assert (=> b!181723 m!282809))

(declare-fun m!282811 () Bool)

(assert (=> b!181720 m!282811))

(declare-fun m!282813 () Bool)

(assert (=> b!181715 m!282813))

(declare-fun m!282815 () Bool)

(assert (=> b!181725 m!282815))

(declare-fun m!282817 () Bool)

(assert (=> b!181713 m!282817))

(assert (=> b!181713 m!282817))

(declare-fun m!282819 () Bool)

(assert (=> b!181713 m!282819))

(assert (=> b!181724 m!282797))

(assert (=> b!181724 m!282799))

(declare-fun m!282821 () Bool)

(assert (=> start!39948 m!282821))

(declare-fun m!282823 () Bool)

(assert (=> b!181721 m!282823))

(declare-fun m!282825 () Bool)

(assert (=> b!181714 m!282825))

(declare-fun m!282827 () Bool)

(assert (=> b!181722 m!282827))

(declare-fun m!282829 () Bool)

(assert (=> b!181726 m!282829))

(assert (=> b!181719 m!282827))

(declare-fun m!282831 () Bool)

(assert (=> b!181712 m!282831))

(declare-fun m!282833 () Bool)

(assert (=> b!181717 m!282833))

(declare-fun m!282835 () Bool)

(assert (=> b!181717 m!282835))

(declare-fun m!282837 () Bool)

(assert (=> b!181717 m!282837))

(declare-fun m!282839 () Bool)

(assert (=> b!181717 m!282839))

(declare-fun m!282841 () Bool)

(assert (=> b!181717 m!282841))

(declare-fun m!282843 () Bool)

(assert (=> b!181717 m!282843))

(declare-fun m!282845 () Bool)

(assert (=> b!181717 m!282845))

(declare-fun m!282847 () Bool)

(assert (=> b!181717 m!282847))

(declare-fun m!282849 () Bool)

(assert (=> b!181717 m!282849))

(declare-fun m!282851 () Bool)

(assert (=> b!181717 m!282851))

(declare-fun m!282853 () Bool)

(assert (=> b!181717 m!282853))

(declare-fun m!282855 () Bool)

(assert (=> b!181717 m!282855))

(declare-fun m!282857 () Bool)

(assert (=> b!181717 m!282857))

(push 1)

(assert (not b!181714))

(assert (not b!181724))

(assert (not b!181723))

(assert (not b!181725))

(assert (not b!181717))

(assert (not b!181719))

(assert (not b!181721))

(assert (not b!181728))

(assert (not b!181715))

(assert (not b!181726))

(assert (not b!181712))

(assert (not b!181720))

(assert (not start!39948))

(assert (not b!181713))

(assert (not b!181722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

