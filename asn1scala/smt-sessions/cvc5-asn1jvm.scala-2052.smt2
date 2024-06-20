; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52294 () Bool)

(assert start!52294)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun lt!376096 () (_ BitVec 64))

(declare-fun lt!376097 () (_ BitVec 64))

(declare-fun e!166852 () Bool)

(declare-fun b!240753 () Bool)

(assert (=> b!240753 (= e!166852 (not (or (not (= lt!376097 (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!376097 (bvand (bvadd lt!376096 nBits!288) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!240753 (= lt!376097 (bvand lt!376096 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!13174 0))(
  ( (array!13175 (arr!6757 (Array (_ BitVec 32) (_ BitVec 8))) (size!5770 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10462 0))(
  ( (BitStream!10463 (buf!6233 array!13174) (currentByte!11590 (_ BitVec 32)) (currentBit!11585 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10462)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240753 (= lt!376096 (bitIndex!0 (size!5770 (buf!6233 thiss!982)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982)))))

(declare-fun e!166851 () Bool)

(assert (=> b!240753 e!166851))

(declare-fun res!200982 () Bool)

(assert (=> b!240753 (=> (not res!200982) (not e!166851))))

(declare-datatypes ((Unit!17638 0))(
  ( (Unit!17639) )
))
(declare-datatypes ((tuple2!20460 0))(
  ( (tuple2!20461 (_1!11152 Unit!17638) (_2!11152 BitStream!10462)) )
))
(declare-fun lt!376095 () tuple2!20460)

(assert (=> b!240753 (= res!200982 (= (size!5770 (buf!6233 thiss!982)) (size!5770 (buf!6233 (_2!11152 lt!376095)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10462 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20460)

(assert (=> b!240753 (= lt!376095 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240754 () Bool)

(declare-datatypes ((tuple2!20462 0))(
  ( (tuple2!20463 (_1!11153 BitStream!10462) (_2!11153 Bool)) )
))
(declare-fun lt!376098 () tuple2!20462)

(declare-datatypes ((tuple2!20464 0))(
  ( (tuple2!20465 (_1!11154 BitStream!10462) (_2!11154 BitStream!10462)) )
))
(declare-fun lt!376094 () tuple2!20464)

(assert (=> b!240754 (= e!166851 (not (or (not (_2!11153 lt!376098)) (not (= (_1!11153 lt!376098) (_2!11154 lt!376094))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10462 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20462)

(assert (=> b!240754 (= lt!376098 (checkBitsLoopPure!0 (_1!11154 lt!376094) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240754 (validate_offset_bits!1 ((_ sign_extend 32) (size!5770 (buf!6233 (_2!11152 lt!376095)))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982)) nBits!288)))

(declare-fun lt!376093 () Unit!17638)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10462 array!13174 (_ BitVec 64)) Unit!17638)

(assert (=> b!240754 (= lt!376093 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6233 (_2!11152 lt!376095)) nBits!288))))

(declare-fun reader!0 (BitStream!10462 BitStream!10462) tuple2!20464)

(assert (=> b!240754 (= lt!376094 (reader!0 thiss!982 (_2!11152 lt!376095)))))

(declare-fun res!200981 () Bool)

(assert (=> start!52294 (=> (not res!200981) (not e!166852))))

(assert (=> start!52294 (= res!200981 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52294 e!166852))

(assert (=> start!52294 true))

(declare-fun e!166850 () Bool)

(declare-fun inv!12 (BitStream!10462) Bool)

(assert (=> start!52294 (and (inv!12 thiss!982) e!166850)))

(declare-fun b!240755 () Bool)

(declare-fun res!200983 () Bool)

(assert (=> b!240755 (=> (not res!200983) (not e!166851))))

(declare-fun isPrefixOf!0 (BitStream!10462 BitStream!10462) Bool)

(assert (=> b!240755 (= res!200983 (isPrefixOf!0 thiss!982 (_2!11152 lt!376095)))))

(declare-fun b!240756 () Bool)

(declare-fun array_inv!5511 (array!13174) Bool)

(assert (=> b!240756 (= e!166850 (array_inv!5511 (buf!6233 thiss!982)))))

(declare-fun b!240757 () Bool)

(declare-fun res!200985 () Bool)

(assert (=> b!240757 (=> (not res!200985) (not e!166852))))

(assert (=> b!240757 (= res!200985 (validate_offset_bits!1 ((_ sign_extend 32) (size!5770 (buf!6233 thiss!982))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982)) nBits!288))))

(declare-fun b!240758 () Bool)

(declare-fun res!200984 () Bool)

(assert (=> b!240758 (=> (not res!200984) (not e!166851))))

(assert (=> b!240758 (= res!200984 (= (bitIndex!0 (size!5770 (buf!6233 (_2!11152 lt!376095))) (currentByte!11590 (_2!11152 lt!376095)) (currentBit!11585 (_2!11152 lt!376095))) (bvadd (bitIndex!0 (size!5770 (buf!6233 thiss!982)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982)) nBits!288)))))

(assert (= (and start!52294 res!200981) b!240757))

(assert (= (and b!240757 res!200985) b!240753))

(assert (= (and b!240753 res!200982) b!240758))

(assert (= (and b!240758 res!200984) b!240755))

(assert (= (and b!240755 res!200983) b!240754))

(assert (= start!52294 b!240756))

(declare-fun m!363339 () Bool)

(assert (=> b!240754 m!363339))

(declare-fun m!363341 () Bool)

(assert (=> b!240754 m!363341))

(declare-fun m!363343 () Bool)

(assert (=> b!240754 m!363343))

(declare-fun m!363345 () Bool)

(assert (=> b!240754 m!363345))

(declare-fun m!363347 () Bool)

(assert (=> b!240758 m!363347))

(declare-fun m!363349 () Bool)

(assert (=> b!240758 m!363349))

(declare-fun m!363351 () Bool)

(assert (=> b!240755 m!363351))

(declare-fun m!363353 () Bool)

(assert (=> b!240757 m!363353))

(declare-fun m!363355 () Bool)

(assert (=> b!240756 m!363355))

(declare-fun m!363357 () Bool)

(assert (=> start!52294 m!363357))

(assert (=> b!240753 m!363349))

(declare-fun m!363359 () Bool)

(assert (=> b!240753 m!363359))

(push 1)

(assert (not b!240755))

(assert (not b!240756))

(assert (not start!52294))

(assert (not b!240754))

(assert (not b!240758))

(assert (not b!240757))

(assert (not b!240753))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81390 () Bool)

(declare-fun e!166880 () Bool)

(assert (=> d!81390 e!166880))

(declare-fun res!201021 () Bool)

(assert (=> d!81390 (=> (not res!201021) (not e!166880))))

(declare-fun lt!376151 () (_ BitVec 64))

(declare-fun lt!376149 () (_ BitVec 64))

(declare-fun lt!376150 () (_ BitVec 64))

(assert (=> d!81390 (= res!201021 (= lt!376149 (bvsub lt!376150 lt!376151)))))

(assert (=> d!81390 (or (= (bvand lt!376150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376151 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376150 lt!376151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81390 (= lt!376151 (remainingBits!0 ((_ sign_extend 32) (size!5770 (buf!6233 thiss!982))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982))))))

(declare-fun lt!376148 () (_ BitVec 64))

(declare-fun lt!376147 () (_ BitVec 64))

(assert (=> d!81390 (= lt!376150 (bvmul lt!376148 lt!376147))))

(assert (=> d!81390 (or (= lt!376148 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!376147 (bvsdiv (bvmul lt!376148 lt!376147) lt!376148)))))

(assert (=> d!81390 (= lt!376147 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81390 (= lt!376148 ((_ sign_extend 32) (size!5770 (buf!6233 thiss!982))))))

(assert (=> d!81390 (= lt!376149 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11590 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11585 thiss!982))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81390 (invariant!0 (currentBit!11585 thiss!982) (currentByte!11590 thiss!982) (size!5770 (buf!6233 thiss!982)))))

(assert (=> d!81390 (= (bitIndex!0 (size!5770 (buf!6233 thiss!982)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982)) lt!376149)))

(declare-fun b!240799 () Bool)

(declare-fun res!201020 () Bool)

(assert (=> b!240799 (=> (not res!201020) (not e!166880))))

(assert (=> b!240799 (= res!201020 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!376149))))

(declare-fun b!240800 () Bool)

(declare-fun lt!376152 () (_ BitVec 64))

(assert (=> b!240800 (= e!166880 (bvsle lt!376149 (bvmul lt!376152 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240800 (or (= lt!376152 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!376152 #b0000000000000000000000000000000000000000000000000000000000001000) lt!376152)))))

(assert (=> b!240800 (= lt!376152 ((_ sign_extend 32) (size!5770 (buf!6233 thiss!982))))))

(assert (= (and d!81390 res!201021) b!240799))

(assert (= (and b!240799 res!201020) b!240800))

(declare-fun m!363405 () Bool)

(assert (=> d!81390 m!363405))

(declare-fun m!363407 () Bool)

(assert (=> d!81390 m!363407))

(assert (=> b!240753 d!81390))

(declare-fun b!240833 () Bool)

(declare-fun e!166895 () Bool)

(declare-fun lt!376260 () (_ BitVec 64))

(assert (=> b!240833 (= e!166895 (validate_offset_bits!1 ((_ sign_extend 32) (size!5770 (buf!6233 thiss!982))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982)) lt!376260))))

(declare-fun d!81396 () Bool)

(declare-fun e!166894 () Bool)

(assert (=> d!81396 e!166894))

(declare-fun res!201046 () Bool)

(assert (=> d!81396 (=> (not res!201046) (not e!166894))))

(declare-fun lt!376257 () tuple2!20460)

(assert (=> d!81396 (= res!201046 (= (size!5770 (buf!6233 thiss!982)) (size!5770 (buf!6233 (_2!11152 lt!376257)))))))

(declare-fun choose!51 (BitStream!10462 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20460)

(assert (=> d!81396 (= lt!376257 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81396 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81396 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376257)))

(declare-fun b!240830 () Bool)

(declare-fun res!201045 () Bool)

(assert (=> b!240830 (=> (not res!201045) (not e!166894))))

(declare-fun lt!376253 () (_ BitVec 64))

(declare-fun lt!376254 () (_ BitVec 64))

(assert (=> b!240830 (= res!201045 (= (bitIndex!0 (size!5770 (buf!6233 (_2!11152 lt!376257))) (currentByte!11590 (_2!11152 lt!376257)) (currentBit!11585 (_2!11152 lt!376257))) (bvadd lt!376254 lt!376253)))))

(assert (=> b!240830 (or (not (= (bvand lt!376254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376253 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!376254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!376254 lt!376253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240830 (= lt!376253 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240830 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240830 (= lt!376254 (bitIndex!0 (size!5770 (buf!6233 thiss!982)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982)))))

(declare-fun b!240832 () Bool)

(declare-fun lt!376259 () tuple2!20462)

(declare-fun lt!376255 () tuple2!20464)

(assert (=> b!240832 (= e!166894 (and (_2!11153 lt!376259) (= (_1!11153 lt!376259) (_2!11154 lt!376255))))))

(assert (=> b!240832 (= lt!376259 (checkBitsLoopPure!0 (_1!11154 lt!376255) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!376258 () Unit!17638)

(declare-fun lt!376256 () Unit!17638)

(assert (=> b!240832 (= lt!376258 lt!376256)))

(assert (=> b!240832 (validate_offset_bits!1 ((_ sign_extend 32) (size!5770 (buf!6233 (_2!11152 lt!376257)))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982)) lt!376260)))

(assert (=> b!240832 (= lt!376256 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6233 (_2!11152 lt!376257)) lt!376260))))

(assert (=> b!240832 e!166895))

(declare-fun res!201047 () Bool)

(assert (=> b!240832 (=> (not res!201047) (not e!166895))))

(assert (=> b!240832 (= res!201047 (and (= (size!5770 (buf!6233 thiss!982)) (size!5770 (buf!6233 (_2!11152 lt!376257)))) (bvsge lt!376260 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240832 (= lt!376260 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240832 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240832 (= lt!376255 (reader!0 thiss!982 (_2!11152 lt!376257)))))

(declare-fun b!240831 () Bool)

(declare-fun res!201048 () Bool)

(assert (=> b!240831 (=> (not res!201048) (not e!166894))))

(assert (=> b!240831 (= res!201048 (isPrefixOf!0 thiss!982 (_2!11152 lt!376257)))))

(assert (= (and d!81396 res!201046) b!240830))

(assert (= (and b!240830 res!201045) b!240831))

(assert (= (and b!240831 res!201048) b!240832))

(assert (= (and b!240832 res!201047) b!240833))

(declare-fun m!363451 () Bool)

(assert (=> b!240831 m!363451))

(declare-fun m!363453 () Bool)

(assert (=> b!240833 m!363453))

(declare-fun m!363455 () Bool)

(assert (=> d!81396 m!363455))

(declare-fun m!363457 () Bool)

(assert (=> b!240832 m!363457))

(declare-fun m!363459 () Bool)

(assert (=> b!240832 m!363459))

(declare-fun m!363461 () Bool)

(assert (=> b!240832 m!363461))

(declare-fun m!363463 () Bool)

(assert (=> b!240832 m!363463))

(declare-fun m!363465 () Bool)

(assert (=> b!240830 m!363465))

(assert (=> b!240830 m!363349))

(assert (=> b!240753 d!81396))

(declare-fun d!81412 () Bool)

(declare-fun e!166896 () Bool)

(assert (=> d!81412 e!166896))

(declare-fun res!201050 () Bool)

(assert (=> d!81412 (=> (not res!201050) (not e!166896))))

(declare-fun lt!376263 () (_ BitVec 64))

(declare-fun lt!376264 () (_ BitVec 64))

(declare-fun lt!376265 () (_ BitVec 64))

(assert (=> d!81412 (= res!201050 (= lt!376263 (bvsub lt!376264 lt!376265)))))

(assert (=> d!81412 (or (= (bvand lt!376264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376264 lt!376265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81412 (= lt!376265 (remainingBits!0 ((_ sign_extend 32) (size!5770 (buf!6233 (_2!11152 lt!376095)))) ((_ sign_extend 32) (currentByte!11590 (_2!11152 lt!376095))) ((_ sign_extend 32) (currentBit!11585 (_2!11152 lt!376095)))))))

(declare-fun lt!376262 () (_ BitVec 64))

(declare-fun lt!376261 () (_ BitVec 64))

(assert (=> d!81412 (= lt!376264 (bvmul lt!376262 lt!376261))))

(assert (=> d!81412 (or (= lt!376262 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!376261 (bvsdiv (bvmul lt!376262 lt!376261) lt!376262)))))

(assert (=> d!81412 (= lt!376261 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81412 (= lt!376262 ((_ sign_extend 32) (size!5770 (buf!6233 (_2!11152 lt!376095)))))))

(assert (=> d!81412 (= lt!376263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11590 (_2!11152 lt!376095))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11585 (_2!11152 lt!376095)))))))

(assert (=> d!81412 (invariant!0 (currentBit!11585 (_2!11152 lt!376095)) (currentByte!11590 (_2!11152 lt!376095)) (size!5770 (buf!6233 (_2!11152 lt!376095))))))

(assert (=> d!81412 (= (bitIndex!0 (size!5770 (buf!6233 (_2!11152 lt!376095))) (currentByte!11590 (_2!11152 lt!376095)) (currentBit!11585 (_2!11152 lt!376095))) lt!376263)))

(declare-fun b!240834 () Bool)

(declare-fun res!201049 () Bool)

(assert (=> b!240834 (=> (not res!201049) (not e!166896))))

(assert (=> b!240834 (= res!201049 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!376263))))

(declare-fun b!240835 () Bool)

(declare-fun lt!376266 () (_ BitVec 64))

(assert (=> b!240835 (= e!166896 (bvsle lt!376263 (bvmul lt!376266 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240835 (or (= lt!376266 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!376266 #b0000000000000000000000000000000000000000000000000000000000001000) lt!376266)))))

(assert (=> b!240835 (= lt!376266 ((_ sign_extend 32) (size!5770 (buf!6233 (_2!11152 lt!376095)))))))

(assert (= (and d!81412 res!201050) b!240834))

(assert (= (and b!240834 res!201049) b!240835))

(declare-fun m!363467 () Bool)

(assert (=> d!81412 m!363467))

(declare-fun m!363469 () Bool)

(assert (=> d!81412 m!363469))

(assert (=> b!240758 d!81412))

(assert (=> b!240758 d!81390))

(declare-fun d!81414 () Bool)

(declare-datatypes ((tuple2!20480 0))(
  ( (tuple2!20481 (_1!11162 Bool) (_2!11162 BitStream!10462)) )
))
(declare-fun lt!376285 () tuple2!20480)

(declare-fun checkBitsLoop!0 (BitStream!10462 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20480)

(assert (=> d!81414 (= lt!376285 (checkBitsLoop!0 (_1!11154 lt!376094) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81414 (= (checkBitsLoopPure!0 (_1!11154 lt!376094) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20463 (_2!11162 lt!376285) (_1!11162 lt!376285)))))

(declare-fun bs!20541 () Bool)

(assert (= bs!20541 d!81414))

(declare-fun m!363471 () Bool)

(assert (=> bs!20541 m!363471))

(assert (=> b!240754 d!81414))

(declare-fun d!81416 () Bool)

(assert (=> d!81416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5770 (buf!6233 (_2!11152 lt!376095)))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5770 (buf!6233 (_2!11152 lt!376095)))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982))) nBits!288))))

(declare-fun bs!20542 () Bool)

(assert (= bs!20542 d!81416))

(declare-fun m!363473 () Bool)

(assert (=> bs!20542 m!363473))

(assert (=> b!240754 d!81416))

(declare-fun d!81418 () Bool)

(assert (=> d!81418 (validate_offset_bits!1 ((_ sign_extend 32) (size!5770 (buf!6233 (_2!11152 lt!376095)))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982)) nBits!288)))

(declare-fun lt!376298 () Unit!17638)

(declare-fun choose!9 (BitStream!10462 array!13174 (_ BitVec 64) BitStream!10462) Unit!17638)

(assert (=> d!81418 (= lt!376298 (choose!9 thiss!982 (buf!6233 (_2!11152 lt!376095)) nBits!288 (BitStream!10463 (buf!6233 (_2!11152 lt!376095)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982))))))

(assert (=> d!81418 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6233 (_2!11152 lt!376095)) nBits!288) lt!376298)))

(declare-fun bs!20543 () Bool)

(assert (= bs!20543 d!81418))

(assert (=> bs!20543 m!363341))

(declare-fun m!363475 () Bool)

(assert (=> bs!20543 m!363475))

(assert (=> b!240754 d!81418))

(declare-fun b!240868 () Bool)

(declare-fun res!201081 () Bool)

(declare-fun e!166913 () Bool)

(assert (=> b!240868 (=> (not res!201081) (not e!166913))))

(declare-fun lt!376373 () tuple2!20464)

(assert (=> b!240868 (= res!201081 (isPrefixOf!0 (_2!11154 lt!376373) (_2!11152 lt!376095)))))

(declare-fun b!240869 () Bool)

(declare-fun e!166912 () Unit!17638)

(declare-fun Unit!17645 () Unit!17638)

(assert (=> b!240869 (= e!166912 Unit!17645)))

(declare-fun b!240870 () Bool)

(declare-fun res!201080 () Bool)

(assert (=> b!240870 (=> (not res!201080) (not e!166913))))

(assert (=> b!240870 (= res!201080 (isPrefixOf!0 (_1!11154 lt!376373) thiss!982))))

(declare-fun d!81420 () Bool)

(assert (=> d!81420 e!166913))

(declare-fun res!201079 () Bool)

(assert (=> d!81420 (=> (not res!201079) (not e!166913))))

(assert (=> d!81420 (= res!201079 (isPrefixOf!0 (_1!11154 lt!376373) (_2!11154 lt!376373)))))

(declare-fun lt!376383 () BitStream!10462)

(assert (=> d!81420 (= lt!376373 (tuple2!20465 lt!376383 (_2!11152 lt!376095)))))

(declare-fun lt!376392 () Unit!17638)

(declare-fun lt!376379 () Unit!17638)

(assert (=> d!81420 (= lt!376392 lt!376379)))

(assert (=> d!81420 (isPrefixOf!0 lt!376383 (_2!11152 lt!376095))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10462 BitStream!10462 BitStream!10462) Unit!17638)

(assert (=> d!81420 (= lt!376379 (lemmaIsPrefixTransitive!0 lt!376383 (_2!11152 lt!376095) (_2!11152 lt!376095)))))

(declare-fun lt!376390 () Unit!17638)

(declare-fun lt!376377 () Unit!17638)

(assert (=> d!81420 (= lt!376390 lt!376377)))

(assert (=> d!81420 (isPrefixOf!0 lt!376383 (_2!11152 lt!376095))))

(assert (=> d!81420 (= lt!376377 (lemmaIsPrefixTransitive!0 lt!376383 thiss!982 (_2!11152 lt!376095)))))

(declare-fun lt!376387 () Unit!17638)

(assert (=> d!81420 (= lt!376387 e!166912)))

(declare-fun c!11437 () Bool)

(assert (=> d!81420 (= c!11437 (not (= (size!5770 (buf!6233 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!376388 () Unit!17638)

(declare-fun lt!376381 () Unit!17638)

(assert (=> d!81420 (= lt!376388 lt!376381)))

(assert (=> d!81420 (isPrefixOf!0 (_2!11152 lt!376095) (_2!11152 lt!376095))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10462) Unit!17638)

(assert (=> d!81420 (= lt!376381 (lemmaIsPrefixRefl!0 (_2!11152 lt!376095)))))

(declare-fun lt!376386 () Unit!17638)

(declare-fun lt!376375 () Unit!17638)

(assert (=> d!81420 (= lt!376386 lt!376375)))

(assert (=> d!81420 (= lt!376375 (lemmaIsPrefixRefl!0 (_2!11152 lt!376095)))))

(declare-fun lt!376391 () Unit!17638)

(declare-fun lt!376382 () Unit!17638)

(assert (=> d!81420 (= lt!376391 lt!376382)))

(assert (=> d!81420 (isPrefixOf!0 lt!376383 lt!376383)))

(assert (=> d!81420 (= lt!376382 (lemmaIsPrefixRefl!0 lt!376383))))

(declare-fun lt!376374 () Unit!17638)

(declare-fun lt!376376 () Unit!17638)

(assert (=> d!81420 (= lt!376374 lt!376376)))

(assert (=> d!81420 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81420 (= lt!376376 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81420 (= lt!376383 (BitStream!10463 (buf!6233 (_2!11152 lt!376095)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982)))))

(assert (=> d!81420 (isPrefixOf!0 thiss!982 (_2!11152 lt!376095))))

(assert (=> d!81420 (= (reader!0 thiss!982 (_2!11152 lt!376095)) lt!376373)))

(declare-fun b!240871 () Bool)

(declare-fun lt!376378 () Unit!17638)

(assert (=> b!240871 (= e!166912 lt!376378)))

(declare-fun lt!376380 () (_ BitVec 64))

(assert (=> b!240871 (= lt!376380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376384 () (_ BitVec 64))

(assert (=> b!240871 (= lt!376384 (bitIndex!0 (size!5770 (buf!6233 thiss!982)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13174 array!13174 (_ BitVec 64) (_ BitVec 64)) Unit!17638)

(assert (=> b!240871 (= lt!376378 (arrayBitRangesEqSymmetric!0 (buf!6233 thiss!982) (buf!6233 (_2!11152 lt!376095)) lt!376380 lt!376384))))

(declare-fun arrayBitRangesEq!0 (array!13174 array!13174 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240871 (arrayBitRangesEq!0 (buf!6233 (_2!11152 lt!376095)) (buf!6233 thiss!982) lt!376380 lt!376384)))

(declare-fun b!240872 () Bool)

(declare-fun lt!376385 () (_ BitVec 64))

(declare-fun lt!376389 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10462 (_ BitVec 64)) BitStream!10462)

(assert (=> b!240872 (= e!166913 (= (_1!11154 lt!376373) (withMovedBitIndex!0 (_2!11154 lt!376373) (bvsub lt!376385 lt!376389))))))

(assert (=> b!240872 (or (= (bvand lt!376385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376389 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376385 lt!376389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240872 (= lt!376389 (bitIndex!0 (size!5770 (buf!6233 (_2!11152 lt!376095))) (currentByte!11590 (_2!11152 lt!376095)) (currentBit!11585 (_2!11152 lt!376095))))))

(assert (=> b!240872 (= lt!376385 (bitIndex!0 (size!5770 (buf!6233 thiss!982)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982)))))

(assert (= (and d!81420 c!11437) b!240871))

(assert (= (and d!81420 (not c!11437)) b!240869))

(assert (= (and d!81420 res!201079) b!240870))

(assert (= (and b!240870 res!201080) b!240868))

(assert (= (and b!240868 res!201081) b!240872))

(declare-fun m!363509 () Bool)

(assert (=> b!240870 m!363509))

(assert (=> b!240871 m!363349))

(declare-fun m!363511 () Bool)

(assert (=> b!240871 m!363511))

(declare-fun m!363513 () Bool)

(assert (=> b!240871 m!363513))

(declare-fun m!363515 () Bool)

(assert (=> d!81420 m!363515))

(declare-fun m!363517 () Bool)

(assert (=> d!81420 m!363517))

(assert (=> d!81420 m!363351))

(declare-fun m!363519 () Bool)

(assert (=> d!81420 m!363519))

(declare-fun m!363521 () Bool)

(assert (=> d!81420 m!363521))

(declare-fun m!363523 () Bool)

(assert (=> d!81420 m!363523))

(declare-fun m!363525 () Bool)

(assert (=> d!81420 m!363525))

(declare-fun m!363527 () Bool)

(assert (=> d!81420 m!363527))

(declare-fun m!363529 () Bool)

(assert (=> d!81420 m!363529))

(declare-fun m!363531 () Bool)

(assert (=> d!81420 m!363531))

(declare-fun m!363533 () Bool)

(assert (=> d!81420 m!363533))

(declare-fun m!363535 () Bool)

(assert (=> b!240872 m!363535))

(assert (=> b!240872 m!363347))

(assert (=> b!240872 m!363349))

(declare-fun m!363537 () Bool)

(assert (=> b!240868 m!363537))

(assert (=> b!240754 d!81420))

(declare-fun d!81436 () Bool)

(assert (=> d!81436 (= (inv!12 thiss!982) (invariant!0 (currentBit!11585 thiss!982) (currentByte!11590 thiss!982) (size!5770 (buf!6233 thiss!982))))))

(declare-fun bs!20547 () Bool)

(assert (= bs!20547 d!81436))

(assert (=> bs!20547 m!363407))

(assert (=> start!52294 d!81436))

(declare-fun d!81438 () Bool)

(assert (=> d!81438 (= (array_inv!5511 (buf!6233 thiss!982)) (bvsge (size!5770 (buf!6233 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!240756 d!81438))

(declare-fun d!81440 () Bool)

(declare-fun res!201096 () Bool)

(declare-fun e!166923 () Bool)

(assert (=> d!81440 (=> (not res!201096) (not e!166923))))

(assert (=> d!81440 (= res!201096 (= (size!5770 (buf!6233 thiss!982)) (size!5770 (buf!6233 (_2!11152 lt!376095)))))))

(assert (=> d!81440 (= (isPrefixOf!0 thiss!982 (_2!11152 lt!376095)) e!166923)))

(declare-fun b!240889 () Bool)

(declare-fun res!201094 () Bool)

(assert (=> b!240889 (=> (not res!201094) (not e!166923))))

(assert (=> b!240889 (= res!201094 (bvsle (bitIndex!0 (size!5770 (buf!6233 thiss!982)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982)) (bitIndex!0 (size!5770 (buf!6233 (_2!11152 lt!376095))) (currentByte!11590 (_2!11152 lt!376095)) (currentBit!11585 (_2!11152 lt!376095)))))))

(declare-fun b!240890 () Bool)

(declare-fun e!166922 () Bool)

(assert (=> b!240890 (= e!166923 e!166922)))

(declare-fun res!201095 () Bool)

(assert (=> b!240890 (=> res!201095 e!166922)))

(assert (=> b!240890 (= res!201095 (= (size!5770 (buf!6233 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!240891 () Bool)

(assert (=> b!240891 (= e!166922 (arrayBitRangesEq!0 (buf!6233 thiss!982) (buf!6233 (_2!11152 lt!376095)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5770 (buf!6233 thiss!982)) (currentByte!11590 thiss!982) (currentBit!11585 thiss!982))))))

(assert (= (and d!81440 res!201096) b!240889))

(assert (= (and b!240889 res!201094) b!240890))

(assert (= (and b!240890 (not res!201095)) b!240891))

(assert (=> b!240889 m!363349))

(assert (=> b!240889 m!363347))

(assert (=> b!240891 m!363349))

(assert (=> b!240891 m!363349))

(declare-fun m!363539 () Bool)

(assert (=> b!240891 m!363539))

(assert (=> b!240755 d!81440))

(declare-fun d!81442 () Bool)

(assert (=> d!81442 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5770 (buf!6233 thiss!982))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5770 (buf!6233 thiss!982))) ((_ sign_extend 32) (currentByte!11590 thiss!982)) ((_ sign_extend 32) (currentBit!11585 thiss!982))) nBits!288))))

(declare-fun bs!20548 () Bool)

(assert (= bs!20548 d!81442))

(assert (=> bs!20548 m!363405))

(assert (=> b!240757 d!81442))

(push 1)

(assert (not b!240833))

(assert (not b!240871))

(assert (not d!81416))

(assert (not d!81412))

(assert (not d!81436))

(assert (not d!81414))

(assert (not d!81442))

(assert (not d!81420))

(assert (not d!81390))

(assert (not b!240872))

(assert (not b!240868))

(assert (not b!240891))

(assert (not b!240870))

(assert (not d!81418))

(assert (not b!240831))

(assert (not d!81396))

(assert (not b!240889))

(assert (not b!240830))

(assert (not b!240832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

