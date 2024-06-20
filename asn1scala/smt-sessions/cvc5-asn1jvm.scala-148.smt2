; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3502 () Bool)

(assert start!3502)

(declare-fun b!15225 () Bool)

(declare-fun e!9519 () Bool)

(assert (=> b!15225 (= e!9519 (not true))))

(declare-datatypes ((array!909 0))(
  ( (array!910 (arr!814 (Array (_ BitVec 32) (_ BitVec 8))) (size!385 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!730 0))(
  ( (BitStream!731 (buf!742 array!909) (currentByte!1905 (_ BitVec 32)) (currentBit!1900 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1784 0))(
  ( (tuple2!1785 (_1!953 BitStream!730) (_2!953 BitStream!730)) )
))
(declare-fun lt!23080 () tuple2!1784)

(declare-fun thiss!1073 () BitStream!730)

(declare-datatypes ((Unit!1258 0))(
  ( (Unit!1259) )
))
(declare-datatypes ((tuple2!1786 0))(
  ( (tuple2!1787 (_1!954 Unit!1258) (_2!954 BitStream!730)) )
))
(declare-fun lt!23081 () tuple2!1786)

(declare-fun reader!0 (BitStream!730 BitStream!730) tuple2!1784)

(assert (=> b!15225 (= lt!23080 (reader!0 thiss!1073 (_2!954 lt!23081)))))

(declare-fun lt!23082 () Bool)

(declare-fun isPrefixOf!0 (BitStream!730 BitStream!730) Bool)

(assert (=> b!15225 (= lt!23082 (isPrefixOf!0 thiss!1073 (_2!954 lt!23081)))))

(declare-fun lt!23083 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15225 (= lt!23083 (bitIndex!0 (size!385 (buf!742 (_2!954 lt!23081))) (currentByte!1905 (_2!954 lt!23081)) (currentBit!1900 (_2!954 lt!23081))))))

(declare-fun lt!23076 () (_ BitVec 64))

(assert (=> b!15225 (= lt!23076 (bitIndex!0 (size!385 (buf!742 thiss!1073)) (currentByte!1905 thiss!1073) (currentBit!1900 thiss!1073)))))

(declare-fun e!9520 () Bool)

(assert (=> b!15225 e!9520))

(declare-fun res!14190 () Bool)

(assert (=> b!15225 (=> (not res!14190) (not e!9520))))

(assert (=> b!15225 (= res!14190 (= (size!385 (buf!742 thiss!1073)) (size!385 (buf!742 (_2!954 lt!23081)))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun appendNBits!0 (BitStream!730 (_ BitVec 64) Bool) tuple2!1786)

(assert (=> b!15225 (= lt!23081 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15226 () Bool)

(declare-fun e!9521 () Bool)

(declare-fun array_inv!374 (array!909) Bool)

(assert (=> b!15226 (= e!9521 (array_inv!374 (buf!742 thiss!1073)))))

(declare-fun b!15227 () Bool)

(declare-datatypes ((tuple2!1788 0))(
  ( (tuple2!1789 (_1!955 BitStream!730) (_2!955 Bool)) )
))
(declare-fun lt!23079 () tuple2!1788)

(declare-fun lt!23078 () tuple2!1784)

(assert (=> b!15227 (= e!9520 (not (or (not (_2!955 lt!23079)) (not (= (_1!955 lt!23079) (_2!953 lt!23078))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!730 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1788)

(assert (=> b!15227 (= lt!23079 (checkBitsLoopPure!0 (_1!953 lt!23078) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15227 (validate_offset_bits!1 ((_ sign_extend 32) (size!385 (buf!742 (_2!954 lt!23081)))) ((_ sign_extend 32) (currentByte!1905 thiss!1073)) ((_ sign_extend 32) (currentBit!1900 thiss!1073)) nBits!313)))

(declare-fun lt!23077 () Unit!1258)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!730 array!909 (_ BitVec 64)) Unit!1258)

(assert (=> b!15227 (= lt!23077 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!742 (_2!954 lt!23081)) nBits!313))))

(assert (=> b!15227 (= lt!23078 (reader!0 thiss!1073 (_2!954 lt!23081)))))

(declare-fun res!14188 () Bool)

(assert (=> start!3502 (=> (not res!14188) (not e!9519))))

(assert (=> start!3502 (= res!14188 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3502 e!9519))

(assert (=> start!3502 true))

(declare-fun inv!12 (BitStream!730) Bool)

(assert (=> start!3502 (and (inv!12 thiss!1073) e!9521)))

(declare-fun b!15228 () Bool)

(declare-fun res!14191 () Bool)

(assert (=> b!15228 (=> (not res!14191) (not e!9519))))

(assert (=> b!15228 (= res!14191 (validate_offset_bits!1 ((_ sign_extend 32) (size!385 (buf!742 thiss!1073))) ((_ sign_extend 32) (currentByte!1905 thiss!1073)) ((_ sign_extend 32) (currentBit!1900 thiss!1073)) nBits!313))))

(declare-fun b!15229 () Bool)

(declare-fun res!14189 () Bool)

(assert (=> b!15229 (=> (not res!14189) (not e!9520))))

(assert (=> b!15229 (= res!14189 (= (bitIndex!0 (size!385 (buf!742 (_2!954 lt!23081))) (currentByte!1905 (_2!954 lt!23081)) (currentBit!1900 (_2!954 lt!23081))) (bvadd (bitIndex!0 (size!385 (buf!742 thiss!1073)) (currentByte!1905 thiss!1073) (currentBit!1900 thiss!1073)) nBits!313)))))

(declare-fun b!15230 () Bool)

(declare-fun res!14192 () Bool)

(assert (=> b!15230 (=> (not res!14192) (not e!9520))))

(assert (=> b!15230 (= res!14192 (isPrefixOf!0 thiss!1073 (_2!954 lt!23081)))))

(assert (= (and start!3502 res!14188) b!15228))

(assert (= (and b!15228 res!14191) b!15225))

(assert (= (and b!15225 res!14190) b!15229))

(assert (= (and b!15229 res!14189) b!15230))

(assert (= (and b!15230 res!14192) b!15227))

(assert (= start!3502 b!15226))

(declare-fun m!21819 () Bool)

(assert (=> b!15228 m!21819))

(declare-fun m!21821 () Bool)

(assert (=> b!15225 m!21821))

(declare-fun m!21823 () Bool)

(assert (=> b!15225 m!21823))

(declare-fun m!21825 () Bool)

(assert (=> b!15225 m!21825))

(declare-fun m!21827 () Bool)

(assert (=> b!15225 m!21827))

(declare-fun m!21829 () Bool)

(assert (=> b!15225 m!21829))

(declare-fun m!21831 () Bool)

(assert (=> start!3502 m!21831))

(declare-fun m!21833 () Bool)

(assert (=> b!15226 m!21833))

(declare-fun m!21835 () Bool)

(assert (=> b!15227 m!21835))

(declare-fun m!21837 () Bool)

(assert (=> b!15227 m!21837))

(declare-fun m!21839 () Bool)

(assert (=> b!15227 m!21839))

(assert (=> b!15227 m!21821))

(assert (=> b!15230 m!21827))

(assert (=> b!15229 m!21825))

(assert (=> b!15229 m!21823))

(push 1)

(assert (not start!3502))

(assert (not b!15230))

(assert (not b!15226))

(assert (not b!15227))

(assert (not b!15228))

(assert (not b!15225))

(assert (not b!15229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

