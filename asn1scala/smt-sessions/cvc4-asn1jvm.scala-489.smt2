; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14362 () Bool)

(assert start!14362)

(declare-fun b!74525 () Bool)

(declare-fun res!61605 () Bool)

(declare-fun e!48777 () Bool)

(assert (=> b!74525 (=> (not res!61605) (not e!48777))))

(declare-datatypes ((array!3050 0))(
  ( (array!3051 (arr!2020 (Array (_ BitVec 32) (_ BitVec 8))) (size!1426 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2426 0))(
  ( (BitStream!2427 (buf!1807 array!3050) (currentByte!3551 (_ BitVec 32)) (currentBit!3546 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2426)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74525 (= res!61605 (validate_offset_bits!1 ((_ sign_extend 32) (size!1426 (buf!1807 thiss!1379))) ((_ sign_extend 32) (currentByte!3551 thiss!1379)) ((_ sign_extend 32) (currentBit!3546 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74526 () Bool)

(declare-fun res!61602 () Bool)

(declare-fun e!48782 () Bool)

(assert (=> b!74526 (=> res!61602 e!48782)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74526 (= res!61602 (not (invariant!0 (currentBit!3546 thiss!1379) (currentByte!3551 thiss!1379) (size!1426 (buf!1807 thiss!1379)))))))

(declare-fun srcBuffer!2 () array!3050)

(declare-fun e!48780 () Bool)

(declare-datatypes ((tuple2!6446 0))(
  ( (tuple2!6447 (_1!3337 array!3050) (_2!3337 BitStream!2426)) )
))
(declare-fun lt!119778 () tuple2!6446)

(declare-fun b!74527 () Bool)

(declare-fun checkByteArrayBitContent!0 (BitStream!2426 array!3050 array!3050 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74527 (= e!48780 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3337 lt!119778) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(declare-fun b!74528 () Bool)

(assert (=> b!74528 (= e!48777 (not e!48782))))

(declare-fun res!61603 () Bool)

(assert (=> b!74528 (=> res!61603 e!48782)))

(declare-fun lt!119779 () (_ BitVec 64))

(assert (=> b!74528 (= res!61603 (or (bvslt i!635 to!314) (not (= lt!119779 (bvsub (bvadd lt!119779 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2426 BitStream!2426) Bool)

(assert (=> b!74528 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4929 0))(
  ( (Unit!4930) )
))
(declare-fun lt!119777 () Unit!4929)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2426) Unit!4929)

(assert (=> b!74528 (= lt!119777 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74528 (= lt!119779 (bitIndex!0 (size!1426 (buf!1807 thiss!1379)) (currentByte!3551 thiss!1379) (currentBit!3546 thiss!1379)))))

(declare-fun res!61604 () Bool)

(assert (=> start!14362 (=> (not res!61604) (not e!48777))))

(assert (=> start!14362 (= res!61604 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1426 srcBuffer!2))))))))

(assert (=> start!14362 e!48777))

(assert (=> start!14362 true))

(declare-fun array_inv!1272 (array!3050) Bool)

(assert (=> start!14362 (array_inv!1272 srcBuffer!2)))

(declare-fun e!48779 () Bool)

(declare-fun inv!12 (BitStream!2426) Bool)

(assert (=> start!14362 (and (inv!12 thiss!1379) e!48779)))

(declare-fun b!74529 () Bool)

(assert (=> b!74529 (= e!48779 (array_inv!1272 (buf!1807 thiss!1379)))))

(declare-fun b!74530 () Bool)

(assert (=> b!74530 (= e!48782 e!48780)))

(declare-fun res!61601 () Bool)

(assert (=> b!74530 (=> res!61601 e!48780)))

(assert (=> b!74530 (= res!61601 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2426 (_ BitVec 64)) tuple2!6446)

(declare-datatypes ((tuple2!6448 0))(
  ( (tuple2!6449 (_1!3338 BitStream!2426) (_2!3338 BitStream!2426)) )
))
(declare-fun reader!0 (BitStream!2426 BitStream!2426) tuple2!6448)

(assert (=> b!74530 (= lt!119778 (readBits!0 (_1!3338 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14362 res!61604) b!74525))

(assert (= (and b!74525 res!61605) b!74528))

(assert (= (and b!74528 (not res!61603)) b!74526))

(assert (= (and b!74526 (not res!61602)) b!74530))

(assert (= (and b!74530 (not res!61601)) b!74527))

(assert (= start!14362 b!74529))

(declare-fun m!119523 () Bool)

(assert (=> b!74527 m!119523))

(declare-fun m!119525 () Bool)

(assert (=> start!14362 m!119525))

(declare-fun m!119527 () Bool)

(assert (=> start!14362 m!119527))

(declare-fun m!119529 () Bool)

(assert (=> b!74530 m!119529))

(declare-fun m!119531 () Bool)

(assert (=> b!74530 m!119531))

(declare-fun m!119533 () Bool)

(assert (=> b!74528 m!119533))

(declare-fun m!119535 () Bool)

(assert (=> b!74528 m!119535))

(declare-fun m!119537 () Bool)

(assert (=> b!74528 m!119537))

(declare-fun m!119539 () Bool)

(assert (=> b!74525 m!119539))

(declare-fun m!119541 () Bool)

(assert (=> b!74526 m!119541))

(declare-fun m!119543 () Bool)

(assert (=> b!74529 m!119543))

(push 1)

(assert (not start!14362))

(assert (not b!74529))

(assert (not b!74525))

(assert (not b!74526))

(assert (not b!74528))

(assert (not b!74527))

(assert (not b!74530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23664 () Bool)

(declare-fun res!61640 () Bool)

(declare-fun e!48808 () Bool)

(assert (=> d!23664 (=> res!61640 e!48808)))

(assert (=> d!23664 (= res!61640 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23664 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3337 lt!119778) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!48808)))

(declare-fun b!74565 () Bool)

(declare-fun e!48809 () Bool)

(assert (=> b!74565 (= e!48808 e!48809)))

(declare-fun res!61641 () Bool)

(assert (=> b!74565 (=> (not res!61641) (not e!48809))))

(assert (=> b!74565 (= res!61641 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2020 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2020 (_1!3337 lt!119778)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!74566 () Bool)

(assert (=> b!74566 (= e!48809 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3337 lt!119778) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23664 (not res!61640)) b!74565))

(assert (= (and b!74565 res!61641) b!74566))

(declare-fun m!119567 () Bool)

(assert (=> b!74565 m!119567))

(declare-fun m!119569 () Bool)

(assert (=> b!74565 m!119569))

(declare-fun m!119571 () Bool)

(assert (=> b!74565 m!119571))

(declare-fun m!119573 () Bool)

(assert (=> b!74565 m!119573))

(declare-fun m!119575 () Bool)

(assert (=> b!74566 m!119575))

(assert (=> b!74527 d!23664))

(declare-fun d!23676 () Bool)

(declare-fun res!61652 () Bool)

(declare-fun e!48816 () Bool)

(assert (=> d!23676 (=> (not res!61652) (not e!48816))))

(assert (=> d!23676 (= res!61652 (= (size!1426 (buf!1807 thiss!1379)) (size!1426 (buf!1807 thiss!1379))))))

(assert (=> d!23676 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48816)))

(declare-fun b!74577 () Bool)

(declare-fun res!61653 () Bool)

(assert (=> b!74577 (=> (not res!61653) (not e!48816))))

(assert (=> b!74577 (= res!61653 (bvsle (bitIndex!0 (size!1426 (buf!1807 thiss!1379)) (currentByte!3551 thiss!1379) (currentBit!3546 thiss!1379)) (bitIndex!0 (size!1426 (buf!1807 thiss!1379)) (currentByte!3551 thiss!1379) (currentBit!3546 thiss!1379))))))

(declare-fun b!74578 () Bool)

(declare-fun e!48817 () Bool)

(assert (=> b!74578 (= e!48816 e!48817)))

(declare-fun res!61654 () Bool)

(assert (=> b!74578 (=> res!61654 e!48817)))

(assert (=> b!74578 (= res!61654 (= (size!1426 (buf!1807 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74579 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3050 array!3050 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74579 (= e!48817 (arrayBitRangesEq!0 (buf!1807 thiss!1379) (buf!1807 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1426 (buf!1807 thiss!1379)) (currentByte!3551 thiss!1379) (currentBit!3546 thiss!1379))))))

(assert (= (and d!23676 res!61652) b!74577))

(assert (= (and b!74577 res!61653) b!74578))

(assert (= (and b!74578 (not res!61654)) b!74579))

(assert (=> b!74577 m!119537))

(assert (=> b!74577 m!119537))

(assert (=> b!74579 m!119537))

(assert (=> b!74579 m!119537))

(declare-fun m!119577 () Bool)

(assert (=> b!74579 m!119577))

(assert (=> b!74528 d!23676))

(declare-fun d!23678 () Bool)

(assert (=> d!23678 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119824 () Unit!4929)

(declare-fun choose!11 (BitStream!2426) Unit!4929)

(assert (=> d!23678 (= lt!119824 (choose!11 thiss!1379))))

(assert (=> d!23678 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119824)))

(declare-fun bs!5704 () Bool)

(assert (= bs!5704 d!23678))

(assert (=> bs!5704 m!119533))

(declare-fun m!119579 () Bool)

(assert (=> bs!5704 m!119579))

(assert (=> b!74528 d!23678))

(declare-fun d!23682 () Bool)

(declare-fun e!48821 () Bool)

(assert (=> d!23682 e!48821))

(declare-fun res!61661 () Bool)

(assert (=> d!23682 (=> (not res!61661) (not e!48821))))

(declare-fun lt!119840 () (_ BitVec 64))

(declare-fun lt!119839 () (_ BitVec 64))

(declare-fun lt!119837 () (_ BitVec 64))

(assert (=> d!23682 (= res!61661 (= lt!119839 (bvsub lt!119840 lt!119837)))))

(assert (=> d!23682 (or (= (bvand lt!119840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119837 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119840 lt!119837) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23682 (= lt!119837 (remainingBits!0 ((_ sign_extend 32) (size!1426 (buf!1807 thiss!1379))) ((_ sign_extend 32) (currentByte!3551 thiss!1379)) ((_ sign_extend 32) (currentBit!3546 thiss!1379))))))

(declare-fun lt!119841 () (_ BitVec 64))

(declare-fun lt!119842 () (_ BitVec 64))

(assert (=> d!23682 (= lt!119840 (bvmul lt!119841 lt!119842))))

(assert (=> d!23682 (or (= lt!119841 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119842 (bvsdiv (bvmul lt!119841 lt!119842) lt!119841)))))

(assert (=> d!23682 (= lt!119842 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23682 (= lt!119841 ((_ sign_extend 32) (size!1426 (buf!1807 thiss!1379))))))

(assert (=> d!23682 (= lt!119839 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3551 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3546 thiss!1379))))))

(assert (=> d!23682 (invariant!0 (currentBit!3546 thiss!1379) (currentByte!3551 thiss!1379) (size!1426 (buf!1807 thiss!1379)))))

(assert (=> d!23682 (= (bitIndex!0 (size!1426 (buf!1807 thiss!1379)) (currentByte!3551 thiss!1379) (currentBit!3546 thiss!1379)) lt!119839)))

(declare-fun b!74586 () Bool)

(declare-fun res!61662 () Bool)

(assert (=> b!74586 (=> (not res!61662) (not e!48821))))

(assert (=> b!74586 (= res!61662 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119839))))

(declare-fun b!74587 () Bool)

(declare-fun lt!119838 () (_ BitVec 64))

(assert (=> b!74587 (= e!48821 (bvsle lt!119839 (bvmul lt!119838 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74587 (or (= lt!119838 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119838 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119838)))))

(assert (=> b!74587 (= lt!119838 ((_ sign_extend 32) (size!1426 (buf!1807 thiss!1379))))))

(assert (= (and d!23682 res!61661) b!74586))

(assert (= (and b!74586 res!61662) b!74587))

(declare-fun m!119581 () Bool)

(assert (=> d!23682 m!119581))

(assert (=> d!23682 m!119541))

(assert (=> b!74528 d!23682))

(declare-fun d!23684 () Bool)

(assert (=> d!23684 (= (invariant!0 (currentBit!3546 thiss!1379) (currentByte!3551 thiss!1379) (size!1426 (buf!1807 thiss!1379))) (and (bvsge (currentBit!3546 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3546 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3551 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3551 thiss!1379) (size!1426 (buf!1807 thiss!1379))) (and (= (currentBit!3546 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3551 thiss!1379) (size!1426 (buf!1807 thiss!1379)))))))))

(assert (=> b!74526 d!23684))

(declare-fun d!23686 () Bool)

(declare-fun e!48830 () Bool)

(assert (=> d!23686 e!48830))

(declare-fun res!61705 () Bool)

(assert (=> d!23686 (=> (not res!61705) (not e!48830))))

(declare-fun lt!119921 () tuple2!6446)

(assert (=> d!23686 (= res!61705 (= (buf!1807 (_2!3337 lt!119921)) (buf!1807 (_1!3338 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!194 0))(
  ( (tuple3!195 (_1!3341 Unit!4929) (_2!3341 BitStream!2426) (_3!116 array!3050)) )
))
(declare-fun lt!119918 () tuple3!194)

(assert (=> d!23686 (= lt!119921 (tuple2!6447 (_3!116 lt!119918) (_2!3341 lt!119918)))))

(declare-fun readBitsLoop!0 (BitStream!2426 (_ BitVec 64) array!3050 (_ BitVec 64) (_ BitVec 64)) tuple3!194)

(assert (=> d!23686 (= lt!119918 (readBitsLoop!0 (_1!3338 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!3051 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23686 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23686 (= (readBits!0 (_1!3338 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!119921)))

(declare-fun b!74628 () Bool)

(declare-fun res!61707 () Bool)

(assert (=> b!74628 (=> (not res!61707) (not e!48830))))

(declare-fun lt!119922 () (_ BitVec 64))

(assert (=> b!74628 (= res!61707 (= (bvadd lt!119922 (bvsub to!314 i!635)) (bitIndex!0 (size!1426 (buf!1807 (_2!3337 lt!119921))) (currentByte!3551 (_2!3337 lt!119921)) (currentBit!3546 (_2!3337 lt!119921)))))))

(assert (=> b!74628 (or (not (= (bvand lt!119922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!119922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!119922 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74628 (= lt!119922 (bitIndex!0 (size!1426 (buf!1807 (_1!3338 (reader!0 thiss!1379 thiss!1379)))) (currentByte!3551 (_1!3338 (reader!0 thiss!1379 thiss!1379))) (currentBit!3546 (_1!3338 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun b!74629 () Bool)

(declare-fun res!61706 () Bool)

(assert (=> b!74629 (=> (not res!61706) (not e!48830))))

(assert (=> b!74629 (= res!61706 (bvsle (currentByte!3551 (_1!3338 (reader!0 thiss!1379 thiss!1379))) (currentByte!3551 (_2!3337 lt!119921))))))

(declare-fun b!74630 () Bool)

(declare-fun res!61703 () Bool)

(assert (=> b!74630 (=> (not res!61703) (not e!48830))))

(declare-fun lt!119923 () (_ BitVec 64))

(assert (=> b!74630 (= res!61703 (= (size!1426 (_1!3337 lt!119921)) ((_ extract 31 0) lt!119923)))))

(assert (=> b!74630 (and (bvslt lt!119923 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!119923 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!119919 () (_ BitVec 64))

(declare-fun lt!119917 () (_ BitVec 64))

(assert (=> b!74630 (= lt!119923 (bvsdiv lt!119919 lt!119917))))

(assert (=> b!74630 (and (not (= lt!119917 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!119919 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!119917 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!74630 (= lt!119917 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!119915 () (_ BitVec 64))

(declare-fun lt!119920 () (_ BitVec 64))

(assert (=> b!74630 (= lt!119919 (bvsub lt!119915 lt!119920))))

(assert (=> b!74630 (or (= (bvand lt!119915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119920 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119915 lt!119920) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74630 (= lt!119920 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!119916 () (_ BitVec 64))

(assert (=> b!74630 (= lt!119915 (bvadd (bvsub to!314 i!635) lt!119916))))

(assert (=> b!74630 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119916 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!119916) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74630 (= lt!119916 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!74631 () Bool)

(declare-fun res!61704 () Bool)

(assert (=> b!74631 (=> (not res!61704) (not e!48830))))

(assert (=> b!74631 (= res!61704 (invariant!0 (currentBit!3546 (_2!3337 lt!119921)) (currentByte!3551 (_2!3337 lt!119921)) (size!1426 (buf!1807 (_2!3337 lt!119921)))))))

(declare-fun b!74632 () Bool)

(declare-datatypes ((List!770 0))(
  ( (Nil!767) (Cons!766 (h!885 Bool) (t!1520 List!770)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2426 array!3050 (_ BitVec 64) (_ BitVec 64)) List!770)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2426 BitStream!2426 (_ BitVec 64)) List!770)

(assert (=> b!74632 (= e!48830 (= (byteArrayBitContentToList!0 (_2!3337 lt!119921) (_1!3337 lt!119921) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3337 lt!119921) (_1!3338 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(assert (= (and d!23686 res!61705) b!74628))

(assert (= (and b!74628 res!61707) b!74631))

(assert (= (and b!74631 res!61704) b!74630))

(assert (= (and b!74630 res!61703) b!74629))

(assert (= (and b!74629 res!61706) b!74632))

(declare-fun m!119607 () Bool)

(assert (=> d!23686 m!119607))

(declare-fun m!119609 () Bool)

(assert (=> b!74628 m!119609))

(declare-fun m!119611 () Bool)

(assert (=> b!74628 m!119611))

(declare-fun m!119613 () Bool)

(assert (=> b!74631 m!119613))

(declare-fun m!119615 () Bool)

(assert (=> b!74632 m!119615))

(declare-fun m!119617 () Bool)

(assert (=> b!74632 m!119617))

(assert (=> b!74530 d!23686))

(declare-fun b!74679 () Bool)

(declare-fun res!61739 () Bool)

(declare-fun e!48853 () Bool)

(assert (=> b!74679 (=> (not res!61739) (not e!48853))))

(declare-fun lt!120087 () tuple2!6448)

(assert (=> b!74679 (= res!61739 (isPrefixOf!0 (_1!3338 lt!120087) thiss!1379))))

(declare-fun lt!120098 () (_ BitVec 64))

(declare-fun b!74680 () Bool)

(declare-fun lt!120096 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2426 (_ BitVec 64)) BitStream!2426)

(assert (=> b!74680 (= e!48853 (= (_1!3338 lt!120087) (withMovedBitIndex!0 (_2!3338 lt!120087) (bvsub lt!120096 lt!120098))))))

(assert (=> b!74680 (or (= (bvand lt!120096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120098 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120096 lt!120098) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74680 (= lt!120098 (bitIndex!0 (size!1426 (buf!1807 thiss!1379)) (currentByte!3551 thiss!1379) (currentBit!3546 thiss!1379)))))

(assert (=> b!74680 (= lt!120096 (bitIndex!0 (size!1426 (buf!1807 thiss!1379)) (currentByte!3551 thiss!1379) (currentBit!3546 thiss!1379)))))

(declare-fun b!74681 () Bool)

(declare-fun res!61738 () Bool)

(assert (=> b!74681 (=> (not res!61738) (not e!48853))))

(assert (=> b!74681 (= res!61738 (isPrefixOf!0 (_2!3338 lt!120087) thiss!1379))))

(declare-fun b!74682 () Bool)

(declare-fun e!48854 () Unit!4929)

(declare-fun lt!120099 () Unit!4929)

(assert (=> b!74682 (= e!48854 lt!120099)))

(declare-fun lt!120086 () (_ BitVec 64))

(assert (=> b!74682 (= lt!120086 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120085 () (_ BitVec 64))

(assert (=> b!74682 (= lt!120085 (bitIndex!0 (size!1426 (buf!1807 thiss!1379)) (currentByte!3551 thiss!1379) (currentBit!3546 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3050 array!3050 (_ BitVec 64) (_ BitVec 64)) Unit!4929)

(assert (=> b!74682 (= lt!120099 (arrayBitRangesEqSymmetric!0 (buf!1807 thiss!1379) (buf!1807 thiss!1379) lt!120086 lt!120085))))

(assert (=> b!74682 (arrayBitRangesEq!0 (buf!1807 thiss!1379) (buf!1807 thiss!1379) lt!120086 lt!120085)))

(declare-fun b!74683 () Bool)

(declare-fun Unit!4933 () Unit!4929)

(assert (=> b!74683 (= e!48854 Unit!4933)))

(declare-fun d!23692 () Bool)

(assert (=> d!23692 e!48853))

(declare-fun res!61740 () Bool)

(assert (=> d!23692 (=> (not res!61740) (not e!48853))))

(assert (=> d!23692 (= res!61740 (isPrefixOf!0 (_1!3338 lt!120087) (_2!3338 lt!120087)))))

(declare-fun lt!120102 () BitStream!2426)

(assert (=> d!23692 (= lt!120087 (tuple2!6449 lt!120102 thiss!1379))))

(declare-fun lt!120090 () Unit!4929)

(declare-fun lt!120091 () Unit!4929)

(assert (=> d!23692 (= lt!120090 lt!120091)))

(assert (=> d!23692 (isPrefixOf!0 lt!120102 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2426 BitStream!2426 BitStream!2426) Unit!4929)

(assert (=> d!23692 (= lt!120091 (lemmaIsPrefixTransitive!0 lt!120102 thiss!1379 thiss!1379))))

(declare-fun lt!120095 () Unit!4929)

(declare-fun lt!120094 () Unit!4929)

(assert (=> d!23692 (= lt!120095 lt!120094)))

(assert (=> d!23692 (isPrefixOf!0 lt!120102 thiss!1379)))

(assert (=> d!23692 (= lt!120094 (lemmaIsPrefixTransitive!0 lt!120102 thiss!1379 thiss!1379))))

(declare-fun lt!120084 () Unit!4929)

(assert (=> d!23692 (= lt!120084 e!48854)))

(declare-fun c!5472 () Bool)

(assert (=> d!23692 (= c!5472 (not (= (size!1426 (buf!1807 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!120089 () Unit!4929)

(declare-fun lt!120092 () Unit!4929)

(assert (=> d!23692 (= lt!120089 lt!120092)))

(assert (=> d!23692 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23692 (= lt!120092 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120101 () Unit!4929)

(declare-fun lt!120103 () Unit!4929)

(assert (=> d!23692 (= lt!120101 lt!120103)))

(assert (=> d!23692 (= lt!120103 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120093 () Unit!4929)

(declare-fun lt!120097 () Unit!4929)

(assert (=> d!23692 (= lt!120093 lt!120097)))

(assert (=> d!23692 (isPrefixOf!0 lt!120102 lt!120102)))

(assert (=> d!23692 (= lt!120097 (lemmaIsPrefixRefl!0 lt!120102))))

(declare-fun lt!120088 () Unit!4929)

(declare-fun lt!120100 () Unit!4929)

(assert (=> d!23692 (= lt!120088 lt!120100)))

(assert (=> d!23692 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23692 (= lt!120100 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23692 (= lt!120102 (BitStream!2427 (buf!1807 thiss!1379) (currentByte!3551 thiss!1379) (currentBit!3546 thiss!1379)))))

(assert (=> d!23692 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23692 (= (reader!0 thiss!1379 thiss!1379) lt!120087)))

(assert (= (and d!23692 c!5472) b!74682))

(assert (= (and d!23692 (not c!5472)) b!74683))

(assert (= (and d!23692 res!61740) b!74679))

(assert (= (and b!74679 res!61739) b!74681))

(assert (= (and b!74681 res!61738) b!74680))

(assert (=> b!74682 m!119537))

(declare-fun m!119669 () Bool)

(assert (=> b!74682 m!119669))

(declare-fun m!119671 () Bool)

(assert (=> b!74682 m!119671))

(declare-fun m!119673 () Bool)

(assert (=> b!74679 m!119673))

(declare-fun m!119675 () Bool)

(assert (=> d!23692 m!119675))

(declare-fun m!119677 () Bool)

(assert (=> d!23692 m!119677))

(assert (=> d!23692 m!119675))

(assert (=> d!23692 m!119535))

(declare-fun m!119679 () Bool)

(assert (=> d!23692 m!119679))

(assert (=> d!23692 m!119533))

(declare-fun m!119681 () Bool)

(assert (=> d!23692 m!119681))

(declare-fun m!119683 () Bool)

(assert (=> d!23692 m!119683))

(assert (=> d!23692 m!119535))

(assert (=> d!23692 m!119533))

(assert (=> d!23692 m!119533))

(declare-fun m!119685 () Bool)

(assert (=> b!74681 m!119685))

(declare-fun m!119687 () Bool)

(assert (=> b!74680 m!119687))

(assert (=> b!74680 m!119537))

(assert (=> b!74680 m!119537))

(assert (=> b!74530 d!23692))

(declare-fun d!23710 () Bool)

(assert (=> d!23710 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1426 (buf!1807 thiss!1379))) ((_ sign_extend 32) (currentByte!3551 thiss!1379)) ((_ sign_extend 32) (currentBit!3546 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1426 (buf!1807 thiss!1379))) ((_ sign_extend 32) (currentByte!3551 thiss!1379)) ((_ sign_extend 32) (currentBit!3546 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5707 () Bool)

(assert (= bs!5707 d!23710))

(assert (=> bs!5707 m!119581))

(assert (=> b!74525 d!23710))

(declare-fun d!23712 () Bool)

(assert (=> d!23712 (= (array_inv!1272 srcBuffer!2) (bvsge (size!1426 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14362 d!23712))

(declare-fun d!23714 () Bool)

(assert (=> d!23714 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3546 thiss!1379) (currentByte!3551 thiss!1379) (size!1426 (buf!1807 thiss!1379))))))

(declare-fun bs!5708 () Bool)

(assert (= bs!5708 d!23714))

(assert (=> bs!5708 m!119541))

(assert (=> start!14362 d!23714))

(declare-fun d!23716 () Bool)

(assert (=> d!23716 (= (array_inv!1272 (buf!1807 thiss!1379)) (bvsge (size!1426 (buf!1807 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74529 d!23716))

