; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8144 () Bool)

(assert start!8144)

(declare-fun res!34817 () Bool)

(declare-fun e!27009 () Bool)

(assert (=> start!8144 (=> (not res!34817) (not e!27009))))

(declare-datatypes ((array!2031 0))(
  ( (array!2032 (arr!1417 (Array (_ BitVec 32) (_ BitVec 8))) (size!918 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2031)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8144 (= res!34817 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!918 srcBuffer!2))))))))

(assert (=> start!8144 e!27009))

(assert (=> start!8144 true))

(declare-fun array_inv!843 (array!2031) Bool)

(assert (=> start!8144 (array_inv!843 srcBuffer!2)))

(declare-datatypes ((BitStream!1580 0))(
  ( (BitStream!1581 (buf!1246 array!2031) (currentByte!2671 (_ BitVec 32)) (currentBit!2666 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1580)

(declare-fun e!27010 () Bool)

(declare-fun inv!12 (BitStream!1580) Bool)

(assert (=> start!8144 (and (inv!12 thiss!1379) e!27010)))

(declare-fun b!40909 () Bool)

(assert (=> b!40909 (= e!27010 (array_inv!843 (buf!1246 thiss!1379)))))

(declare-fun b!40908 () Bool)

(declare-fun e!27011 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40908 (= e!27011 (invariant!0 (currentBit!2666 thiss!1379) (currentByte!2671 thiss!1379) (size!918 (buf!1246 thiss!1379))))))

(declare-fun b!40906 () Bool)

(declare-fun res!34816 () Bool)

(assert (=> b!40906 (=> (not res!34816) (not e!27009))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40906 (= res!34816 (validate_offset_bits!1 ((_ sign_extend 32) (size!918 (buf!1246 thiss!1379))) ((_ sign_extend 32) (currentByte!2671 thiss!1379)) ((_ sign_extend 32) (currentBit!2666 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40907 () Bool)

(assert (=> b!40907 (= e!27009 (not e!27011))))

(declare-fun res!34818 () Bool)

(assert (=> b!40907 (=> res!34818 e!27011)))

(assert (=> b!40907 (= res!34818 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1580 BitStream!1580) Bool)

(assert (=> b!40907 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2881 0))(
  ( (Unit!2882) )
))
(declare-fun lt!62086 () Unit!2881)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1580) Unit!2881)

(assert (=> b!40907 (= lt!62086 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62085 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40907 (= lt!62085 (bitIndex!0 (size!918 (buf!1246 thiss!1379)) (currentByte!2671 thiss!1379) (currentBit!2666 thiss!1379)))))

(assert (= (and start!8144 res!34817) b!40906))

(assert (= (and b!40906 res!34816) b!40907))

(assert (= (and b!40907 (not res!34818)) b!40908))

(assert (= start!8144 b!40909))

(declare-fun m!62553 () Bool)

(assert (=> b!40908 m!62553))

(declare-fun m!62555 () Bool)

(assert (=> b!40907 m!62555))

(declare-fun m!62557 () Bool)

(assert (=> b!40907 m!62557))

(declare-fun m!62559 () Bool)

(assert (=> b!40907 m!62559))

(declare-fun m!62561 () Bool)

(assert (=> start!8144 m!62561))

(declare-fun m!62563 () Bool)

(assert (=> start!8144 m!62563))

(declare-fun m!62565 () Bool)

(assert (=> b!40909 m!62565))

(declare-fun m!62567 () Bool)

(assert (=> b!40906 m!62567))

(push 1)

(assert (not start!8144))

(assert (not b!40909))

(assert (not b!40907))

(assert (not b!40908))

(assert (not b!40906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!11984 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11984 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!918 (buf!1246 thiss!1379))) ((_ sign_extend 32) (currentByte!2671 thiss!1379)) ((_ sign_extend 32) (currentBit!2666 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!918 (buf!1246 thiss!1379))) ((_ sign_extend 32) (currentByte!2671 thiss!1379)) ((_ sign_extend 32) (currentBit!2666 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3188 () Bool)

(assert (= bs!3188 d!11984))

(declare-fun m!62569 () Bool)

(assert (=> bs!3188 m!62569))

(assert (=> b!40906 d!11984))

(declare-fun d!11990 () Bool)

(declare-fun res!34835 () Bool)

(declare-fun e!27024 () Bool)

(assert (=> d!11990 (=> (not res!34835) (not e!27024))))

(assert (=> d!11990 (= res!34835 (= (size!918 (buf!1246 thiss!1379)) (size!918 (buf!1246 thiss!1379))))))

(assert (=> d!11990 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!27024)))

(declare-fun b!40925 () Bool)

(declare-fun res!34836 () Bool)

(assert (=> b!40925 (=> (not res!34836) (not e!27024))))

(assert (=> b!40925 (= res!34836 (bvsle (bitIndex!0 (size!918 (buf!1246 thiss!1379)) (currentByte!2671 thiss!1379) (currentBit!2666 thiss!1379)) (bitIndex!0 (size!918 (buf!1246 thiss!1379)) (currentByte!2671 thiss!1379) (currentBit!2666 thiss!1379))))))

(declare-fun b!40926 () Bool)

(declare-fun e!27025 () Bool)

(assert (=> b!40926 (= e!27024 e!27025)))

(declare-fun res!34834 () Bool)

(assert (=> b!40926 (=> res!34834 e!27025)))

(assert (=> b!40926 (= res!34834 (= (size!918 (buf!1246 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!40927 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2031 array!2031 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40927 (= e!27025 (arrayBitRangesEq!0 (buf!1246 thiss!1379) (buf!1246 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!918 (buf!1246 thiss!1379)) (currentByte!2671 thiss!1379) (currentBit!2666 thiss!1379))))))

(assert (= (and d!11990 res!34835) b!40925))

(assert (= (and b!40925 res!34836) b!40926))

(assert (= (and b!40926 (not res!34834)) b!40927))

(assert (=> b!40925 m!62559))

(assert (=> b!40925 m!62559))

(assert (=> b!40927 m!62559))

(assert (=> b!40927 m!62559))

(declare-fun m!62575 () Bool)

(assert (=> b!40927 m!62575))

(assert (=> b!40907 d!11990))

(declare-fun d!11996 () Bool)

(assert (=> d!11996 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62092 () Unit!2881)

(declare-fun choose!11 (BitStream!1580) Unit!2881)

(assert (=> d!11996 (= lt!62092 (choose!11 thiss!1379))))

(assert (=> d!11996 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62092)))

(declare-fun bs!3192 () Bool)

(assert (= bs!3192 d!11996))

(assert (=> bs!3192 m!62555))

(declare-fun m!62577 () Bool)

(assert (=> bs!3192 m!62577))

(assert (=> b!40907 d!11996))

(declare-fun d!11998 () Bool)

(declare-fun e!27037 () Bool)

(assert (=> d!11998 e!27037))

(declare-fun res!34856 () Bool)

(assert (=> d!11998 (=> (not res!34856) (not e!27037))))

(declare-fun lt!62127 () (_ BitVec 64))

(declare-fun lt!62131 () (_ BitVec 64))

(declare-fun lt!62128 () (_ BitVec 64))

(assert (=> d!11998 (= res!34856 (= lt!62128 (bvsub lt!62131 lt!62127)))))

(assert (=> d!11998 (or (= (bvand lt!62131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62127 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62131 lt!62127) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11998 (= lt!62127 (remainingBits!0 ((_ sign_extend 32) (size!918 (buf!1246 thiss!1379))) ((_ sign_extend 32) (currentByte!2671 thiss!1379)) ((_ sign_extend 32) (currentBit!2666 thiss!1379))))))

(declare-fun lt!62126 () (_ BitVec 64))

(declare-fun lt!62130 () (_ BitVec 64))

(assert (=> d!11998 (= lt!62131 (bvmul lt!62126 lt!62130))))

(assert (=> d!11998 (or (= lt!62126 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62130 (bvsdiv (bvmul lt!62126 lt!62130) lt!62126)))))

(assert (=> d!11998 (= lt!62130 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11998 (= lt!62126 ((_ sign_extend 32) (size!918 (buf!1246 thiss!1379))))))

(assert (=> d!11998 (= lt!62128 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2671 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2666 thiss!1379))))))

(assert (=> d!11998 (invariant!0 (currentBit!2666 thiss!1379) (currentByte!2671 thiss!1379) (size!918 (buf!1246 thiss!1379)))))

(assert (=> d!11998 (= (bitIndex!0 (size!918 (buf!1246 thiss!1379)) (currentByte!2671 thiss!1379) (currentBit!2666 thiss!1379)) lt!62128)))

(declare-fun b!40947 () Bool)

(declare-fun res!34857 () Bool)

(assert (=> b!40947 (=> (not res!34857) (not e!27037))))

(assert (=> b!40947 (= res!34857 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62128))))

(declare-fun b!40948 () Bool)

