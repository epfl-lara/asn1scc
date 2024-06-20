; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3648 () Bool)

(assert start!3648)

(declare-fun b!15831 () Bool)

(declare-fun e!9880 () Bool)

(declare-datatypes ((array!953 0))(
  ( (array!954 (arr!833 (Array (_ BitVec 32) (_ BitVec 8))) (size!404 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!768 0))(
  ( (BitStream!769 (buf!767 array!953) (currentByte!1936 (_ BitVec 32)) (currentBit!1931 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1908 0))(
  ( (tuple2!1909 (_1!1015 BitStream!768) (_2!1015 Bool)) )
))
(declare-fun lt!24191 () tuple2!1908)

(declare-datatypes ((tuple2!1910 0))(
  ( (tuple2!1911 (_1!1016 BitStream!768) (_2!1016 BitStream!768)) )
))
(declare-fun lt!24193 () tuple2!1910)

(assert (=> b!15831 (= e!9880 (not (or (not (_2!1015 lt!24191)) (not (= (_1!1015 lt!24191) (_2!1016 lt!24193))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!768 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1908)

(assert (=> b!15831 (= lt!24191 (checkBitsLoopPure!0 (_1!1016 lt!24193) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1301 0))(
  ( (Unit!1302) )
))
(declare-datatypes ((tuple2!1912 0))(
  ( (tuple2!1913 (_1!1017 Unit!1301) (_2!1017 BitStream!768)) )
))
(declare-fun lt!24196 () tuple2!1912)

(declare-fun thiss!1073 () BitStream!768)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15831 (validate_offset_bits!1 ((_ sign_extend 32) (size!404 (buf!767 (_2!1017 lt!24196)))) ((_ sign_extend 32) (currentByte!1936 thiss!1073)) ((_ sign_extend 32) (currentBit!1931 thiss!1073)) nBits!313)))

(declare-fun lt!24194 () Unit!1301)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!768 array!953 (_ BitVec 64)) Unit!1301)

(assert (=> b!15831 (= lt!24194 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!767 (_2!1017 lt!24196)) nBits!313))))

(declare-fun reader!0 (BitStream!768 BitStream!768) tuple2!1910)

(assert (=> b!15831 (= lt!24193 (reader!0 thiss!1073 (_2!1017 lt!24196)))))

(declare-fun b!15832 () Bool)

(declare-fun e!9879 () Bool)

(declare-fun array_inv!393 (array!953) Bool)

(assert (=> b!15832 (= e!9879 (array_inv!393 (buf!767 thiss!1073)))))

(declare-fun res!14701 () Bool)

(declare-fun e!9881 () Bool)

(assert (=> start!3648 (=> (not res!14701) (not e!9881))))

(assert (=> start!3648 (= res!14701 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3648 e!9881))

(assert (=> start!3648 true))

(declare-fun inv!12 (BitStream!768) Bool)

(assert (=> start!3648 (and (inv!12 thiss!1073) e!9879)))

(declare-fun b!15833 () Bool)

(assert (=> b!15833 (= e!9881 (not true))))

(declare-fun lt!24192 () tuple2!1910)

(assert (=> b!15833 (= lt!24192 (reader!0 thiss!1073 (_2!1017 lt!24196)))))

(declare-fun lt!24195 () Bool)

(declare-fun isPrefixOf!0 (BitStream!768 BitStream!768) Bool)

(assert (=> b!15833 (= lt!24195 (isPrefixOf!0 thiss!1073 (_2!1017 lt!24196)))))

(declare-fun lt!24189 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15833 (= lt!24189 (bitIndex!0 (size!404 (buf!767 (_2!1017 lt!24196))) (currentByte!1936 (_2!1017 lt!24196)) (currentBit!1931 (_2!1017 lt!24196))))))

(declare-fun lt!24190 () (_ BitVec 64))

(assert (=> b!15833 (= lt!24190 (bitIndex!0 (size!404 (buf!767 thiss!1073)) (currentByte!1936 thiss!1073) (currentBit!1931 thiss!1073)))))

(assert (=> b!15833 e!9880))

(declare-fun res!14705 () Bool)

(assert (=> b!15833 (=> (not res!14705) (not e!9880))))

(assert (=> b!15833 (= res!14705 (= (size!404 (buf!767 thiss!1073)) (size!404 (buf!767 (_2!1017 lt!24196)))))))

(declare-fun appendNBits!0 (BitStream!768 (_ BitVec 64) Bool) tuple2!1912)

(assert (=> b!15833 (= lt!24196 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15834 () Bool)

(declare-fun res!14702 () Bool)

(assert (=> b!15834 (=> (not res!14702) (not e!9881))))

(assert (=> b!15834 (= res!14702 (validate_offset_bits!1 ((_ sign_extend 32) (size!404 (buf!767 thiss!1073))) ((_ sign_extend 32) (currentByte!1936 thiss!1073)) ((_ sign_extend 32) (currentBit!1931 thiss!1073)) nBits!313))))

(declare-fun b!15835 () Bool)

(declare-fun res!14704 () Bool)

(assert (=> b!15835 (=> (not res!14704) (not e!9880))))

(assert (=> b!15835 (= res!14704 (= (bitIndex!0 (size!404 (buf!767 (_2!1017 lt!24196))) (currentByte!1936 (_2!1017 lt!24196)) (currentBit!1931 (_2!1017 lt!24196))) (bvadd (bitIndex!0 (size!404 (buf!767 thiss!1073)) (currentByte!1936 thiss!1073) (currentBit!1931 thiss!1073)) nBits!313)))))

(declare-fun b!15836 () Bool)

(declare-fun res!14703 () Bool)

(assert (=> b!15836 (=> (not res!14703) (not e!9880))))

(assert (=> b!15836 (= res!14703 (isPrefixOf!0 thiss!1073 (_2!1017 lt!24196)))))

(assert (= (and start!3648 res!14701) b!15834))

(assert (= (and b!15834 res!14702) b!15833))

(assert (= (and b!15833 res!14705) b!15835))

(assert (= (and b!15835 res!14704) b!15836))

(assert (= (and b!15836 res!14703) b!15831))

(assert (= start!3648 b!15832))

(declare-fun m!22579 () Bool)

(assert (=> b!15835 m!22579))

(declare-fun m!22581 () Bool)

(assert (=> b!15835 m!22581))

(assert (=> b!15833 m!22581))

(assert (=> b!15833 m!22579))

(declare-fun m!22583 () Bool)

(assert (=> b!15833 m!22583))

(declare-fun m!22585 () Bool)

(assert (=> b!15833 m!22585))

(declare-fun m!22587 () Bool)

(assert (=> b!15833 m!22587))

(declare-fun m!22589 () Bool)

(assert (=> b!15832 m!22589))

(declare-fun m!22591 () Bool)

(assert (=> b!15834 m!22591))

(declare-fun m!22593 () Bool)

(assert (=> start!3648 m!22593))

(declare-fun m!22595 () Bool)

(assert (=> b!15831 m!22595))

(declare-fun m!22597 () Bool)

(assert (=> b!15831 m!22597))

(declare-fun m!22599 () Bool)

(assert (=> b!15831 m!22599))

(assert (=> b!15831 m!22585))

(assert (=> b!15836 m!22587))

(check-sat (not b!15834) (not b!15832) (not b!15836) (not b!15831) (not b!15835) (not b!15833) (not start!3648))
