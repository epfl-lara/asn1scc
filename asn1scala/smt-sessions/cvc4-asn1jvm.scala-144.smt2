; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3422 () Bool)

(assert start!3422)

(declare-fun b!14913 () Bool)

(declare-fun e!9334 () Bool)

(declare-datatypes ((array!886 0))(
  ( (array!887 (arr!804 (Array (_ BitVec 32) (_ BitVec 8))) (size!375 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!710 0))(
  ( (BitStream!711 (buf!729 array!886) (currentByte!1886 (_ BitVec 32)) (currentBit!1881 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1718 0))(
  ( (tuple2!1719 (_1!920 BitStream!710) (_2!920 Bool)) )
))
(declare-fun lt!22525 () tuple2!1718)

(declare-datatypes ((tuple2!1720 0))(
  ( (tuple2!1721 (_1!921 BitStream!710) (_2!921 BitStream!710)) )
))
(declare-fun lt!22527 () tuple2!1720)

(assert (=> b!14913 (= e!9334 (not (or (not (_2!920 lt!22525)) (not (= (_1!920 lt!22525) (_2!921 lt!22527))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!710 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1718)

(assert (=> b!14913 (= lt!22525 (checkBitsLoopPure!0 (_1!921 lt!22527) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1235 0))(
  ( (Unit!1236) )
))
(declare-datatypes ((tuple2!1722 0))(
  ( (tuple2!1723 (_1!922 Unit!1235) (_2!922 BitStream!710)) )
))
(declare-fun lt!22528 () tuple2!1722)

(declare-fun thiss!1073 () BitStream!710)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14913 (validate_offset_bits!1 ((_ sign_extend 32) (size!375 (buf!729 (_2!922 lt!22528)))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073)) nBits!313)))

(declare-fun lt!22526 () Unit!1235)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!710 array!886 (_ BitVec 64)) Unit!1235)

(assert (=> b!14913 (= lt!22526 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!729 (_2!922 lt!22528)) nBits!313))))

(declare-fun reader!0 (BitStream!710 BitStream!710) tuple2!1720)

(assert (=> b!14913 (= lt!22527 (reader!0 thiss!1073 (_2!922 lt!22528)))))

(declare-fun res!13928 () Bool)

(declare-fun e!9336 () Bool)

(assert (=> start!3422 (=> (not res!13928) (not e!9336))))

(assert (=> start!3422 (= res!13928 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3422 e!9336))

(assert (=> start!3422 true))

(declare-fun e!9333 () Bool)

(declare-fun inv!12 (BitStream!710) Bool)

(assert (=> start!3422 (and (inv!12 thiss!1073) e!9333)))

(declare-fun b!14914 () Bool)

(declare-fun res!13927 () Bool)

(assert (=> b!14914 (=> (not res!13927) (not e!9334))))

(declare-fun isPrefixOf!0 (BitStream!710 BitStream!710) Bool)

(assert (=> b!14914 (= res!13927 (isPrefixOf!0 thiss!1073 (_2!922 lt!22528)))))

(declare-fun b!14915 () Bool)

(declare-fun res!13925 () Bool)

(assert (=> b!14915 (=> (not res!13925) (not e!9334))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14915 (= res!13925 (= (bitIndex!0 (size!375 (buf!729 (_2!922 lt!22528))) (currentByte!1886 (_2!922 lt!22528)) (currentBit!1881 (_2!922 lt!22528))) (bvadd (bitIndex!0 (size!375 (buf!729 thiss!1073)) (currentByte!1886 thiss!1073) (currentBit!1881 thiss!1073)) nBits!313)))))

(declare-fun b!14916 () Bool)

(declare-fun res!13926 () Bool)

(assert (=> b!14916 (=> (not res!13926) (not e!9336))))

(assert (=> b!14916 (= res!13926 (validate_offset_bits!1 ((_ sign_extend 32) (size!375 (buf!729 thiss!1073))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073)) nBits!313))))

(declare-fun b!14917 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14917 (= e!9336 (not (invariant!0 (currentBit!1881 thiss!1073) (currentByte!1886 thiss!1073) (size!375 (buf!729 thiss!1073)))))))

(assert (=> b!14917 e!9334))

(declare-fun res!13924 () Bool)

(assert (=> b!14917 (=> (not res!13924) (not e!9334))))

(assert (=> b!14917 (= res!13924 (= (size!375 (buf!729 thiss!1073)) (size!375 (buf!729 (_2!922 lt!22528)))))))

(declare-fun appendNBits!0 (BitStream!710 (_ BitVec 64) Bool) tuple2!1722)

(assert (=> b!14917 (= lt!22528 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!14918 () Bool)

(declare-fun array_inv!364 (array!886) Bool)

(assert (=> b!14918 (= e!9333 (array_inv!364 (buf!729 thiss!1073)))))

(assert (= (and start!3422 res!13928) b!14916))

(assert (= (and b!14916 res!13926) b!14917))

(assert (= (and b!14917 res!13924) b!14915))

(assert (= (and b!14915 res!13925) b!14914))

(assert (= (and b!14914 res!13927) b!14913))

(assert (= start!3422 b!14918))

(declare-fun m!21423 () Bool)

(assert (=> b!14917 m!21423))

(declare-fun m!21425 () Bool)

(assert (=> b!14917 m!21425))

(declare-fun m!21427 () Bool)

(assert (=> start!3422 m!21427))

(declare-fun m!21429 () Bool)

(assert (=> b!14918 m!21429))

(declare-fun m!21431 () Bool)

(assert (=> b!14915 m!21431))

(declare-fun m!21433 () Bool)

(assert (=> b!14915 m!21433))

(declare-fun m!21435 () Bool)

(assert (=> b!14916 m!21435))

(declare-fun m!21437 () Bool)

(assert (=> b!14914 m!21437))

(declare-fun m!21439 () Bool)

(assert (=> b!14913 m!21439))

(declare-fun m!21441 () Bool)

(assert (=> b!14913 m!21441))

(declare-fun m!21443 () Bool)

(assert (=> b!14913 m!21443))

(declare-fun m!21445 () Bool)

(assert (=> b!14913 m!21445))

(push 1)

(assert (not b!14913))

(assert (not b!14917))

(assert (not b!14916))

(assert (not b!14918))

(assert (not b!14915))

(assert (not b!14914))

(assert (not start!3422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4926 () Bool)

(declare-fun e!9339 () Bool)

(assert (=> d!4926 e!9339))

(declare-fun res!13934 () Bool)

(assert (=> d!4926 (=> (not res!13934) (not e!9339))))

(declare-fun lt!22546 () (_ BitVec 64))

(declare-fun lt!22544 () (_ BitVec 64))

(declare-fun lt!22543 () (_ BitVec 64))

(assert (=> d!4926 (= res!13934 (= lt!22544 (bvsub lt!22543 lt!22546)))))

(assert (=> d!4926 (or (= (bvand lt!22543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22543 lt!22546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4926 (= lt!22546 (remainingBits!0 ((_ sign_extend 32) (size!375 (buf!729 (_2!922 lt!22528)))) ((_ sign_extend 32) (currentByte!1886 (_2!922 lt!22528))) ((_ sign_extend 32) (currentBit!1881 (_2!922 lt!22528)))))))

(declare-fun lt!22541 () (_ BitVec 64))

(declare-fun lt!22545 () (_ BitVec 64))

(assert (=> d!4926 (= lt!22543 (bvmul lt!22541 lt!22545))))

(assert (=> d!4926 (or (= lt!22541 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22545 (bvsdiv (bvmul lt!22541 lt!22545) lt!22541)))))

(assert (=> d!4926 (= lt!22545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4926 (= lt!22541 ((_ sign_extend 32) (size!375 (buf!729 (_2!922 lt!22528)))))))

(assert (=> d!4926 (= lt!22544 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1886 (_2!922 lt!22528))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1881 (_2!922 lt!22528)))))))

(assert (=> d!4926 (invariant!0 (currentBit!1881 (_2!922 lt!22528)) (currentByte!1886 (_2!922 lt!22528)) (size!375 (buf!729 (_2!922 lt!22528))))))

(assert (=> d!4926 (= (bitIndex!0 (size!375 (buf!729 (_2!922 lt!22528))) (currentByte!1886 (_2!922 lt!22528)) (currentBit!1881 (_2!922 lt!22528))) lt!22544)))

(declare-fun b!14923 () Bool)

(declare-fun res!13933 () Bool)

(assert (=> b!14923 (=> (not res!13933) (not e!9339))))

(assert (=> b!14923 (= res!13933 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22544))))

(declare-fun b!14924 () Bool)

(declare-fun lt!22542 () (_ BitVec 64))

(assert (=> b!14924 (= e!9339 (bvsle lt!22544 (bvmul lt!22542 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14924 (or (= lt!22542 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22542 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22542)))))

(assert (=> b!14924 (= lt!22542 ((_ sign_extend 32) (size!375 (buf!729 (_2!922 lt!22528)))))))

(assert (= (and d!4926 res!13934) b!14923))

(assert (= (and b!14923 res!13933) b!14924))

(declare-fun m!21447 () Bool)

(assert (=> d!4926 m!21447))

(declare-fun m!21449 () Bool)

(assert (=> d!4926 m!21449))

(assert (=> b!14915 d!4926))

(declare-fun d!4930 () Bool)

(declare-fun e!9340 () Bool)

(assert (=> d!4930 e!9340))

(declare-fun res!13936 () Bool)

(assert (=> d!4930 (=> (not res!13936) (not e!9340))))

(declare-fun lt!22550 () (_ BitVec 64))

(declare-fun lt!22552 () (_ BitVec 64))

(declare-fun lt!22549 () (_ BitVec 64))

(assert (=> d!4930 (= res!13936 (= lt!22550 (bvsub lt!22549 lt!22552)))))

(assert (=> d!4930 (or (= (bvand lt!22549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22552 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22549 lt!22552) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4930 (= lt!22552 (remainingBits!0 ((_ sign_extend 32) (size!375 (buf!729 thiss!1073))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073))))))

(declare-fun lt!22547 () (_ BitVec 64))

(declare-fun lt!22551 () (_ BitVec 64))

(assert (=> d!4930 (= lt!22549 (bvmul lt!22547 lt!22551))))

(assert (=> d!4930 (or (= lt!22547 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22551 (bvsdiv (bvmul lt!22547 lt!22551) lt!22547)))))

(assert (=> d!4930 (= lt!22551 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4930 (= lt!22547 ((_ sign_extend 32) (size!375 (buf!729 thiss!1073))))))

(assert (=> d!4930 (= lt!22550 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1886 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1881 thiss!1073))))))

(assert (=> d!4930 (invariant!0 (currentBit!1881 thiss!1073) (currentByte!1886 thiss!1073) (size!375 (buf!729 thiss!1073)))))

(assert (=> d!4930 (= (bitIndex!0 (size!375 (buf!729 thiss!1073)) (currentByte!1886 thiss!1073) (currentBit!1881 thiss!1073)) lt!22550)))

(declare-fun b!14925 () Bool)

(declare-fun res!13935 () Bool)

(assert (=> b!14925 (=> (not res!13935) (not e!9340))))

(assert (=> b!14925 (= res!13935 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22550))))

(declare-fun b!14926 () Bool)

(declare-fun lt!22548 () (_ BitVec 64))

(assert (=> b!14926 (= e!9340 (bvsle lt!22550 (bvmul lt!22548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14926 (or (= lt!22548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22548)))))

(assert (=> b!14926 (= lt!22548 ((_ sign_extend 32) (size!375 (buf!729 thiss!1073))))))

(assert (= (and d!4930 res!13936) b!14925))

(assert (= (and b!14925 res!13935) b!14926))

(declare-fun m!21451 () Bool)

(assert (=> d!4930 m!21451))

(assert (=> d!4930 m!21423))

(assert (=> b!14915 d!4930))

(declare-fun d!4932 () Bool)

(assert (=> d!4932 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!375 (buf!729 thiss!1073))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!375 (buf!729 thiss!1073))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073))) nBits!313))))

(declare-fun bs!1359 () Bool)

(assert (= bs!1359 d!4932))

(assert (=> bs!1359 m!21451))

(assert (=> b!14916 d!4932))

(declare-fun d!4934 () Bool)

(declare-fun res!13944 () Bool)

(declare-fun e!9346 () Bool)

(assert (=> d!4934 (=> (not res!13944) (not e!9346))))

(assert (=> d!4934 (= res!13944 (= (size!375 (buf!729 thiss!1073)) (size!375 (buf!729 (_2!922 lt!22528)))))))

(assert (=> d!4934 (= (isPrefixOf!0 thiss!1073 (_2!922 lt!22528)) e!9346)))

(declare-fun b!14933 () Bool)

(declare-fun res!13945 () Bool)

(assert (=> b!14933 (=> (not res!13945) (not e!9346))))

(assert (=> b!14933 (= res!13945 (bvsle (bitIndex!0 (size!375 (buf!729 thiss!1073)) (currentByte!1886 thiss!1073) (currentBit!1881 thiss!1073)) (bitIndex!0 (size!375 (buf!729 (_2!922 lt!22528))) (currentByte!1886 (_2!922 lt!22528)) (currentBit!1881 (_2!922 lt!22528)))))))

(declare-fun b!14934 () Bool)

(declare-fun e!9345 () Bool)

(assert (=> b!14934 (= e!9346 e!9345)))

(declare-fun res!13943 () Bool)

(assert (=> b!14934 (=> res!13943 e!9345)))

(assert (=> b!14934 (= res!13943 (= (size!375 (buf!729 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!14935 () Bool)

(declare-fun arrayBitRangesEq!0 (array!886 array!886 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14935 (= e!9345 (arrayBitRangesEq!0 (buf!729 thiss!1073) (buf!729 (_2!922 lt!22528)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!375 (buf!729 thiss!1073)) (currentByte!1886 thiss!1073) (currentBit!1881 thiss!1073))))))

(assert (= (and d!4934 res!13944) b!14933))

(assert (= (and b!14933 res!13945) b!14934))

(assert (= (and b!14934 (not res!13943)) b!14935))

(assert (=> b!14933 m!21433))

(assert (=> b!14933 m!21431))

(assert (=> b!14935 m!21433))

(assert (=> b!14935 m!21433))

(declare-fun m!21453 () Bool)

(assert (=> b!14935 m!21453))

(assert (=> b!14914 d!4934))

(declare-fun d!4936 () Bool)

(assert (=> d!4936 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1881 thiss!1073) (currentByte!1886 thiss!1073) (size!375 (buf!729 thiss!1073))))))

(declare-fun bs!1360 () Bool)

(assert (= bs!1360 d!4936))

(assert (=> bs!1360 m!21423))

(assert (=> start!3422 d!4936))

(declare-fun d!4938 () Bool)

(assert (=> d!4938 (= (array_inv!364 (buf!729 thiss!1073)) (bvsge (size!375 (buf!729 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14918 d!4938))

(declare-fun d!4940 () Bool)

(declare-datatypes ((tuple2!1726 0))(
  ( (tuple2!1727 (_1!924 Bool) (_2!924 BitStream!710)) )
))
(declare-fun lt!22555 () tuple2!1726)

(declare-fun checkBitsLoop!0 (BitStream!710 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1726)

(assert (=> d!4940 (= lt!22555 (checkBitsLoop!0 (_1!921 lt!22527) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4940 (= (checkBitsLoopPure!0 (_1!921 lt!22527) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1719 (_2!924 lt!22555) (_1!924 lt!22555)))))

(declare-fun bs!1361 () Bool)

(assert (= bs!1361 d!4940))

(declare-fun m!21455 () Bool)

(assert (=> bs!1361 m!21455))

(assert (=> b!14913 d!4940))

(declare-fun d!4942 () Bool)

(assert (=> d!4942 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!375 (buf!729 (_2!922 lt!22528)))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!375 (buf!729 (_2!922 lt!22528)))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073))) nBits!313))))

(declare-fun bs!1362 () Bool)

(assert (= bs!1362 d!4942))

(declare-fun m!21457 () Bool)

(assert (=> bs!1362 m!21457))

(assert (=> b!14913 d!4942))

(declare-fun d!4944 () Bool)

(assert (=> d!4944 (validate_offset_bits!1 ((_ sign_extend 32) (size!375 (buf!729 (_2!922 lt!22528)))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073)) nBits!313)))

(declare-fun lt!22558 () Unit!1235)

(declare-fun choose!9 (BitStream!710 array!886 (_ BitVec 64) BitStream!710) Unit!1235)

(assert (=> d!4944 (= lt!22558 (choose!9 thiss!1073 (buf!729 (_2!922 lt!22528)) nBits!313 (BitStream!711 (buf!729 (_2!922 lt!22528)) (currentByte!1886 thiss!1073) (currentBit!1881 thiss!1073))))))

(assert (=> d!4944 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!729 (_2!922 lt!22528)) nBits!313) lt!22558)))

(declare-fun bs!1363 () Bool)

(assert (= bs!1363 d!4944))

(assert (=> bs!1363 m!21441))

(declare-fun m!21459 () Bool)

(assert (=> bs!1363 m!21459))

(assert (=> b!14913 d!4944))

(declare-fun d!4946 () Bool)

(declare-fun e!9365 () Bool)

(assert (=> d!4946 e!9365))

(declare-fun res!13982 () Bool)

(assert (=> d!4946 (=> (not res!13982) (not e!9365))))

(declare-fun lt!22655 () tuple2!1720)

(assert (=> d!4946 (= res!13982 (isPrefixOf!0 (_1!921 lt!22655) (_2!921 lt!22655)))))

(declare-fun lt!22656 () BitStream!710)

(assert (=> d!4946 (= lt!22655 (tuple2!1721 lt!22656 (_2!922 lt!22528)))))

(declare-fun lt!22657 () Unit!1235)

(declare-fun lt!22666 () Unit!1235)

(assert (=> d!4946 (= lt!22657 lt!22666)))

(assert (=> d!4946 (isPrefixOf!0 lt!22656 (_2!922 lt!22528))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!710 BitStream!710 BitStream!710) Unit!1235)

(assert (=> d!4946 (= lt!22666 (lemmaIsPrefixTransitive!0 lt!22656 (_2!922 lt!22528) (_2!922 lt!22528)))))

(declare-fun lt!22669 () Unit!1235)

(declare-fun lt!22668 () Unit!1235)

(assert (=> d!4946 (= lt!22669 lt!22668)))

(assert (=> d!4946 (isPrefixOf!0 lt!22656 (_2!922 lt!22528))))

(assert (=> d!4946 (= lt!22668 (lemmaIsPrefixTransitive!0 lt!22656 thiss!1073 (_2!922 lt!22528)))))

(declare-fun lt!22663 () Unit!1235)

(declare-fun e!9366 () Unit!1235)

(assert (=> d!4946 (= lt!22663 e!9366)))

(declare-fun c!1033 () Bool)

(assert (=> d!4946 (= c!1033 (not (= (size!375 (buf!729 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!22653 () Unit!1235)

(declare-fun lt!22664 () Unit!1235)

(assert (=> d!4946 (= lt!22653 lt!22664)))

(assert (=> d!4946 (isPrefixOf!0 (_2!922 lt!22528) (_2!922 lt!22528))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!710) Unit!1235)

(assert (=> d!4946 (= lt!22664 (lemmaIsPrefixRefl!0 (_2!922 lt!22528)))))

(declare-fun lt!22659 () Unit!1235)

(declare-fun lt!22662 () Unit!1235)

(assert (=> d!4946 (= lt!22659 lt!22662)))

(assert (=> d!4946 (= lt!22662 (lemmaIsPrefixRefl!0 (_2!922 lt!22528)))))

(declare-fun lt!22654 () Unit!1235)

(declare-fun lt!22671 () Unit!1235)

(assert (=> d!4946 (= lt!22654 lt!22671)))

(assert (=> d!4946 (isPrefixOf!0 lt!22656 lt!22656)))

(assert (=> d!4946 (= lt!22671 (lemmaIsPrefixRefl!0 lt!22656))))

(declare-fun lt!22672 () Unit!1235)

(declare-fun lt!22661 () Unit!1235)

(assert (=> d!4946 (= lt!22672 lt!22661)))

(assert (=> d!4946 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!4946 (= lt!22661 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!4946 (= lt!22656 (BitStream!711 (buf!729 (_2!922 lt!22528)) (currentByte!1886 thiss!1073) (currentBit!1881 thiss!1073)))))

(assert (=> d!4946 (isPrefixOf!0 thiss!1073 (_2!922 lt!22528))))

(assert (=> d!4946 (= (reader!0 thiss!1073 (_2!922 lt!22528)) lt!22655)))

(declare-fun b!14974 () Bool)

(declare-fun res!13981 () Bool)

(assert (=> b!14974 (=> (not res!13981) (not e!9365))))

(assert (=> b!14974 (= res!13981 (isPrefixOf!0 (_2!921 lt!22655) (_2!922 lt!22528)))))

(declare-fun b!14975 () Bool)

(declare-fun lt!22658 () Unit!1235)

(assert (=> b!14975 (= e!9366 lt!22658)))

(declare-fun lt!22660 () (_ BitVec 64))

(assert (=> b!14975 (= lt!22660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22665 () (_ BitVec 64))

(assert (=> b!14975 (= lt!22665 (bitIndex!0 (size!375 (buf!729 thiss!1073)) (currentByte!1886 thiss!1073) (currentBit!1881 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!886 array!886 (_ BitVec 64) (_ BitVec 64)) Unit!1235)

(assert (=> b!14975 (= lt!22658 (arrayBitRangesEqSymmetric!0 (buf!729 thiss!1073) (buf!729 (_2!922 lt!22528)) lt!22660 lt!22665))))

(assert (=> b!14975 (arrayBitRangesEq!0 (buf!729 (_2!922 lt!22528)) (buf!729 thiss!1073) lt!22660 lt!22665)))

(declare-fun b!14976 () Bool)

(declare-fun Unit!1239 () Unit!1235)

(assert (=> b!14976 (= e!9366 Unit!1239)))

(declare-fun b!14977 () Bool)

(declare-fun lt!22670 () (_ BitVec 64))

(declare-fun lt!22667 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!710 (_ BitVec 64)) BitStream!710)

(assert (=> b!14977 (= e!9365 (= (_1!921 lt!22655) (withMovedBitIndex!0 (_2!921 lt!22655) (bvsub lt!22667 lt!22670))))))

(assert (=> b!14977 (or (= (bvand lt!22667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22670 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22667 lt!22670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14977 (= lt!22670 (bitIndex!0 (size!375 (buf!729 (_2!922 lt!22528))) (currentByte!1886 (_2!922 lt!22528)) (currentBit!1881 (_2!922 lt!22528))))))

(assert (=> b!14977 (= lt!22667 (bitIndex!0 (size!375 (buf!729 thiss!1073)) (currentByte!1886 thiss!1073) (currentBit!1881 thiss!1073)))))

(declare-fun b!14978 () Bool)

(declare-fun res!13980 () Bool)

(assert (=> b!14978 (=> (not res!13980) (not e!9365))))

(assert (=> b!14978 (= res!13980 (isPrefixOf!0 (_1!921 lt!22655) thiss!1073))))

(assert (= (and d!4946 c!1033) b!14975))

(assert (= (and d!4946 (not c!1033)) b!14976))

(assert (= (and d!4946 res!13982) b!14978))

(assert (= (and b!14978 res!13980) b!14974))

(assert (= (and b!14974 res!13981) b!14977))

(declare-fun m!21497 () Bool)

(assert (=> b!14978 m!21497))

(declare-fun m!21499 () Bool)

(assert (=> b!14974 m!21499))

(declare-fun m!21501 () Bool)

(assert (=> b!14977 m!21501))

(assert (=> b!14977 m!21431))

(assert (=> b!14977 m!21433))

(assert (=> b!14975 m!21433))

(declare-fun m!21503 () Bool)

(assert (=> b!14975 m!21503))

(declare-fun m!21505 () Bool)

(assert (=> b!14975 m!21505))

(declare-fun m!21507 () Bool)

(assert (=> d!4946 m!21507))

(declare-fun m!21509 () Bool)

(assert (=> d!4946 m!21509))

(declare-fun m!21511 () Bool)

(assert (=> d!4946 m!21511))

(declare-fun m!21513 () Bool)

(assert (=> d!4946 m!21513))

(declare-fun m!21515 () Bool)

(assert (=> d!4946 m!21515))

(declare-fun m!21517 () Bool)

(assert (=> d!4946 m!21517))

(declare-fun m!21519 () Bool)

(assert (=> d!4946 m!21519))

(declare-fun m!21521 () Bool)

(assert (=> d!4946 m!21521))

(assert (=> d!4946 m!21437))

(declare-fun m!21523 () Bool)

(assert (=> d!4946 m!21523))

(declare-fun m!21525 () Bool)

(assert (=> d!4946 m!21525))

(assert (=> b!14913 d!4946))

(declare-fun d!4968 () Bool)

(assert (=> d!4968 (= (invariant!0 (currentBit!1881 thiss!1073) (currentByte!1886 thiss!1073) (size!375 (buf!729 thiss!1073))) (and (bvsge (currentBit!1881 thiss!1073) #b00000000000000000000000000000000) (bvslt (currentBit!1881 thiss!1073) #b00000000000000000000000000001000) (bvsge (currentByte!1886 thiss!1073) #b00000000000000000000000000000000) (or (bvslt (currentByte!1886 thiss!1073) (size!375 (buf!729 thiss!1073))) (and (= (currentBit!1881 thiss!1073) #b00000000000000000000000000000000) (= (currentByte!1886 thiss!1073) (size!375 (buf!729 thiss!1073)))))))))

(assert (=> b!14917 d!4968))

(declare-fun b!15035 () Bool)

(declare-fun e!9396 () Bool)

(assert (=> b!15035 (= e!9396 (validate_offset_bits!1 ((_ sign_extend 32) (size!375 (buf!729 thiss!1073))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073)) nBits!313))))

(declare-fun d!4974 () Bool)

(declare-fun e!9395 () Bool)

(assert (=> d!4974 e!9395))

(declare-fun res!14030 () Bool)

(assert (=> d!4974 (=> (not res!14030) (not e!9395))))

(declare-fun lt!22800 () tuple2!1722)

(assert (=> d!4974 (= res!14030 (= (size!375 (buf!729 thiss!1073)) (size!375 (buf!729 (_2!922 lt!22800)))))))

(declare-fun choose!36 (BitStream!710 (_ BitVec 64) Bool) tuple2!1722)

(assert (=> d!4974 (= lt!22800 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!4974 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4974 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!22800)))

(declare-fun b!15033 () Bool)

(declare-fun res!14033 () Bool)

(assert (=> b!15033 (=> (not res!14033) (not e!9395))))

(assert (=> b!15033 (= res!14033 (isPrefixOf!0 thiss!1073 (_2!922 lt!22800)))))

(declare-fun b!15034 () Bool)

(declare-fun lt!22799 () tuple2!1718)

(declare-fun lt!22798 () tuple2!1720)

(assert (=> b!15034 (= e!9395 (and (_2!920 lt!22799) (= (_1!920 lt!22799) (_2!921 lt!22798))))))

(assert (=> b!15034 (= lt!22799 (checkBitsLoopPure!0 (_1!921 lt!22798) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!22797 () Unit!1235)

(declare-fun lt!22795 () Unit!1235)

(assert (=> b!15034 (= lt!22797 lt!22795)))

(assert (=> b!15034 (validate_offset_bits!1 ((_ sign_extend 32) (size!375 (buf!729 (_2!922 lt!22800)))) ((_ sign_extend 32) (currentByte!1886 thiss!1073)) ((_ sign_extend 32) (currentBit!1881 thiss!1073)) nBits!313)))

(assert (=> b!15034 (= lt!22795 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!729 (_2!922 lt!22800)) nBits!313))))

(assert (=> b!15034 e!9396))

(declare-fun res!14031 () Bool)

(assert (=> b!15034 (=> (not res!14031) (not e!9396))))

(assert (=> b!15034 (= res!14031 (and (= (size!375 (buf!729 thiss!1073)) (size!375 (buf!729 (_2!922 lt!22800)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15034 (= lt!22798 (reader!0 thiss!1073 (_2!922 lt!22800)))))

(declare-fun b!15032 () Bool)

(declare-fun res!14032 () Bool)

(assert (=> b!15032 (=> (not res!14032) (not e!9395))))

(declare-fun lt!22796 () (_ BitVec 64))

(assert (=> b!15032 (= res!14032 (= (bitIndex!0 (size!375 (buf!729 (_2!922 lt!22800))) (currentByte!1886 (_2!922 lt!22800)) (currentBit!1881 (_2!922 lt!22800))) (bvadd lt!22796 nBits!313)))))

(assert (=> b!15032 (or (not (= (bvand lt!22796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!22796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!22796 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15032 (= lt!22796 (bitIndex!0 (size!375 (buf!729 thiss!1073)) (currentByte!1886 thiss!1073) (currentBit!1881 thiss!1073)))))

(assert (= (and d!4974 res!14030) b!15032))

(assert (= (and b!15032 res!14032) b!15033))

(assert (= (and b!15033 res!14033) b!15034))

(assert (= (and b!15034 res!14031) b!15035))

(declare-fun m!21577 () Bool)

(assert (=> b!15032 m!21577))

(assert (=> b!15032 m!21433))

(assert (=> b!15035 m!21435))

(declare-fun m!21579 () Bool)

(assert (=> b!15034 m!21579))

(declare-fun m!21581 () Bool)

(assert (=> b!15034 m!21581))

(declare-fun m!21583 () Bool)

(assert (=> b!15034 m!21583))

(declare-fun m!21585 () Bool)

(assert (=> b!15034 m!21585))

(declare-fun m!21587 () Bool)

(assert (=> d!4974 m!21587))

(declare-fun m!21589 () Bool)

(assert (=> b!15033 m!21589))

(assert (=> b!14917 d!4974))

(push 1)

