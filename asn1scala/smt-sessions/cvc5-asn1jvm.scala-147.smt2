; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3496 () Bool)

(assert start!3496)

(declare-fun res!14143 () Bool)

(declare-fun e!9486 () Bool)

(assert (=> start!3496 (=> (not res!14143) (not e!9486))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3496 (= res!14143 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3496 e!9486))

(assert (=> start!3496 true))

(declare-datatypes ((array!903 0))(
  ( (array!904 (arr!811 (Array (_ BitVec 32) (_ BitVec 8))) (size!382 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!724 0))(
  ( (BitStream!725 (buf!739 array!903) (currentByte!1902 (_ BitVec 32)) (currentBit!1897 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!724)

(declare-fun e!9484 () Bool)

(declare-fun inv!12 (BitStream!724) Bool)

(assert (=> start!3496 (and (inv!12 thiss!1073) e!9484)))

(declare-fun b!15171 () Bool)

(declare-fun array_inv!371 (array!903) Bool)

(assert (=> b!15171 (= e!9484 (array_inv!371 (buf!739 thiss!1073)))))

(declare-fun b!15172 () Bool)

(declare-fun res!14147 () Bool)

(declare-fun e!9483 () Bool)

(assert (=> b!15172 (=> (not res!14147) (not e!9483))))

(declare-datatypes ((Unit!1252 0))(
  ( (Unit!1253) )
))
(declare-datatypes ((tuple2!1766 0))(
  ( (tuple2!1767 (_1!944 Unit!1252) (_2!944 BitStream!724)) )
))
(declare-fun lt!23006 () tuple2!1766)

(declare-fun isPrefixOf!0 (BitStream!724 BitStream!724) Bool)

(assert (=> b!15172 (= res!14147 (isPrefixOf!0 thiss!1073 (_2!944 lt!23006)))))

(declare-fun b!15173 () Bool)

(declare-fun res!14144 () Bool)

(assert (=> b!15173 (=> (not res!14144) (not e!9483))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15173 (= res!14144 (= (bitIndex!0 (size!382 (buf!739 (_2!944 lt!23006))) (currentByte!1902 (_2!944 lt!23006)) (currentBit!1897 (_2!944 lt!23006))) (bvadd (bitIndex!0 (size!382 (buf!739 thiss!1073)) (currentByte!1902 thiss!1073) (currentBit!1897 thiss!1073)) nBits!313)))))

(declare-fun b!15174 () Bool)

(assert (=> b!15174 (= e!9486 (not true))))

(declare-datatypes ((tuple2!1768 0))(
  ( (tuple2!1769 (_1!945 BitStream!724) (_2!945 BitStream!724)) )
))
(declare-fun lt!23004 () tuple2!1768)

(declare-fun reader!0 (BitStream!724 BitStream!724) tuple2!1768)

(assert (=> b!15174 (= lt!23004 (reader!0 thiss!1073 (_2!944 lt!23006)))))

(declare-fun lt!23007 () Bool)

(assert (=> b!15174 (= lt!23007 (isPrefixOf!0 thiss!1073 (_2!944 lt!23006)))))

(declare-fun lt!23005 () (_ BitVec 64))

(assert (=> b!15174 (= lt!23005 (bitIndex!0 (size!382 (buf!739 (_2!944 lt!23006))) (currentByte!1902 (_2!944 lt!23006)) (currentBit!1897 (_2!944 lt!23006))))))

(declare-fun lt!23011 () (_ BitVec 64))

(assert (=> b!15174 (= lt!23011 (bitIndex!0 (size!382 (buf!739 thiss!1073)) (currentByte!1902 thiss!1073) (currentBit!1897 thiss!1073)))))

(assert (=> b!15174 e!9483))

(declare-fun res!14145 () Bool)

(assert (=> b!15174 (=> (not res!14145) (not e!9483))))

(assert (=> b!15174 (= res!14145 (= (size!382 (buf!739 thiss!1073)) (size!382 (buf!739 (_2!944 lt!23006)))))))

(declare-fun appendNBits!0 (BitStream!724 (_ BitVec 64) Bool) tuple2!1766)

(assert (=> b!15174 (= lt!23006 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15175 () Bool)

(declare-fun res!14146 () Bool)

(assert (=> b!15175 (=> (not res!14146) (not e!9486))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15175 (= res!14146 (validate_offset_bits!1 ((_ sign_extend 32) (size!382 (buf!739 thiss!1073))) ((_ sign_extend 32) (currentByte!1902 thiss!1073)) ((_ sign_extend 32) (currentBit!1897 thiss!1073)) nBits!313))))

(declare-fun b!15176 () Bool)

(declare-datatypes ((tuple2!1770 0))(
  ( (tuple2!1771 (_1!946 BitStream!724) (_2!946 Bool)) )
))
(declare-fun lt!23009 () tuple2!1770)

(declare-fun lt!23008 () tuple2!1768)

(assert (=> b!15176 (= e!9483 (not (or (not (_2!946 lt!23009)) (not (= (_1!946 lt!23009) (_2!945 lt!23008))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!724 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1770)

(assert (=> b!15176 (= lt!23009 (checkBitsLoopPure!0 (_1!945 lt!23008) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15176 (validate_offset_bits!1 ((_ sign_extend 32) (size!382 (buf!739 (_2!944 lt!23006)))) ((_ sign_extend 32) (currentByte!1902 thiss!1073)) ((_ sign_extend 32) (currentBit!1897 thiss!1073)) nBits!313)))

(declare-fun lt!23010 () Unit!1252)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!724 array!903 (_ BitVec 64)) Unit!1252)

(assert (=> b!15176 (= lt!23010 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!739 (_2!944 lt!23006)) nBits!313))))

(assert (=> b!15176 (= lt!23008 (reader!0 thiss!1073 (_2!944 lt!23006)))))

(assert (= (and start!3496 res!14143) b!15175))

(assert (= (and b!15175 res!14146) b!15174))

(assert (= (and b!15174 res!14145) b!15173))

(assert (= (and b!15173 res!14144) b!15172))

(assert (= (and b!15172 res!14147) b!15176))

(assert (= start!3496 b!15171))

(declare-fun m!21753 () Bool)

(assert (=> b!15176 m!21753))

(declare-fun m!21755 () Bool)

(assert (=> b!15176 m!21755))

(declare-fun m!21757 () Bool)

(assert (=> b!15176 m!21757))

(declare-fun m!21759 () Bool)

(assert (=> b!15176 m!21759))

(declare-fun m!21761 () Bool)

(assert (=> b!15174 m!21761))

(declare-fun m!21763 () Bool)

(assert (=> b!15174 m!21763))

(declare-fun m!21765 () Bool)

(assert (=> b!15174 m!21765))

(assert (=> b!15174 m!21759))

(declare-fun m!21767 () Bool)

(assert (=> b!15174 m!21767))

(assert (=> b!15172 m!21761))

(declare-fun m!21769 () Bool)

(assert (=> start!3496 m!21769))

(declare-fun m!21771 () Bool)

(assert (=> b!15171 m!21771))

(declare-fun m!21773 () Bool)

(assert (=> b!15175 m!21773))

(assert (=> b!15173 m!21763))

(assert (=> b!15173 m!21765))

(push 1)

(assert (not start!3496))

(assert (not b!15174))

(assert (not b!15175))

(assert (not b!15176))

(assert (not b!15172))

(assert (not b!15171))

(assert (not b!15173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

