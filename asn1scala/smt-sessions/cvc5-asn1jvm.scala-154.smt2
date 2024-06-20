; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3646 () Bool)

(assert start!3646)

(declare-fun b!15813 () Bool)

(declare-fun e!9867 () Bool)

(declare-datatypes ((array!951 0))(
  ( (array!952 (arr!832 (Array (_ BitVec 32) (_ BitVec 8))) (size!403 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!766 0))(
  ( (BitStream!767 (buf!766 array!951) (currentByte!1935 (_ BitVec 32)) (currentBit!1930 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!766)

(declare-fun array_inv!392 (array!951) Bool)

(assert (=> b!15813 (= e!9867 (array_inv!392 (buf!766 thiss!1073)))))

(declare-fun b!15814 () Bool)

(declare-fun e!9869 () Bool)

(declare-datatypes ((tuple2!1902 0))(
  ( (tuple2!1903 (_1!1012 BitStream!766) (_2!1012 Bool)) )
))
(declare-fun lt!24170 () tuple2!1902)

(declare-datatypes ((tuple2!1904 0))(
  ( (tuple2!1905 (_1!1013 BitStream!766) (_2!1013 BitStream!766)) )
))
(declare-fun lt!24165 () tuple2!1904)

(assert (=> b!15814 (= e!9869 (not (or (not (_2!1012 lt!24170)) (not (= (_1!1012 lt!24170) (_2!1013 lt!24165))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!766 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1902)

(assert (=> b!15814 (= lt!24170 (checkBitsLoopPure!0 (_1!1013 lt!24165) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1299 0))(
  ( (Unit!1300) )
))
(declare-datatypes ((tuple2!1906 0))(
  ( (tuple2!1907 (_1!1014 Unit!1299) (_2!1014 BitStream!766)) )
))
(declare-fun lt!24166 () tuple2!1906)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15814 (validate_offset_bits!1 ((_ sign_extend 32) (size!403 (buf!766 (_2!1014 lt!24166)))) ((_ sign_extend 32) (currentByte!1935 thiss!1073)) ((_ sign_extend 32) (currentBit!1930 thiss!1073)) nBits!313)))

(declare-fun lt!24171 () Unit!1299)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!766 array!951 (_ BitVec 64)) Unit!1299)

(assert (=> b!15814 (= lt!24171 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!766 (_2!1014 lt!24166)) nBits!313))))

(declare-fun reader!0 (BitStream!766 BitStream!766) tuple2!1904)

(assert (=> b!15814 (= lt!24165 (reader!0 thiss!1073 (_2!1014 lt!24166)))))

(declare-fun b!15815 () Bool)

(declare-fun res!14690 () Bool)

(assert (=> b!15815 (=> (not res!14690) (not e!9869))))

(declare-fun isPrefixOf!0 (BitStream!766 BitStream!766) Bool)

(assert (=> b!15815 (= res!14690 (isPrefixOf!0 thiss!1073 (_2!1014 lt!24166)))))

(declare-fun b!15816 () Bool)

(declare-fun res!14688 () Bool)

(assert (=> b!15816 (=> (not res!14688) (not e!9869))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15816 (= res!14688 (= (bitIndex!0 (size!403 (buf!766 (_2!1014 lt!24166))) (currentByte!1935 (_2!1014 lt!24166)) (currentBit!1930 (_2!1014 lt!24166))) (bvadd (bitIndex!0 (size!403 (buf!766 thiss!1073)) (currentByte!1935 thiss!1073) (currentBit!1930 thiss!1073)) nBits!313)))))

(declare-fun res!14689 () Bool)

(declare-fun e!9870 () Bool)

(assert (=> start!3646 (=> (not res!14689) (not e!9870))))

(assert (=> start!3646 (= res!14689 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3646 e!9870))

(assert (=> start!3646 true))

(declare-fun inv!12 (BitStream!766) Bool)

(assert (=> start!3646 (and (inv!12 thiss!1073) e!9867)))

(declare-fun b!15817 () Bool)

(assert (=> b!15817 (= e!9870 (not true))))

(declare-fun lt!24168 () tuple2!1904)

(assert (=> b!15817 (= lt!24168 (reader!0 thiss!1073 (_2!1014 lt!24166)))))

(declare-fun lt!24167 () Bool)

(assert (=> b!15817 (= lt!24167 (isPrefixOf!0 thiss!1073 (_2!1014 lt!24166)))))

(declare-fun lt!24172 () (_ BitVec 64))

(assert (=> b!15817 (= lt!24172 (bitIndex!0 (size!403 (buf!766 (_2!1014 lt!24166))) (currentByte!1935 (_2!1014 lt!24166)) (currentBit!1930 (_2!1014 lt!24166))))))

(declare-fun lt!24169 () (_ BitVec 64))

(assert (=> b!15817 (= lt!24169 (bitIndex!0 (size!403 (buf!766 thiss!1073)) (currentByte!1935 thiss!1073) (currentBit!1930 thiss!1073)))))

(assert (=> b!15817 e!9869))

(declare-fun res!14686 () Bool)

(assert (=> b!15817 (=> (not res!14686) (not e!9869))))

(assert (=> b!15817 (= res!14686 (= (size!403 (buf!766 thiss!1073)) (size!403 (buf!766 (_2!1014 lt!24166)))))))

(declare-fun appendNBits!0 (BitStream!766 (_ BitVec 64) Bool) tuple2!1906)

(assert (=> b!15817 (= lt!24166 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15818 () Bool)

(declare-fun res!14687 () Bool)

(assert (=> b!15818 (=> (not res!14687) (not e!9870))))

(assert (=> b!15818 (= res!14687 (validate_offset_bits!1 ((_ sign_extend 32) (size!403 (buf!766 thiss!1073))) ((_ sign_extend 32) (currentByte!1935 thiss!1073)) ((_ sign_extend 32) (currentBit!1930 thiss!1073)) nBits!313))))

(assert (= (and start!3646 res!14689) b!15818))

(assert (= (and b!15818 res!14687) b!15817))

(assert (= (and b!15817 res!14686) b!15816))

(assert (= (and b!15816 res!14688) b!15815))

(assert (= (and b!15815 res!14690) b!15814))

(assert (= start!3646 b!15813))

(declare-fun m!22557 () Bool)

(assert (=> start!3646 m!22557))

(declare-fun m!22559 () Bool)

(assert (=> b!15813 m!22559))

(declare-fun m!22561 () Bool)

(assert (=> b!15818 m!22561))

(declare-fun m!22563 () Bool)

(assert (=> b!15815 m!22563))

(declare-fun m!22565 () Bool)

(assert (=> b!15816 m!22565))

(declare-fun m!22567 () Bool)

(assert (=> b!15816 m!22567))

(declare-fun m!22569 () Bool)

(assert (=> b!15814 m!22569))

(declare-fun m!22571 () Bool)

(assert (=> b!15814 m!22571))

(declare-fun m!22573 () Bool)

(assert (=> b!15814 m!22573))

(declare-fun m!22575 () Bool)

(assert (=> b!15814 m!22575))

(assert (=> b!15817 m!22567))

(assert (=> b!15817 m!22565))

(assert (=> b!15817 m!22575))

(assert (=> b!15817 m!22563))

(declare-fun m!22577 () Bool)

(assert (=> b!15817 m!22577))

(push 1)

(assert (not b!15818))

(assert (not b!15816))

(assert (not b!15817))

(assert (not b!15813))

(assert (not b!15815))

(assert (not b!15814))

(assert (not start!3646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

