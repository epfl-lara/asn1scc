; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3656 () Bool)

(assert start!3656)

(declare-fun b!15904 () Bool)

(declare-fun e!9927 () Bool)

(declare-datatypes ((array!961 0))(
  ( (array!962 (arr!837 (Array (_ BitVec 32) (_ BitVec 8))) (size!408 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!776 0))(
  ( (BitStream!777 (buf!771 array!961) (currentByte!1940 (_ BitVec 32)) (currentBit!1935 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!776)

(declare-fun array_inv!397 (array!961) Bool)

(assert (=> b!15904 (= e!9927 (array_inv!397 (buf!771 thiss!1073)))))

(declare-fun b!15905 () Bool)

(declare-fun res!14763 () Bool)

(declare-fun e!9928 () Bool)

(assert (=> b!15905 (=> (not res!14763) (not e!9928))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((Unit!1309 0))(
  ( (Unit!1310) )
))
(declare-datatypes ((tuple2!1932 0))(
  ( (tuple2!1933 (_1!1027 Unit!1309) (_2!1027 BitStream!776)) )
))
(declare-fun lt!24290 () tuple2!1932)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15905 (= res!14763 (= (bitIndex!0 (size!408 (buf!771 (_2!1027 lt!24290))) (currentByte!1940 (_2!1027 lt!24290)) (currentBit!1935 (_2!1027 lt!24290))) (bvadd (bitIndex!0 (size!408 (buf!771 thiss!1073)) (currentByte!1940 thiss!1073) (currentBit!1935 thiss!1073)) nBits!313)))))

(declare-fun b!15906 () Bool)

(declare-fun res!14762 () Bool)

(declare-fun e!9929 () Bool)

(assert (=> b!15906 (=> (not res!14762) (not e!9929))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15906 (= res!14762 (validate_offset_bits!1 ((_ sign_extend 32) (size!408 (buf!771 thiss!1073))) ((_ sign_extend 32) (currentByte!1940 thiss!1073)) ((_ sign_extend 32) (currentBit!1935 thiss!1073)) nBits!313))))

(declare-fun b!15907 () Bool)

(declare-fun res!14761 () Bool)

(assert (=> b!15907 (=> (not res!14761) (not e!9928))))

(declare-fun isPrefixOf!0 (BitStream!776 BitStream!776) Bool)

(assert (=> b!15907 (= res!14761 (isPrefixOf!0 thiss!1073 (_2!1027 lt!24290)))))

(declare-fun b!15908 () Bool)

(declare-datatypes ((tuple2!1934 0))(
  ( (tuple2!1935 (_1!1028 BitStream!776) (_2!1028 Bool)) )
))
(declare-fun lt!24292 () tuple2!1934)

(declare-datatypes ((tuple2!1936 0))(
  ( (tuple2!1937 (_1!1029 BitStream!776) (_2!1029 BitStream!776)) )
))
(declare-fun lt!24291 () tuple2!1936)

(assert (=> b!15908 (= e!9928 (not (or (not (_2!1028 lt!24292)) (not (= (_1!1028 lt!24292) (_2!1029 lt!24291))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!776 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1934)

(assert (=> b!15908 (= lt!24292 (checkBitsLoopPure!0 (_1!1029 lt!24291) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15908 (validate_offset_bits!1 ((_ sign_extend 32) (size!408 (buf!771 (_2!1027 lt!24290)))) ((_ sign_extend 32) (currentByte!1940 thiss!1073)) ((_ sign_extend 32) (currentBit!1935 thiss!1073)) nBits!313)))

(declare-fun lt!24285 () Unit!1309)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!776 array!961 (_ BitVec 64)) Unit!1309)

(assert (=> b!15908 (= lt!24285 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!771 (_2!1027 lt!24290)) nBits!313))))

(declare-fun reader!0 (BitStream!776 BitStream!776) tuple2!1936)

(assert (=> b!15908 (= lt!24291 (reader!0 thiss!1073 (_2!1027 lt!24290)))))

(declare-fun res!14764 () Bool)

(assert (=> start!3656 (=> (not res!14764) (not e!9929))))

(assert (=> start!3656 (= res!14764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3656 e!9929))

(assert (=> start!3656 true))

(declare-fun inv!12 (BitStream!776) Bool)

(assert (=> start!3656 (and (inv!12 thiss!1073) e!9927)))

(declare-fun b!15903 () Bool)

(assert (=> b!15903 (= e!9929 (not true))))

(declare-fun lt!24286 () tuple2!1936)

(assert (=> b!15903 (= lt!24286 (reader!0 thiss!1073 (_2!1027 lt!24290)))))

(declare-fun lt!24288 () Bool)

(assert (=> b!15903 (= lt!24288 (isPrefixOf!0 thiss!1073 (_2!1027 lt!24290)))))

(declare-fun lt!24289 () (_ BitVec 64))

(assert (=> b!15903 (= lt!24289 (bitIndex!0 (size!408 (buf!771 (_2!1027 lt!24290))) (currentByte!1940 (_2!1027 lt!24290)) (currentBit!1935 (_2!1027 lt!24290))))))

(declare-fun lt!24287 () (_ BitVec 64))

(assert (=> b!15903 (= lt!24287 (bitIndex!0 (size!408 (buf!771 thiss!1073)) (currentByte!1940 thiss!1073) (currentBit!1935 thiss!1073)))))

(assert (=> b!15903 e!9928))

(declare-fun res!14765 () Bool)

(assert (=> b!15903 (=> (not res!14765) (not e!9928))))

(assert (=> b!15903 (= res!14765 (= (size!408 (buf!771 thiss!1073)) (size!408 (buf!771 (_2!1027 lt!24290)))))))

(declare-fun appendNBits!0 (BitStream!776 (_ BitVec 64) Bool) tuple2!1932)

(assert (=> b!15903 (= lt!24290 (appendNBits!0 thiss!1073 nBits!313 true))))

(assert (= (and start!3656 res!14764) b!15906))

(assert (= (and b!15906 res!14762) b!15903))

(assert (= (and b!15903 res!14765) b!15905))

(assert (= (and b!15905 res!14763) b!15907))

(assert (= (and b!15907 res!14761) b!15908))

(assert (= start!3656 b!15904))

(declare-fun m!22667 () Bool)

(assert (=> b!15905 m!22667))

(declare-fun m!22669 () Bool)

(assert (=> b!15905 m!22669))

(declare-fun m!22671 () Bool)

(assert (=> start!3656 m!22671))

(declare-fun m!22673 () Bool)

(assert (=> b!15906 m!22673))

(declare-fun m!22675 () Bool)

(assert (=> b!15907 m!22675))

(declare-fun m!22677 () Bool)

(assert (=> b!15904 m!22677))

(assert (=> b!15903 m!22669))

(declare-fun m!22679 () Bool)

(assert (=> b!15903 m!22679))

(assert (=> b!15903 m!22667))

(assert (=> b!15903 m!22675))

(declare-fun m!22681 () Bool)

(assert (=> b!15903 m!22681))

(declare-fun m!22683 () Bool)

(assert (=> b!15908 m!22683))

(declare-fun m!22685 () Bool)

(assert (=> b!15908 m!22685))

(declare-fun m!22687 () Bool)

(assert (=> b!15908 m!22687))

(assert (=> b!15908 m!22679))

(push 1)

