; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41840 () Bool)

(assert start!41840)

(declare-fun b!196868 () Bool)

(declare-fun e!135264 () Bool)

(declare-datatypes ((array!10088 0))(
  ( (array!10089 (arr!5377 (Array (_ BitVec 32) (_ BitVec 8))) (size!4447 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8002 0))(
  ( (BitStream!8003 (buf!4933 array!10088) (currentByte!9262 (_ BitVec 32)) (currentBit!9257 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8002)

(declare-fun array_inv!4188 (array!10088) Bool)

(assert (=> b!196868 (= e!135264 (array_inv!4188 (buf!4933 thiss!1204)))))

(declare-fun b!196869 () Bool)

(declare-fun e!135265 () Bool)

(declare-datatypes ((Unit!13926 0))(
  ( (Unit!13927) )
))
(declare-datatypes ((tuple2!17030 0))(
  ( (tuple2!17031 (_1!9160 Unit!13926) (_2!9160 BitStream!8002)) )
))
(declare-fun lt!306342 () tuple2!17030)

(declare-fun lt!306345 () tuple2!17030)

(declare-fun isPrefixOf!0 (BitStream!8002 BitStream!8002) Bool)

(assert (=> b!196869 (= e!135265 (isPrefixOf!0 (_2!9160 lt!306342) (_2!9160 lt!306345)))))

(declare-fun res!164745 () Bool)

(declare-fun e!135262 () Bool)

(assert (=> start!41840 (=> (not res!164745) (not e!135262))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41840 (= res!164745 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41840 e!135262))

(assert (=> start!41840 true))

(declare-fun inv!12 (BitStream!8002) Bool)

(assert (=> start!41840 (and (inv!12 thiss!1204) e!135264)))

(declare-fun b!196870 () Bool)

(declare-fun res!164740 () Bool)

(assert (=> b!196870 (=> (not res!164740) (not e!135262))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196870 (= res!164740 (invariant!0 (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204) (size!4447 (buf!4933 thiss!1204))))))

(declare-fun b!196871 () Bool)

(declare-fun res!164748 () Bool)

(assert (=> b!196871 (=> (not res!164748) (not e!135262))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196871 (= res!164748 (validate_offset_bits!1 ((_ sign_extend 32) (size!4447 (buf!4933 thiss!1204))) ((_ sign_extend 32) (currentByte!9262 thiss!1204)) ((_ sign_extend 32) (currentBit!9257 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196872 () Bool)

(declare-fun e!135261 () Bool)

(declare-fun e!135260 () Bool)

(assert (=> b!196872 (= e!135261 e!135260)))

(declare-fun res!164744 () Bool)

(assert (=> b!196872 (=> (not res!164744) (not e!135260))))

(declare-fun lt!306347 () Bool)

(declare-datatypes ((tuple2!17032 0))(
  ( (tuple2!17033 (_1!9161 BitStream!8002) (_2!9161 Bool)) )
))
(declare-fun lt!306349 () tuple2!17032)

(assert (=> b!196872 (= res!164744 (and (= (_2!9161 lt!306349) lt!306347) (= (_1!9161 lt!306349) (_2!9160 lt!306342))))))

(declare-fun readBitPure!0 (BitStream!8002) tuple2!17032)

(declare-fun readerFrom!0 (BitStream!8002 (_ BitVec 32) (_ BitVec 32)) BitStream!8002)

(assert (=> b!196872 (= lt!306349 (readBitPure!0 (readerFrom!0 (_2!9160 lt!306342) (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204))))))

(declare-fun b!196873 () Bool)

(declare-fun res!164750 () Bool)

(assert (=> b!196873 (=> res!164750 e!135265)))

(assert (=> b!196873 (= res!164750 (not (invariant!0 (currentBit!9257 (_2!9160 lt!306345)) (currentByte!9262 (_2!9160 lt!306345)) (size!4447 (buf!4933 (_2!9160 lt!306345))))))))

(declare-fun b!196874 () Bool)

(declare-fun res!164746 () Bool)

(assert (=> b!196874 (=> res!164746 e!135265)))

(declare-fun lt!306346 () (_ BitVec 64))

(declare-fun lt!306344 () (_ BitVec 64))

(assert (=> b!196874 (= res!164746 (or (not (= (size!4447 (buf!4933 (_2!9160 lt!306345))) (size!4447 (buf!4933 thiss!1204)))) (not (= lt!306344 (bvsub (bvadd lt!306346 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!196875 () Bool)

(declare-fun e!135263 () Bool)

(assert (=> b!196875 (= e!135263 e!135265)))

(declare-fun res!164747 () Bool)

(assert (=> b!196875 (=> res!164747 e!135265)))

(declare-fun lt!306340 () (_ BitVec 64))

(assert (=> b!196875 (= res!164747 (not (= lt!306344 (bvsub (bvsub (bvadd lt!306340 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196875 (= lt!306344 (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306345))) (currentByte!9262 (_2!9160 lt!306345)) (currentBit!9257 (_2!9160 lt!306345))))))

(assert (=> b!196875 (isPrefixOf!0 thiss!1204 (_2!9160 lt!306345))))

(declare-fun lt!306341 () Unit!13926)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8002 BitStream!8002 BitStream!8002) Unit!13926)

(assert (=> b!196875 (= lt!306341 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9160 lt!306342) (_2!9160 lt!306345)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8002 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17030)

(assert (=> b!196875 (= lt!306345 (appendBitsLSBFirstLoopTR!0 (_2!9160 lt!306342) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196876 () Bool)

(declare-fun lt!306348 () (_ BitVec 64))

(assert (=> b!196876 (= e!135260 (= (bitIndex!0 (size!4447 (buf!4933 (_1!9161 lt!306349))) (currentByte!9262 (_1!9161 lt!306349)) (currentBit!9257 (_1!9161 lt!306349))) lt!306348))))

(declare-fun b!196877 () Bool)

(declare-fun res!164743 () Bool)

(assert (=> b!196877 (=> (not res!164743) (not e!135261))))

(assert (=> b!196877 (= res!164743 (isPrefixOf!0 thiss!1204 (_2!9160 lt!306342)))))

(declare-fun b!196878 () Bool)

(declare-fun res!164751 () Bool)

(assert (=> b!196878 (=> (not res!164751) (not e!135262))))

(assert (=> b!196878 (= res!164751 (not (= i!590 nBits!348)))))

(declare-fun b!196879 () Bool)

(assert (=> b!196879 (= e!135262 (not e!135263))))

(declare-fun res!164749 () Bool)

(assert (=> b!196879 (=> res!164749 e!135263)))

(assert (=> b!196879 (= res!164749 (not (= lt!306340 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306346))))))

(assert (=> b!196879 (= lt!306340 (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))))))

(assert (=> b!196879 (= lt!306346 (bitIndex!0 (size!4447 (buf!4933 thiss!1204)) (currentByte!9262 thiss!1204) (currentBit!9257 thiss!1204)))))

(declare-fun e!135266 () Bool)

(assert (=> b!196879 e!135266))

(declare-fun res!164741 () Bool)

(assert (=> b!196879 (=> (not res!164741) (not e!135266))))

(assert (=> b!196879 (= res!164741 (= (size!4447 (buf!4933 thiss!1204)) (size!4447 (buf!4933 (_2!9160 lt!306342)))))))

(declare-fun appendBit!0 (BitStream!8002 Bool) tuple2!17030)

(assert (=> b!196879 (= lt!306342 (appendBit!0 thiss!1204 lt!306347))))

(assert (=> b!196879 (= lt!306347 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196880 () Bool)

(assert (=> b!196880 (= e!135266 e!135261)))

(declare-fun res!164742 () Bool)

(assert (=> b!196880 (=> (not res!164742) (not e!135261))))

(declare-fun lt!306343 () (_ BitVec 64))

(assert (=> b!196880 (= res!164742 (= lt!306348 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306343)))))

(assert (=> b!196880 (= lt!306348 (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))))))

(assert (=> b!196880 (= lt!306343 (bitIndex!0 (size!4447 (buf!4933 thiss!1204)) (currentByte!9262 thiss!1204) (currentBit!9257 thiss!1204)))))

(assert (= (and start!41840 res!164745) b!196871))

(assert (= (and b!196871 res!164748) b!196870))

(assert (= (and b!196870 res!164740) b!196878))

(assert (= (and b!196878 res!164751) b!196879))

(assert (= (and b!196879 res!164741) b!196880))

(assert (= (and b!196880 res!164742) b!196877))

(assert (= (and b!196877 res!164743) b!196872))

(assert (= (and b!196872 res!164744) b!196876))

(assert (= (and b!196879 (not res!164749)) b!196875))

(assert (= (and b!196875 (not res!164747)) b!196873))

(assert (= (and b!196873 (not res!164750)) b!196874))

(assert (= (and b!196874 (not res!164746)) b!196869))

(assert (= start!41840 b!196868))

(declare-fun m!304379 () Bool)

(assert (=> b!196872 m!304379))

(assert (=> b!196872 m!304379))

(declare-fun m!304381 () Bool)

(assert (=> b!196872 m!304381))

(declare-fun m!304383 () Bool)

(assert (=> b!196876 m!304383))

(declare-fun m!304385 () Bool)

(assert (=> b!196871 m!304385))

(declare-fun m!304387 () Bool)

(assert (=> b!196869 m!304387))

(declare-fun m!304389 () Bool)

(assert (=> start!41840 m!304389))

(declare-fun m!304391 () Bool)

(assert (=> b!196877 m!304391))

(declare-fun m!304393 () Bool)

(assert (=> b!196868 m!304393))

(declare-fun m!304395 () Bool)

(assert (=> b!196870 m!304395))

(declare-fun m!304397 () Bool)

(assert (=> b!196879 m!304397))

(declare-fun m!304399 () Bool)

(assert (=> b!196879 m!304399))

(declare-fun m!304401 () Bool)

(assert (=> b!196879 m!304401))

(declare-fun m!304403 () Bool)

(assert (=> b!196875 m!304403))

(declare-fun m!304405 () Bool)

(assert (=> b!196875 m!304405))

(declare-fun m!304407 () Bool)

(assert (=> b!196875 m!304407))

(declare-fun m!304409 () Bool)

(assert (=> b!196875 m!304409))

(declare-fun m!304411 () Bool)

(assert (=> b!196873 m!304411))

(assert (=> b!196880 m!304397))

(assert (=> b!196880 m!304399))

(push 1)

(assert (not b!196870))

(assert (not b!196873))

(assert (not b!196879))

(assert (not b!196877))

(assert (not b!196871))

(assert (not b!196880))

(assert (not b!196875))

(assert (not b!196876))

(assert (not b!196872))

(assert (not start!41840))

(assert (not b!196869))

(assert (not b!196868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66563 () Bool)

(assert (=> d!66563 (= (invariant!0 (currentBit!9257 (_2!9160 lt!306345)) (currentByte!9262 (_2!9160 lt!306345)) (size!4447 (buf!4933 (_2!9160 lt!306345)))) (and (bvsge (currentBit!9257 (_2!9160 lt!306345)) #b00000000000000000000000000000000) (bvslt (currentBit!9257 (_2!9160 lt!306345)) #b00000000000000000000000000001000) (bvsge (currentByte!9262 (_2!9160 lt!306345)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9262 (_2!9160 lt!306345)) (size!4447 (buf!4933 (_2!9160 lt!306345)))) (and (= (currentBit!9257 (_2!9160 lt!306345)) #b00000000000000000000000000000000) (= (currentByte!9262 (_2!9160 lt!306345)) (size!4447 (buf!4933 (_2!9160 lt!306345))))))))))

(assert (=> b!196873 d!66563))

(declare-fun d!66565 () Bool)

(declare-fun e!135333 () Bool)

(assert (=> d!66565 e!135333))

(declare-fun res!164853 () Bool)

(assert (=> d!66565 (=> (not res!164853) (not e!135333))))

(declare-fun lt!306448 () (_ BitVec 64))

(declare-fun lt!306451 () (_ BitVec 64))

(declare-fun lt!306447 () (_ BitVec 64))

(assert (=> d!66565 (= res!164853 (= lt!306451 (bvsub lt!306448 lt!306447)))))

(assert (=> d!66565 (or (= (bvand lt!306448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306447 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306448 lt!306447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66565 (= lt!306447 (remainingBits!0 ((_ sign_extend 32) (size!4447 (buf!4933 (_1!9161 lt!306349)))) ((_ sign_extend 32) (currentByte!9262 (_1!9161 lt!306349))) ((_ sign_extend 32) (currentBit!9257 (_1!9161 lt!306349)))))))

(declare-fun lt!306450 () (_ BitVec 64))

(declare-fun lt!306449 () (_ BitVec 64))

(assert (=> d!66565 (= lt!306448 (bvmul lt!306450 lt!306449))))

(assert (=> d!66565 (or (= lt!306450 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306449 (bvsdiv (bvmul lt!306450 lt!306449) lt!306450)))))

(assert (=> d!66565 (= lt!306449 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66565 (= lt!306450 ((_ sign_extend 32) (size!4447 (buf!4933 (_1!9161 lt!306349)))))))

(assert (=> d!66565 (= lt!306451 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9262 (_1!9161 lt!306349))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9257 (_1!9161 lt!306349)))))))

(assert (=> d!66565 (invariant!0 (currentBit!9257 (_1!9161 lt!306349)) (currentByte!9262 (_1!9161 lt!306349)) (size!4447 (buf!4933 (_1!9161 lt!306349))))))

(assert (=> d!66565 (= (bitIndex!0 (size!4447 (buf!4933 (_1!9161 lt!306349))) (currentByte!9262 (_1!9161 lt!306349)) (currentBit!9257 (_1!9161 lt!306349))) lt!306451)))

(declare-fun b!196987 () Bool)

(declare-fun res!164854 () Bool)

(assert (=> b!196987 (=> (not res!164854) (not e!135333))))

(assert (=> b!196987 (= res!164854 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306451))))

(declare-fun b!196988 () Bool)

(declare-fun lt!306446 () (_ BitVec 64))

(assert (=> b!196988 (= e!135333 (bvsle lt!306451 (bvmul lt!306446 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196988 (or (= lt!306446 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306446 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306446)))))

(assert (=> b!196988 (= lt!306446 ((_ sign_extend 32) (size!4447 (buf!4933 (_1!9161 lt!306349)))))))

(assert (= (and d!66565 res!164853) b!196987))

(assert (= (and b!196987 res!164854) b!196988))

(declare-fun m!304497 () Bool)

(assert (=> d!66565 m!304497))

(declare-fun m!304499 () Bool)

(assert (=> d!66565 m!304499))

(assert (=> b!196876 d!66565))

(declare-fun d!66569 () Bool)

(declare-fun e!135334 () Bool)

(assert (=> d!66569 e!135334))

(declare-fun res!164855 () Bool)

(assert (=> d!66569 (=> (not res!164855) (not e!135334))))

(declare-fun lt!306457 () (_ BitVec 64))

(declare-fun lt!306453 () (_ BitVec 64))

(declare-fun lt!306454 () (_ BitVec 64))

(assert (=> d!66569 (= res!164855 (= lt!306457 (bvsub lt!306454 lt!306453)))))

(assert (=> d!66569 (or (= (bvand lt!306454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306453 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306454 lt!306453) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66569 (= lt!306453 (remainingBits!0 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!306345)))) ((_ sign_extend 32) (currentByte!9262 (_2!9160 lt!306345))) ((_ sign_extend 32) (currentBit!9257 (_2!9160 lt!306345)))))))

(declare-fun lt!306456 () (_ BitVec 64))

(declare-fun lt!306455 () (_ BitVec 64))

(assert (=> d!66569 (= lt!306454 (bvmul lt!306456 lt!306455))))

(assert (=> d!66569 (or (= lt!306456 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306455 (bvsdiv (bvmul lt!306456 lt!306455) lt!306456)))))

(assert (=> d!66569 (= lt!306455 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66569 (= lt!306456 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!306345)))))))

(assert (=> d!66569 (= lt!306457 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9262 (_2!9160 lt!306345))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9257 (_2!9160 lt!306345)))))))

(assert (=> d!66569 (invariant!0 (currentBit!9257 (_2!9160 lt!306345)) (currentByte!9262 (_2!9160 lt!306345)) (size!4447 (buf!4933 (_2!9160 lt!306345))))))

(assert (=> d!66569 (= (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306345))) (currentByte!9262 (_2!9160 lt!306345)) (currentBit!9257 (_2!9160 lt!306345))) lt!306457)))

(declare-fun b!196989 () Bool)

(declare-fun res!164856 () Bool)

(assert (=> b!196989 (=> (not res!164856) (not e!135334))))

(assert (=> b!196989 (= res!164856 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306457))))

(declare-fun b!196990 () Bool)

(declare-fun lt!306452 () (_ BitVec 64))

(assert (=> b!196990 (= e!135334 (bvsle lt!306457 (bvmul lt!306452 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196990 (or (= lt!306452 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306452 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306452)))))

(assert (=> b!196990 (= lt!306452 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!306345)))))))

(assert (= (and d!66569 res!164855) b!196989))

(assert (= (and b!196989 res!164856) b!196990))

(declare-fun m!304501 () Bool)

(assert (=> d!66569 m!304501))

(assert (=> d!66569 m!304411))

(assert (=> b!196875 d!66569))

(declare-fun d!66571 () Bool)

(declare-fun res!164871 () Bool)

(declare-fun e!135343 () Bool)

(assert (=> d!66571 (=> (not res!164871) (not e!135343))))

(assert (=> d!66571 (= res!164871 (= (size!4447 (buf!4933 thiss!1204)) (size!4447 (buf!4933 (_2!9160 lt!306345)))))))

(assert (=> d!66571 (= (isPrefixOf!0 thiss!1204 (_2!9160 lt!306345)) e!135343)))

(declare-fun b!197003 () Bool)

(declare-fun res!164869 () Bool)

(assert (=> b!197003 (=> (not res!164869) (not e!135343))))

(assert (=> b!197003 (= res!164869 (bvsle (bitIndex!0 (size!4447 (buf!4933 thiss!1204)) (currentByte!9262 thiss!1204) (currentBit!9257 thiss!1204)) (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306345))) (currentByte!9262 (_2!9160 lt!306345)) (currentBit!9257 (_2!9160 lt!306345)))))))

(declare-fun b!197004 () Bool)

(declare-fun e!135342 () Bool)

(assert (=> b!197004 (= e!135343 e!135342)))

(declare-fun res!164870 () Bool)

(assert (=> b!197004 (=> res!164870 e!135342)))

(assert (=> b!197004 (= res!164870 (= (size!4447 (buf!4933 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197005 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10088 array!10088 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197005 (= e!135342 (arrayBitRangesEq!0 (buf!4933 thiss!1204) (buf!4933 (_2!9160 lt!306345)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4447 (buf!4933 thiss!1204)) (currentByte!9262 thiss!1204) (currentBit!9257 thiss!1204))))))

(assert (= (and d!66571 res!164871) b!197003))

(assert (= (and b!197003 res!164869) b!197004))

(assert (= (and b!197004 (not res!164870)) b!197005))

(assert (=> b!197003 m!304399))

(assert (=> b!197003 m!304403))

(assert (=> b!197005 m!304399))

(assert (=> b!197005 m!304399))

(declare-fun m!304505 () Bool)

(assert (=> b!197005 m!304505))

(assert (=> b!196875 d!66571))

(declare-fun d!66575 () Bool)

(assert (=> d!66575 (isPrefixOf!0 thiss!1204 (_2!9160 lt!306345))))

(declare-fun lt!306478 () Unit!13926)

(declare-fun choose!30 (BitStream!8002 BitStream!8002 BitStream!8002) Unit!13926)

(assert (=> d!66575 (= lt!306478 (choose!30 thiss!1204 (_2!9160 lt!306342) (_2!9160 lt!306345)))))

(assert (=> d!66575 (isPrefixOf!0 thiss!1204 (_2!9160 lt!306342))))

(assert (=> d!66575 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9160 lt!306342) (_2!9160 lt!306345)) lt!306478)))

(declare-fun bs!16532 () Bool)

(assert (= bs!16532 d!66575))

(assert (=> bs!16532 m!304405))

(declare-fun m!304509 () Bool)

(assert (=> bs!16532 m!304509))

(assert (=> bs!16532 m!304391))

(assert (=> b!196875 d!66575))

(declare-fun b!197190 () Bool)

(declare-fun e!135448 () Bool)

(declare-fun lt!307005 () tuple2!17032)

(declare-fun lt!307022 () tuple2!17030)

(assert (=> b!197190 (= e!135448 (= (bitIndex!0 (size!4447 (buf!4933 (_1!9161 lt!307005))) (currentByte!9262 (_1!9161 lt!307005)) (currentBit!9257 (_1!9161 lt!307005))) (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307022))) (currentByte!9262 (_2!9160 lt!307022)) (currentBit!9257 (_2!9160 lt!307022)))))))

(declare-fun b!197191 () Bool)

(declare-fun res!165025 () Bool)

(declare-fun call!3101 () Bool)

(assert (=> b!197191 (= res!165025 call!3101)))

(declare-fun e!135449 () Bool)

(assert (=> b!197191 (=> (not res!165025) (not e!135449))))

(declare-fun b!197192 () Bool)

(declare-fun res!165029 () Bool)

(declare-fun e!135455 () Bool)

(assert (=> b!197192 (=> (not res!165029) (not e!135455))))

(declare-fun lt!307041 () tuple2!17030)

(assert (=> b!197192 (= res!165029 (isPrefixOf!0 (_2!9160 lt!306342) (_2!9160 lt!307041)))))

(declare-fun b!197194 () Bool)

(declare-fun e!135454 () (_ BitVec 64))

(assert (=> b!197194 (= e!135454 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!197195 () Bool)

(declare-fun e!135453 () tuple2!17030)

(declare-fun Unit!13954 () Unit!13926)

(assert (=> b!197195 (= e!135453 (tuple2!17031 Unit!13954 (_2!9160 lt!306342)))))

(declare-fun lt!307019 () Unit!13926)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8002) Unit!13926)

(assert (=> b!197195 (= lt!307019 (lemmaIsPrefixRefl!0 (_2!9160 lt!306342)))))

(assert (=> b!197195 call!3101))

(declare-fun lt!307018 () Unit!13926)

(assert (=> b!197195 (= lt!307018 lt!307019)))

(declare-fun b!197196 () Bool)

(declare-fun e!135452 () Bool)

(declare-datatypes ((tuple2!17052 0))(
  ( (tuple2!17053 (_1!9171 BitStream!8002) (_2!9171 (_ BitVec 64))) )
))
(declare-fun lt!307028 () tuple2!17052)

(declare-datatypes ((tuple2!17054 0))(
  ( (tuple2!17055 (_1!9172 BitStream!8002) (_2!9172 BitStream!8002)) )
))
(declare-fun lt!307007 () tuple2!17054)

(assert (=> b!197196 (= e!135452 (= (_1!9171 lt!307028) (_2!9172 lt!307007)))))

(declare-fun b!197197 () Bool)

(assert (=> b!197197 (= e!135454 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!197198 () Bool)

(declare-fun res!165027 () Bool)

(assert (=> b!197198 (= res!165027 (= (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307022))) (currentByte!9262 (_2!9160 lt!307022)) (currentBit!9257 (_2!9160 lt!307022))) (bvadd (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!197198 (=> (not res!165027) (not e!135449))))

(declare-fun b!197199 () Bool)

(assert (=> b!197199 (= e!135455 e!135452)))

(declare-fun res!165030 () Bool)

(assert (=> b!197199 (=> (not res!165030) (not e!135452))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197199 (= res!165030 (= (_2!9171 lt!307028) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17052)

(assert (=> b!197199 (= lt!307028 (readNBitsLSBFirstsLoopPure!0 (_1!9172 lt!307007) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!307017 () Unit!13926)

(declare-fun lt!307036 () Unit!13926)

(assert (=> b!197199 (= lt!307017 lt!307036)))

(declare-fun lt!306993 () (_ BitVec 64))

(assert (=> b!197199 (validate_offset_bits!1 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!307041)))) ((_ sign_extend 32) (currentByte!9262 (_2!9160 lt!306342))) ((_ sign_extend 32) (currentBit!9257 (_2!9160 lt!306342))) lt!306993)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8002 array!10088 (_ BitVec 64)) Unit!13926)

(assert (=> b!197199 (= lt!307036 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9160 lt!306342) (buf!4933 (_2!9160 lt!307041)) lt!306993))))

(declare-fun e!135450 () Bool)

(assert (=> b!197199 e!135450))

(declare-fun res!165026 () Bool)

(assert (=> b!197199 (=> (not res!165026) (not e!135450))))

(assert (=> b!197199 (= res!165026 (and (= (size!4447 (buf!4933 (_2!9160 lt!306342))) (size!4447 (buf!4933 (_2!9160 lt!307041)))) (bvsge lt!306993 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197199 (= lt!306993 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!197199 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8002 BitStream!8002) tuple2!17054)

(assert (=> b!197199 (= lt!307007 (reader!0 (_2!9160 lt!306342) (_2!9160 lt!307041)))))

(declare-fun b!197200 () Bool)

(declare-fun res!165031 () Bool)

(assert (=> b!197200 (=> (not res!165031) (not e!135455))))

(declare-fun lt!307013 () (_ BitVec 64))

(declare-fun lt!306997 () (_ BitVec 64))

(assert (=> b!197200 (= res!165031 (= (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307041))) (currentByte!9262 (_2!9160 lt!307041)) (currentBit!9257 (_2!9160 lt!307041))) (bvsub lt!306997 lt!307013)))))

(assert (=> b!197200 (or (= (bvand lt!306997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306997 lt!307013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197200 (= lt!307013 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!307048 () (_ BitVec 64))

(declare-fun lt!307042 () (_ BitVec 64))

(assert (=> b!197200 (= lt!306997 (bvadd lt!307048 lt!307042))))

(assert (=> b!197200 (or (not (= (bvand lt!307048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307042 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!307048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!307048 lt!307042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197200 (= lt!307042 ((_ sign_extend 32) nBits!348))))

(assert (=> b!197200 (= lt!307048 (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))))))

(declare-fun b!197201 () Bool)

(assert (=> b!197201 (= lt!307005 (readBitPure!0 (readerFrom!0 (_2!9160 lt!307022) (currentBit!9257 (_2!9160 lt!306342)) (currentByte!9262 (_2!9160 lt!306342)))))))

(declare-fun res!165033 () Bool)

(declare-fun lt!307039 () Bool)

(assert (=> b!197201 (= res!165033 (and (= (_2!9161 lt!307005) lt!307039) (= (_1!9161 lt!307005) (_2!9160 lt!307022))))))

(assert (=> b!197201 (=> (not res!165033) (not e!135448))))

(assert (=> b!197201 (= e!135449 e!135448)))

(declare-fun b!197202 () Bool)

(declare-fun e!135451 () Bool)

(declare-fun lt!307032 () tuple2!17032)

(declare-fun lt!307024 () tuple2!17032)

(assert (=> b!197202 (= e!135451 (= (_2!9161 lt!307032) (_2!9161 lt!307024)))))

(declare-fun d!66579 () Bool)

(assert (=> d!66579 e!135455))

(declare-fun res!165024 () Bool)

(assert (=> d!66579 (=> (not res!165024) (not e!135455))))

(assert (=> d!66579 (= res!165024 (invariant!0 (currentBit!9257 (_2!9160 lt!307041)) (currentByte!9262 (_2!9160 lt!307041)) (size!4447 (buf!4933 (_2!9160 lt!307041)))))))

(assert (=> d!66579 (= lt!307041 e!135453)))

(declare-fun c!9811 () Bool)

(assert (=> d!66579 (= c!9811 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66579 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66579 (= (appendBitsLSBFirstLoopTR!0 (_2!9160 lt!306342) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!307041)))

(declare-fun b!197193 () Bool)

(declare-fun lt!307043 () tuple2!17030)

(assert (=> b!197193 (= e!135453 (tuple2!17031 (_1!9160 lt!307043) (_2!9160 lt!307043)))))

(assert (=> b!197193 (= lt!307039 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197193 (= lt!307022 (appendBit!0 (_2!9160 lt!306342) lt!307039))))

(declare-fun res!165032 () Bool)

(assert (=> b!197193 (= res!165032 (= (size!4447 (buf!4933 (_2!9160 lt!306342))) (size!4447 (buf!4933 (_2!9160 lt!307022)))))))

(assert (=> b!197193 (=> (not res!165032) (not e!135449))))

(assert (=> b!197193 e!135449))

(declare-fun lt!307027 () tuple2!17030)

(assert (=> b!197193 (= lt!307027 lt!307022)))

(assert (=> b!197193 (= lt!307043 (appendBitsLSBFirstLoopTR!0 (_2!9160 lt!307027) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!307047 () Unit!13926)

(assert (=> b!197193 (= lt!307047 (lemmaIsPrefixTransitive!0 (_2!9160 lt!306342) (_2!9160 lt!307027) (_2!9160 lt!307043)))))

(assert (=> b!197193 (isPrefixOf!0 (_2!9160 lt!306342) (_2!9160 lt!307043))))

(declare-fun lt!307014 () Unit!13926)

(assert (=> b!197193 (= lt!307014 lt!307047)))

(assert (=> b!197193 (invariant!0 (currentBit!9257 (_2!9160 lt!306342)) (currentByte!9262 (_2!9160 lt!306342)) (size!4447 (buf!4933 (_2!9160 lt!307027))))))

(declare-fun lt!307002 () BitStream!8002)

(assert (=> b!197193 (= lt!307002 (BitStream!8003 (buf!4933 (_2!9160 lt!307027)) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))))))

(assert (=> b!197193 (invariant!0 (currentBit!9257 lt!307002) (currentByte!9262 lt!307002) (size!4447 (buf!4933 (_2!9160 lt!307043))))))

(declare-fun lt!306995 () BitStream!8002)

(assert (=> b!197193 (= lt!306995 (BitStream!8003 (buf!4933 (_2!9160 lt!307043)) (currentByte!9262 lt!307002) (currentBit!9257 lt!307002)))))

(assert (=> b!197193 (= lt!307032 (readBitPure!0 lt!307002))))

(assert (=> b!197193 (= lt!307024 (readBitPure!0 lt!306995))))

(declare-fun lt!307025 () Unit!13926)

(declare-fun readBitPrefixLemma!0 (BitStream!8002 BitStream!8002) Unit!13926)

(assert (=> b!197193 (= lt!307025 (readBitPrefixLemma!0 lt!307002 (_2!9160 lt!307043)))))

(declare-fun res!165023 () Bool)

(assert (=> b!197193 (= res!165023 (= (bitIndex!0 (size!4447 (buf!4933 (_1!9161 lt!307032))) (currentByte!9262 (_1!9161 lt!307032)) (currentBit!9257 (_1!9161 lt!307032))) (bitIndex!0 (size!4447 (buf!4933 (_1!9161 lt!307024))) (currentByte!9262 (_1!9161 lt!307024)) (currentBit!9257 (_1!9161 lt!307024)))))))

(assert (=> b!197193 (=> (not res!165023) (not e!135451))))

(assert (=> b!197193 e!135451))

(declare-fun lt!307029 () Unit!13926)

(assert (=> b!197193 (= lt!307029 lt!307025)))

(declare-fun lt!307034 () tuple2!17054)

(assert (=> b!197193 (= lt!307034 (reader!0 (_2!9160 lt!306342) (_2!9160 lt!307043)))))

(declare-fun lt!307031 () tuple2!17054)

(assert (=> b!197193 (= lt!307031 (reader!0 (_2!9160 lt!307027) (_2!9160 lt!307043)))))

(declare-fun lt!306996 () tuple2!17032)

(assert (=> b!197193 (= lt!306996 (readBitPure!0 (_1!9172 lt!307034)))))

(assert (=> b!197193 (= (_2!9161 lt!306996) lt!307039)))

(declare-fun lt!306998 () Unit!13926)

(declare-fun Unit!13955 () Unit!13926)

(assert (=> b!197193 (= lt!306998 Unit!13955)))

(declare-fun lt!307015 () (_ BitVec 64))

(assert (=> b!197193 (= lt!307015 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!307000 () (_ BitVec 64))

(assert (=> b!197193 (= lt!307000 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!307021 () Unit!13926)

(assert (=> b!197193 (= lt!307021 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9160 lt!306342) (buf!4933 (_2!9160 lt!307043)) lt!307000))))

(assert (=> b!197193 (validate_offset_bits!1 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!307043)))) ((_ sign_extend 32) (currentByte!9262 (_2!9160 lt!306342))) ((_ sign_extend 32) (currentBit!9257 (_2!9160 lt!306342))) lt!307000)))

(declare-fun lt!307011 () Unit!13926)

(assert (=> b!197193 (= lt!307011 lt!307021)))

(declare-fun lt!307030 () tuple2!17052)

(assert (=> b!197193 (= lt!307030 (readNBitsLSBFirstsLoopPure!0 (_1!9172 lt!307034) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307015))))

(declare-fun lt!307004 () (_ BitVec 64))

(assert (=> b!197193 (= lt!307004 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!307045 () Unit!13926)

(assert (=> b!197193 (= lt!307045 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9160 lt!307027) (buf!4933 (_2!9160 lt!307043)) lt!307004))))

(assert (=> b!197193 (validate_offset_bits!1 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!307043)))) ((_ sign_extend 32) (currentByte!9262 (_2!9160 lt!307027))) ((_ sign_extend 32) (currentBit!9257 (_2!9160 lt!307027))) lt!307004)))

(declare-fun lt!307044 () Unit!13926)

(assert (=> b!197193 (= lt!307044 lt!307045)))

(declare-fun lt!307037 () tuple2!17052)

(assert (=> b!197193 (= lt!307037 (readNBitsLSBFirstsLoopPure!0 (_1!9172 lt!307031) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!307015 (ite (_2!9161 lt!306996) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!307038 () tuple2!17052)

(assert (=> b!197193 (= lt!307038 (readNBitsLSBFirstsLoopPure!0 (_1!9172 lt!307034) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307015))))

(declare-fun c!9810 () Bool)

(assert (=> b!197193 (= c!9810 (_2!9161 (readBitPure!0 (_1!9172 lt!307034))))))

(declare-fun lt!307023 () tuple2!17052)

(declare-fun withMovedBitIndex!0 (BitStream!8002 (_ BitVec 64)) BitStream!8002)

(assert (=> b!197193 (= lt!307023 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9172 lt!307034) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!307015 e!135454)))))

(declare-fun lt!307008 () Unit!13926)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13926)

(assert (=> b!197193 (= lt!307008 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9172 lt!307034) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307015))))

(assert (=> b!197193 (and (= (_2!9171 lt!307038) (_2!9171 lt!307023)) (= (_1!9171 lt!307038) (_1!9171 lt!307023)))))

(declare-fun lt!307012 () Unit!13926)

(assert (=> b!197193 (= lt!307012 lt!307008)))

(assert (=> b!197193 (= (_1!9172 lt!307034) (withMovedBitIndex!0 (_2!9172 lt!307034) (bvsub (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))) (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307043))) (currentByte!9262 (_2!9160 lt!307043)) (currentBit!9257 (_2!9160 lt!307043))))))))

(declare-fun lt!307003 () Unit!13926)

(declare-fun Unit!13956 () Unit!13926)

(assert (=> b!197193 (= lt!307003 Unit!13956)))

(assert (=> b!197193 (= (_1!9172 lt!307031) (withMovedBitIndex!0 (_2!9172 lt!307031) (bvsub (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307027))) (currentByte!9262 (_2!9160 lt!307027)) (currentBit!9257 (_2!9160 lt!307027))) (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307043))) (currentByte!9262 (_2!9160 lt!307043)) (currentBit!9257 (_2!9160 lt!307043))))))))

(declare-fun lt!307035 () Unit!13926)

(declare-fun Unit!13957 () Unit!13926)

(assert (=> b!197193 (= lt!307035 Unit!13957)))

(assert (=> b!197193 (= (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))) (bvsub (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307027))) (currentByte!9262 (_2!9160 lt!307027)) (currentBit!9257 (_2!9160 lt!307027))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!307026 () Unit!13926)

(declare-fun Unit!13958 () Unit!13926)

(assert (=> b!197193 (= lt!307026 Unit!13958)))

(assert (=> b!197193 (= (_2!9171 lt!307030) (_2!9171 lt!307037))))

(declare-fun lt!307016 () Unit!13926)

(declare-fun Unit!13959 () Unit!13926)

(assert (=> b!197193 (= lt!307016 Unit!13959)))

(assert (=> b!197193 (invariant!0 (currentBit!9257 (_2!9160 lt!307043)) (currentByte!9262 (_2!9160 lt!307043)) (size!4447 (buf!4933 (_2!9160 lt!307043))))))

(declare-fun lt!306994 () Unit!13926)

(declare-fun Unit!13960 () Unit!13926)

(assert (=> b!197193 (= lt!306994 Unit!13960)))

(assert (=> b!197193 (= (size!4447 (buf!4933 (_2!9160 lt!306342))) (size!4447 (buf!4933 (_2!9160 lt!307043))))))

(declare-fun lt!307020 () Unit!13926)

(declare-fun Unit!13961 () Unit!13926)

(assert (=> b!197193 (= lt!307020 Unit!13961)))

(assert (=> b!197193 (= (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307043))) (currentByte!9262 (_2!9160 lt!307043)) (currentBit!9257 (_2!9160 lt!307043))) (bvsub (bvadd (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!307006 () Unit!13926)

(declare-fun Unit!13962 () Unit!13926)

(assert (=> b!197193 (= lt!307006 Unit!13962)))

(declare-fun lt!306999 () Unit!13926)

(declare-fun Unit!13963 () Unit!13926)

(assert (=> b!197193 (= lt!306999 Unit!13963)))

(declare-fun lt!307001 () tuple2!17054)

(assert (=> b!197193 (= lt!307001 (reader!0 (_2!9160 lt!306342) (_2!9160 lt!307043)))))

(declare-fun lt!307040 () (_ BitVec 64))

(assert (=> b!197193 (= lt!307040 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!307033 () Unit!13926)

(assert (=> b!197193 (= lt!307033 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9160 lt!306342) (buf!4933 (_2!9160 lt!307043)) lt!307040))))

(assert (=> b!197193 (validate_offset_bits!1 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!307043)))) ((_ sign_extend 32) (currentByte!9262 (_2!9160 lt!306342))) ((_ sign_extend 32) (currentBit!9257 (_2!9160 lt!306342))) lt!307040)))

(declare-fun lt!307046 () Unit!13926)

(assert (=> b!197193 (= lt!307046 lt!307033)))

(declare-fun lt!307010 () tuple2!17052)

(assert (=> b!197193 (= lt!307010 (readNBitsLSBFirstsLoopPure!0 (_1!9172 lt!307001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!165034 () Bool)

(assert (=> b!197193 (= res!165034 (= (_2!9171 lt!307010) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!135447 () Bool)

(assert (=> b!197193 (=> (not res!165034) (not e!135447))))

(assert (=> b!197193 e!135447))

(declare-fun lt!307009 () Unit!13926)

(declare-fun Unit!13964 () Unit!13926)

(assert (=> b!197193 (= lt!307009 Unit!13964)))

(declare-fun b!197203 () Bool)

(assert (=> b!197203 (= e!135450 (validate_offset_bits!1 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!306342)))) ((_ sign_extend 32) (currentByte!9262 (_2!9160 lt!306342))) ((_ sign_extend 32) (currentBit!9257 (_2!9160 lt!306342))) lt!306993))))

(declare-fun bm!3098 () Bool)

(assert (=> bm!3098 (= call!3101 (isPrefixOf!0 (_2!9160 lt!306342) (ite c!9811 (_2!9160 lt!306342) (_2!9160 lt!307022))))))

(declare-fun b!197204 () Bool)

(declare-fun res!165028 () Bool)

(assert (=> b!197204 (=> (not res!165028) (not e!135455))))

(assert (=> b!197204 (= res!165028 (= (size!4447 (buf!4933 (_2!9160 lt!306342))) (size!4447 (buf!4933 (_2!9160 lt!307041)))))))

(declare-fun b!197205 () Bool)

(assert (=> b!197205 (= e!135447 (= (_1!9171 lt!307010) (_2!9172 lt!307001)))))

(assert (= (and d!66579 c!9811) b!197195))

(assert (= (and d!66579 (not c!9811)) b!197193))

(assert (= (and b!197193 res!165032) b!197198))

(assert (= (and b!197198 res!165027) b!197191))

(assert (= (and b!197191 res!165025) b!197201))

(assert (= (and b!197201 res!165033) b!197190))

(assert (= (and b!197193 res!165023) b!197202))

(assert (= (and b!197193 c!9810) b!197197))

(assert (= (and b!197193 (not c!9810)) b!197194))

(assert (= (and b!197193 res!165034) b!197205))

(assert (= (or b!197195 b!197191) bm!3098))

(assert (= (and d!66579 res!165024) b!197204))

(assert (= (and b!197204 res!165028) b!197200))

(assert (= (and b!197200 res!165031) b!197192))

(assert (= (and b!197192 res!165029) b!197199))

(assert (= (and b!197199 res!165026) b!197203))

(assert (= (and b!197199 res!165030) b!197196))

(declare-fun m!304755 () Bool)

(assert (=> b!197201 m!304755))

(assert (=> b!197201 m!304755))

(declare-fun m!304757 () Bool)

(assert (=> b!197201 m!304757))

(declare-fun m!304759 () Bool)

(assert (=> b!197198 m!304759))

(assert (=> b!197198 m!304397))

(declare-fun m!304761 () Bool)

(assert (=> b!197200 m!304761))

(assert (=> b!197200 m!304397))

(declare-fun m!304763 () Bool)

(assert (=> b!197193 m!304763))

(declare-fun m!304765 () Bool)

(assert (=> b!197193 m!304765))

(declare-fun m!304767 () Bool)

(assert (=> b!197193 m!304767))

(declare-fun m!304769 () Bool)

(assert (=> b!197193 m!304769))

(declare-fun m!304771 () Bool)

(assert (=> b!197193 m!304771))

(declare-fun m!304773 () Bool)

(assert (=> b!197193 m!304773))

(declare-fun m!304775 () Bool)

(assert (=> b!197193 m!304775))

(declare-fun m!304777 () Bool)

(assert (=> b!197193 m!304777))

(declare-fun m!304779 () Bool)

(assert (=> b!197193 m!304779))

(declare-fun m!304781 () Bool)

(assert (=> b!197193 m!304781))

(declare-fun m!304783 () Bool)

(assert (=> b!197193 m!304783))

(declare-fun m!304785 () Bool)

(assert (=> b!197193 m!304785))

(declare-fun m!304787 () Bool)

(assert (=> b!197193 m!304787))

(declare-fun m!304789 () Bool)

(assert (=> b!197193 m!304789))

(declare-fun m!304791 () Bool)

(assert (=> b!197193 m!304791))

(declare-fun m!304793 () Bool)

(assert (=> b!197193 m!304793))

(declare-fun m!304795 () Bool)

(assert (=> b!197193 m!304795))

(declare-fun m!304797 () Bool)

(assert (=> b!197193 m!304797))

(declare-fun m!304799 () Bool)

(assert (=> b!197193 m!304799))

(declare-fun m!304801 () Bool)

(assert (=> b!197193 m!304801))

(declare-fun m!304803 () Bool)

(assert (=> b!197193 m!304803))

(declare-fun m!304805 () Bool)

(assert (=> b!197193 m!304805))

(declare-fun m!304807 () Bool)

(assert (=> b!197193 m!304807))

(declare-fun m!304809 () Bool)

(assert (=> b!197193 m!304809))

(declare-fun m!304811 () Bool)

(assert (=> b!197193 m!304811))

(assert (=> b!197193 m!304397))

(declare-fun m!304813 () Bool)

(assert (=> b!197193 m!304813))

(declare-fun m!304815 () Bool)

(assert (=> b!197193 m!304815))

(declare-fun m!304817 () Bool)

(assert (=> b!197193 m!304817))

(declare-fun m!304819 () Bool)

(assert (=> b!197193 m!304819))

(declare-fun m!304821 () Bool)

(assert (=> b!197193 m!304821))

(declare-fun m!304823 () Bool)

(assert (=> b!197193 m!304823))

(declare-fun m!304825 () Bool)

(assert (=> b!197193 m!304825))

(assert (=> b!197193 m!304813))

(declare-fun m!304827 () Bool)

(assert (=> b!197193 m!304827))

(declare-fun m!304829 () Bool)

(assert (=> d!66579 m!304829))

(declare-fun m!304831 () Bool)

(assert (=> b!197199 m!304831))

(declare-fun m!304833 () Bool)

(assert (=> b!197199 m!304833))

(declare-fun m!304835 () Bool)

(assert (=> b!197199 m!304835))

(assert (=> b!197199 m!304783))

(declare-fun m!304837 () Bool)

(assert (=> b!197199 m!304837))

(assert (=> b!197199 m!304823))

(declare-fun m!304839 () Bool)

(assert (=> b!197195 m!304839))

(declare-fun m!304841 () Bool)

(assert (=> b!197203 m!304841))

(declare-fun m!304843 () Bool)

(assert (=> b!197190 m!304843))

(assert (=> b!197190 m!304759))

(declare-fun m!304845 () Bool)

(assert (=> bm!3098 m!304845))

(declare-fun m!304847 () Bool)

(assert (=> b!197192 m!304847))

(assert (=> b!196875 d!66579))

(declare-fun d!66625 () Bool)

(declare-fun res!165037 () Bool)

(declare-fun e!135457 () Bool)

(assert (=> d!66625 (=> (not res!165037) (not e!135457))))

(assert (=> d!66625 (= res!165037 (= (size!4447 (buf!4933 thiss!1204)) (size!4447 (buf!4933 (_2!9160 lt!306342)))))))

(assert (=> d!66625 (= (isPrefixOf!0 thiss!1204 (_2!9160 lt!306342)) e!135457)))

(declare-fun b!197206 () Bool)

(declare-fun res!165035 () Bool)

(assert (=> b!197206 (=> (not res!165035) (not e!135457))))

(assert (=> b!197206 (= res!165035 (bvsle (bitIndex!0 (size!4447 (buf!4933 thiss!1204)) (currentByte!9262 thiss!1204) (currentBit!9257 thiss!1204)) (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342)))))))

(declare-fun b!197207 () Bool)

(declare-fun e!135456 () Bool)

(assert (=> b!197207 (= e!135457 e!135456)))

(declare-fun res!165036 () Bool)

(assert (=> b!197207 (=> res!165036 e!135456)))

(assert (=> b!197207 (= res!165036 (= (size!4447 (buf!4933 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197208 () Bool)

(assert (=> b!197208 (= e!135456 (arrayBitRangesEq!0 (buf!4933 thiss!1204) (buf!4933 (_2!9160 lt!306342)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4447 (buf!4933 thiss!1204)) (currentByte!9262 thiss!1204) (currentBit!9257 thiss!1204))))))

(assert (= (and d!66625 res!165037) b!197206))

(assert (= (and b!197206 res!165035) b!197207))

(assert (= (and b!197207 (not res!165036)) b!197208))

(assert (=> b!197206 m!304399))

(assert (=> b!197206 m!304397))

(assert (=> b!197208 m!304399))

(assert (=> b!197208 m!304399))

(declare-fun m!304849 () Bool)

(assert (=> b!197208 m!304849))

(assert (=> b!196877 d!66625))

(declare-fun d!66627 () Bool)

(assert (=> d!66627 (= (array_inv!4188 (buf!4933 thiss!1204)) (bvsge (size!4447 (buf!4933 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!196868 d!66627))

(declare-fun d!66629 () Bool)

(declare-fun res!165040 () Bool)

(declare-fun e!135459 () Bool)

(assert (=> d!66629 (=> (not res!165040) (not e!135459))))

(assert (=> d!66629 (= res!165040 (= (size!4447 (buf!4933 (_2!9160 lt!306342))) (size!4447 (buf!4933 (_2!9160 lt!306345)))))))

(assert (=> d!66629 (= (isPrefixOf!0 (_2!9160 lt!306342) (_2!9160 lt!306345)) e!135459)))

(declare-fun b!197209 () Bool)

(declare-fun res!165038 () Bool)

(assert (=> b!197209 (=> (not res!165038) (not e!135459))))

(assert (=> b!197209 (= res!165038 (bvsle (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))) (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306345))) (currentByte!9262 (_2!9160 lt!306345)) (currentBit!9257 (_2!9160 lt!306345)))))))

(declare-fun b!197210 () Bool)

(declare-fun e!135458 () Bool)

(assert (=> b!197210 (= e!135459 e!135458)))

(declare-fun res!165039 () Bool)

(assert (=> b!197210 (=> res!165039 e!135458)))

(assert (=> b!197210 (= res!165039 (= (size!4447 (buf!4933 (_2!9160 lt!306342))) #b00000000000000000000000000000000))))

(declare-fun b!197211 () Bool)

(assert (=> b!197211 (= e!135458 (arrayBitRangesEq!0 (buf!4933 (_2!9160 lt!306342)) (buf!4933 (_2!9160 lt!306345)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342)))))))

(assert (= (and d!66629 res!165040) b!197209))

(assert (= (and b!197209 res!165038) b!197210))

(assert (= (and b!197210 (not res!165039)) b!197211))

(assert (=> b!197209 m!304397))

(assert (=> b!197209 m!304403))

(assert (=> b!197211 m!304397))

(assert (=> b!197211 m!304397))

(declare-fun m!304851 () Bool)

(assert (=> b!197211 m!304851))

(assert (=> b!196869 d!66629))

(declare-fun d!66631 () Bool)

(declare-fun e!135460 () Bool)

(assert (=> d!66631 e!135460))

(declare-fun res!165041 () Bool)

(assert (=> d!66631 (=> (not res!165041) (not e!135460))))

(declare-fun lt!307051 () (_ BitVec 64))

(declare-fun lt!307050 () (_ BitVec 64))

(declare-fun lt!307054 () (_ BitVec 64))

(assert (=> d!66631 (= res!165041 (= lt!307054 (bvsub lt!307051 lt!307050)))))

(assert (=> d!66631 (or (= (bvand lt!307051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307050 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307051 lt!307050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66631 (= lt!307050 (remainingBits!0 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!306342)))) ((_ sign_extend 32) (currentByte!9262 (_2!9160 lt!306342))) ((_ sign_extend 32) (currentBit!9257 (_2!9160 lt!306342)))))))

(declare-fun lt!307053 () (_ BitVec 64))

(declare-fun lt!307052 () (_ BitVec 64))

(assert (=> d!66631 (= lt!307051 (bvmul lt!307053 lt!307052))))

(assert (=> d!66631 (or (= lt!307053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307052 (bvsdiv (bvmul lt!307053 lt!307052) lt!307053)))))

(assert (=> d!66631 (= lt!307052 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66631 (= lt!307053 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!306342)))))))

(assert (=> d!66631 (= lt!307054 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9262 (_2!9160 lt!306342))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9257 (_2!9160 lt!306342)))))))

(assert (=> d!66631 (invariant!0 (currentBit!9257 (_2!9160 lt!306342)) (currentByte!9262 (_2!9160 lt!306342)) (size!4447 (buf!4933 (_2!9160 lt!306342))))))

(assert (=> d!66631 (= (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!306342))) (currentByte!9262 (_2!9160 lt!306342)) (currentBit!9257 (_2!9160 lt!306342))) lt!307054)))

(declare-fun b!197212 () Bool)

(declare-fun res!165042 () Bool)

(assert (=> b!197212 (=> (not res!165042) (not e!135460))))

(assert (=> b!197212 (= res!165042 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307054))))

(declare-fun b!197213 () Bool)

(declare-fun lt!307049 () (_ BitVec 64))

(assert (=> b!197213 (= e!135460 (bvsle lt!307054 (bvmul lt!307049 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197213 (or (= lt!307049 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307049 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307049)))))

(assert (=> b!197213 (= lt!307049 ((_ sign_extend 32) (size!4447 (buf!4933 (_2!9160 lt!306342)))))))

(assert (= (and d!66631 res!165041) b!197212))

(assert (= (and b!197212 res!165042) b!197213))

(declare-fun m!304853 () Bool)

(assert (=> d!66631 m!304853))

(declare-fun m!304855 () Bool)

(assert (=> d!66631 m!304855))

(assert (=> b!196880 d!66631))

(declare-fun d!66633 () Bool)

(declare-fun e!135461 () Bool)

(assert (=> d!66633 e!135461))

(declare-fun res!165043 () Bool)

(assert (=> d!66633 (=> (not res!165043) (not e!135461))))

(declare-fun lt!307060 () (_ BitVec 64))

(declare-fun lt!307057 () (_ BitVec 64))

(declare-fun lt!307056 () (_ BitVec 64))

(assert (=> d!66633 (= res!165043 (= lt!307060 (bvsub lt!307057 lt!307056)))))

(assert (=> d!66633 (or (= (bvand lt!307057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307056 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307057 lt!307056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66633 (= lt!307056 (remainingBits!0 ((_ sign_extend 32) (size!4447 (buf!4933 thiss!1204))) ((_ sign_extend 32) (currentByte!9262 thiss!1204)) ((_ sign_extend 32) (currentBit!9257 thiss!1204))))))

(declare-fun lt!307059 () (_ BitVec 64))

(declare-fun lt!307058 () (_ BitVec 64))

(assert (=> d!66633 (= lt!307057 (bvmul lt!307059 lt!307058))))

(assert (=> d!66633 (or (= lt!307059 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307058 (bvsdiv (bvmul lt!307059 lt!307058) lt!307059)))))

(assert (=> d!66633 (= lt!307058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66633 (= lt!307059 ((_ sign_extend 32) (size!4447 (buf!4933 thiss!1204))))))

(assert (=> d!66633 (= lt!307060 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9262 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9257 thiss!1204))))))

(assert (=> d!66633 (invariant!0 (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204) (size!4447 (buf!4933 thiss!1204)))))

(assert (=> d!66633 (= (bitIndex!0 (size!4447 (buf!4933 thiss!1204)) (currentByte!9262 thiss!1204) (currentBit!9257 thiss!1204)) lt!307060)))

(declare-fun b!197214 () Bool)

(declare-fun res!165044 () Bool)

(assert (=> b!197214 (=> (not res!165044) (not e!135461))))

(assert (=> b!197214 (= res!165044 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307060))))

(declare-fun b!197215 () Bool)

(declare-fun lt!307055 () (_ BitVec 64))

(assert (=> b!197215 (= e!135461 (bvsle lt!307060 (bvmul lt!307055 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197215 (or (= lt!307055 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307055 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307055)))))

(assert (=> b!197215 (= lt!307055 ((_ sign_extend 32) (size!4447 (buf!4933 thiss!1204))))))

(assert (= (and d!66633 res!165043) b!197214))

(assert (= (and b!197214 res!165044) b!197215))

(declare-fun m!304857 () Bool)

(assert (=> d!66633 m!304857))

(assert (=> d!66633 m!304395))

(assert (=> b!196880 d!66633))

(assert (=> b!196879 d!66631))

(assert (=> b!196879 d!66633))

(declare-fun b!197228 () Bool)

(declare-fun e!135467 () Bool)

(declare-fun lt!307070 () tuple2!17032)

(declare-fun lt!307072 () tuple2!17030)

(assert (=> b!197228 (= e!135467 (= (bitIndex!0 (size!4447 (buf!4933 (_1!9161 lt!307070))) (currentByte!9262 (_1!9161 lt!307070)) (currentBit!9257 (_1!9161 lt!307070))) (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307072))) (currentByte!9262 (_2!9160 lt!307072)) (currentBit!9257 (_2!9160 lt!307072)))))))

(declare-fun b!197227 () Bool)

(declare-fun e!135466 () Bool)

(assert (=> b!197227 (= e!135466 e!135467)))

(declare-fun res!165053 () Bool)

(assert (=> b!197227 (=> (not res!165053) (not e!135467))))

(assert (=> b!197227 (= res!165053 (and (= (_2!9161 lt!307070) lt!306347) (= (_1!9161 lt!307070) (_2!9160 lt!307072))))))

(assert (=> b!197227 (= lt!307070 (readBitPure!0 (readerFrom!0 (_2!9160 lt!307072) (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204))))))

(declare-fun b!197225 () Bool)

(declare-fun res!165056 () Bool)

(assert (=> b!197225 (=> (not res!165056) (not e!135466))))

(declare-fun lt!307071 () (_ BitVec 64))

(declare-fun lt!307069 () (_ BitVec 64))

(assert (=> b!197225 (= res!165056 (= (bitIndex!0 (size!4447 (buf!4933 (_2!9160 lt!307072))) (currentByte!9262 (_2!9160 lt!307072)) (currentBit!9257 (_2!9160 lt!307072))) (bvadd lt!307071 lt!307069)))))

(assert (=> b!197225 (or (not (= (bvand lt!307071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307069 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!307071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!307071 lt!307069) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197225 (= lt!307069 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!197225 (= lt!307071 (bitIndex!0 (size!4447 (buf!4933 thiss!1204)) (currentByte!9262 thiss!1204) (currentBit!9257 thiss!1204)))))

(declare-fun b!197226 () Bool)

(declare-fun res!165054 () Bool)

(assert (=> b!197226 (=> (not res!165054) (not e!135466))))

(assert (=> b!197226 (= res!165054 (isPrefixOf!0 thiss!1204 (_2!9160 lt!307072)))))

(declare-fun d!66635 () Bool)

(assert (=> d!66635 e!135466))

(declare-fun res!165055 () Bool)

(assert (=> d!66635 (=> (not res!165055) (not e!135466))))

(assert (=> d!66635 (= res!165055 (= (size!4447 (buf!4933 thiss!1204)) (size!4447 (buf!4933 (_2!9160 lt!307072)))))))

(declare-fun choose!16 (BitStream!8002 Bool) tuple2!17030)

(assert (=> d!66635 (= lt!307072 (choose!16 thiss!1204 lt!306347))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66635 (validate_offset_bit!0 ((_ sign_extend 32) (size!4447 (buf!4933 thiss!1204))) ((_ sign_extend 32) (currentByte!9262 thiss!1204)) ((_ sign_extend 32) (currentBit!9257 thiss!1204)))))

(assert (=> d!66635 (= (appendBit!0 thiss!1204 lt!306347) lt!307072)))

(assert (= (and d!66635 res!165055) b!197225))

(assert (= (and b!197225 res!165056) b!197226))

(assert (= (and b!197226 res!165054) b!197227))

(assert (= (and b!197227 res!165053) b!197228))

(declare-fun m!304859 () Bool)

(assert (=> b!197225 m!304859))

(assert (=> b!197225 m!304399))

(declare-fun m!304861 () Bool)

(assert (=> d!66635 m!304861))

(declare-fun m!304863 () Bool)

(assert (=> d!66635 m!304863))

(declare-fun m!304865 () Bool)

(assert (=> b!197227 m!304865))

(assert (=> b!197227 m!304865))

(declare-fun m!304867 () Bool)

(assert (=> b!197227 m!304867))

(declare-fun m!304869 () Bool)

(assert (=> b!197228 m!304869))

(assert (=> b!197228 m!304859))

(declare-fun m!304871 () Bool)

(assert (=> b!197226 m!304871))

(assert (=> b!196879 d!66635))

(declare-fun d!66637 () Bool)

(assert (=> d!66637 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204) (size!4447 (buf!4933 thiss!1204))))))

(declare-fun bs!16539 () Bool)

(assert (= bs!16539 d!66637))

(assert (=> bs!16539 m!304395))

(assert (=> start!41840 d!66637))

(declare-fun d!66639 () Bool)

(assert (=> d!66639 (= (invariant!0 (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204) (size!4447 (buf!4933 thiss!1204))) (and (bvsge (currentBit!9257 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9257 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9262 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9262 thiss!1204) (size!4447 (buf!4933 thiss!1204))) (and (= (currentBit!9257 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9262 thiss!1204) (size!4447 (buf!4933 thiss!1204)))))))))

(assert (=> b!196870 d!66639))

(declare-fun d!66641 () Bool)

(declare-datatypes ((tuple2!17058 0))(
  ( (tuple2!17059 (_1!9174 Bool) (_2!9174 BitStream!8002)) )
))
(declare-fun lt!307075 () tuple2!17058)

(declare-fun readBit!0 (BitStream!8002) tuple2!17058)

(assert (=> d!66641 (= lt!307075 (readBit!0 (readerFrom!0 (_2!9160 lt!306342) (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204))))))

(assert (=> d!66641 (= (readBitPure!0 (readerFrom!0 (_2!9160 lt!306342) (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204))) (tuple2!17033 (_2!9174 lt!307075) (_1!9174 lt!307075)))))

(declare-fun bs!16540 () Bool)

(assert (= bs!16540 d!66641))

(assert (=> bs!16540 m!304379))

(declare-fun m!304873 () Bool)

(assert (=> bs!16540 m!304873))

(assert (=> b!196872 d!66641))

(declare-fun d!66643 () Bool)

(declare-fun e!135470 () Bool)

(assert (=> d!66643 e!135470))

(declare-fun res!165060 () Bool)

(assert (=> d!66643 (=> (not res!165060) (not e!135470))))

(assert (=> d!66643 (= res!165060 (invariant!0 (currentBit!9257 (_2!9160 lt!306342)) (currentByte!9262 (_2!9160 lt!306342)) (size!4447 (buf!4933 (_2!9160 lt!306342)))))))

(assert (=> d!66643 (= (readerFrom!0 (_2!9160 lt!306342) (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204)) (BitStream!8003 (buf!4933 (_2!9160 lt!306342)) (currentByte!9262 thiss!1204) (currentBit!9257 thiss!1204)))))

(declare-fun b!197231 () Bool)

(assert (=> b!197231 (= e!135470 (invariant!0 (currentBit!9257 thiss!1204) (currentByte!9262 thiss!1204) (size!4447 (buf!4933 (_2!9160 lt!306342)))))))

(assert (= (and d!66643 res!165060) b!197231))

(assert (=> d!66643 m!304855))

(declare-fun m!304875 () Bool)

(assert (=> b!197231 m!304875))

(assert (=> b!196872 d!66643))

(declare-fun d!66645 () Bool)

(assert (=> d!66645 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4447 (buf!4933 thiss!1204))) ((_ sign_extend 32) (currentByte!9262 thiss!1204)) ((_ sign_extend 32) (currentBit!9257 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4447 (buf!4933 thiss!1204))) ((_ sign_extend 32) (currentByte!9262 thiss!1204)) ((_ sign_extend 32) (currentBit!9257 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16541 () Bool)

(assert (= bs!16541 d!66645))

(assert (=> bs!16541 m!304857))

(assert (=> b!196871 d!66645))

(push 1)

