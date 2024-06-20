; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38520 () Bool)

(assert start!38520)

(declare-fun b!173270 () Bool)

(declare-fun e!120984 () Bool)

(declare-fun e!120983 () Bool)

(assert (=> b!173270 (= e!120984 e!120983)))

(declare-fun res!143522 () Bool)

(assert (=> b!173270 (=> (not res!143522) (not e!120983))))

(declare-datatypes ((array!9326 0))(
  ( (array!9327 (arr!5047 (Array (_ BitVec 32) (_ BitVec 8))) (size!4117 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7342 0))(
  ( (BitStream!7343 (buf!4545 array!9326) (currentByte!8632 (_ BitVec 32)) (currentBit!8627 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12403 0))(
  ( (Unit!12404) )
))
(declare-datatypes ((tuple2!14920 0))(
  ( (tuple2!14921 (_1!8102 Unit!12403) (_2!8102 BitStream!7342)) )
))
(declare-fun lt!266685 () tuple2!14920)

(declare-fun thiss!1187 () BitStream!7342)

(assert (=> b!173270 (= res!143522 (= (size!4117 (buf!4545 (_2!8102 lt!266685))) (size!4117 (buf!4545 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7342 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14920)

(assert (=> b!173270 (= lt!266685 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173271 () Bool)

(declare-fun e!120982 () Bool)

(declare-fun array_inv!3858 (array!9326) Bool)

(assert (=> b!173271 (= e!120982 (array_inv!3858 (buf!4545 thiss!1187)))))

(declare-fun b!173272 () Bool)

(declare-fun res!143521 () Bool)

(assert (=> b!173272 (=> (not res!143521) (not e!120984))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173272 (= res!143521 (invariant!0 (currentBit!8627 thiss!1187) (currentByte!8632 thiss!1187) (size!4117 (buf!4545 thiss!1187))))))

(declare-fun res!143523 () Bool)

(assert (=> start!38520 (=> (not res!143523) (not e!120984))))

(assert (=> start!38520 (= res!143523 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38520 e!120984))

(assert (=> start!38520 true))

(declare-fun inv!12 (BitStream!7342) Bool)

(assert (=> start!38520 (and (inv!12 thiss!1187) e!120982)))

(declare-fun b!173273 () Bool)

(declare-fun res!143519 () Bool)

(assert (=> b!173273 (=> (not res!143519) (not e!120983))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173273 (= res!143519 (= (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266685))) (currentByte!8632 (_2!8102 lt!266685)) (currentBit!8627 (_2!8102 lt!266685))) (bvadd (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173274 () Bool)

(declare-fun res!143518 () Bool)

(assert (=> b!173274 (=> (not res!143518) (not e!120983))))

(declare-fun isPrefixOf!0 (BitStream!7342 BitStream!7342) Bool)

(assert (=> b!173274 (= res!143518 (isPrefixOf!0 thiss!1187 (_2!8102 lt!266685)))))

(declare-fun b!173275 () Bool)

(declare-fun res!143520 () Bool)

(assert (=> b!173275 (=> (not res!143520) (not e!120984))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173275 (= res!143520 (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 thiss!1187))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173276 () Bool)

(declare-datatypes ((tuple2!14922 0))(
  ( (tuple2!14923 (_1!8103 BitStream!7342) (_2!8103 BitStream!7342)) )
))
(declare-fun lt!266687 () tuple2!14922)

(assert (=> b!173276 (= e!120983 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 (_1!8103 lt!266687)))) ((_ sign_extend 32) (currentByte!8632 (_1!8103 lt!266687))) ((_ sign_extend 32) (currentBit!8627 (_1!8103 lt!266687))) ((_ sign_extend 32) nBits!340))))))

(assert (=> b!173276 (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266685)))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!266686 () Unit!12403)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7342 array!9326 (_ BitVec 64)) Unit!12403)

(assert (=> b!173276 (= lt!266686 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4545 (_2!8102 lt!266685)) ((_ sign_extend 32) nBits!340)))))

(declare-fun reader!0 (BitStream!7342 BitStream!7342) tuple2!14922)

(assert (=> b!173276 (= lt!266687 (reader!0 thiss!1187 (_2!8102 lt!266685)))))

(declare-fun b!173277 () Bool)

(declare-fun res!143517 () Bool)

(assert (=> b!173277 (=> (not res!143517) (not e!120983))))

(assert (=> b!173277 (= res!143517 (= (size!4117 (buf!4545 thiss!1187)) (size!4117 (buf!4545 (_2!8102 lt!266685)))))))

(assert (= (and start!38520 res!143523) b!173275))

(assert (= (and b!173275 res!143520) b!173272))

(assert (= (and b!173272 res!143521) b!173270))

(assert (= (and b!173270 res!143522) b!173273))

(assert (= (and b!173273 res!143519) b!173277))

(assert (= (and b!173277 res!143517) b!173274))

(assert (= (and b!173274 res!143518) b!173276))

(assert (= start!38520 b!173271))

(declare-fun m!272361 () Bool)

(assert (=> b!173275 m!272361))

(declare-fun m!272363 () Bool)

(assert (=> b!173270 m!272363))

(declare-fun m!272365 () Bool)

(assert (=> b!173276 m!272365))

(declare-fun m!272367 () Bool)

(assert (=> b!173276 m!272367))

(declare-fun m!272369 () Bool)

(assert (=> b!173276 m!272369))

(declare-fun m!272371 () Bool)

(assert (=> b!173276 m!272371))

(declare-fun m!272373 () Bool)

(assert (=> b!173272 m!272373))

(declare-fun m!272375 () Bool)

(assert (=> b!173273 m!272375))

(declare-fun m!272377 () Bool)

(assert (=> b!173273 m!272377))

(declare-fun m!272379 () Bool)

(assert (=> b!173271 m!272379))

(declare-fun m!272381 () Bool)

(assert (=> b!173274 m!272381))

(declare-fun m!272383 () Bool)

(assert (=> start!38520 m!272383))

(push 1)

(assert (not b!173274))

(assert (not b!173273))

(assert (not b!173275))

(assert (not b!173276))

(assert (not b!173270))

(assert (not b!173271))

(assert (not b!173272))

(assert (not start!38520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61213 () Bool)

(declare-fun e!121012 () Bool)

(assert (=> d!61213 e!121012))

(declare-fun res!143571 () Bool)

(assert (=> d!61213 (=> (not res!143571) (not e!121012))))

(declare-fun lt!266723 () (_ BitVec 64))

(declare-fun lt!266721 () (_ BitVec 64))

(declare-fun lt!266725 () (_ BitVec 64))

(assert (=> d!61213 (= res!143571 (= lt!266725 (bvsub lt!266721 lt!266723)))))

(assert (=> d!61213 (or (= (bvand lt!266721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266721 lt!266723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61213 (= lt!266723 (remainingBits!0 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266685)))) ((_ sign_extend 32) (currentByte!8632 (_2!8102 lt!266685))) ((_ sign_extend 32) (currentBit!8627 (_2!8102 lt!266685)))))))

(declare-fun lt!266726 () (_ BitVec 64))

(declare-fun lt!266722 () (_ BitVec 64))

(assert (=> d!61213 (= lt!266721 (bvmul lt!266726 lt!266722))))

(assert (=> d!61213 (or (= lt!266726 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!266722 (bvsdiv (bvmul lt!266726 lt!266722) lt!266726)))))

(assert (=> d!61213 (= lt!266722 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61213 (= lt!266726 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266685)))))))

(assert (=> d!61213 (= lt!266725 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8632 (_2!8102 lt!266685))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8627 (_2!8102 lt!266685)))))))

(assert (=> d!61213 (invariant!0 (currentBit!8627 (_2!8102 lt!266685)) (currentByte!8632 (_2!8102 lt!266685)) (size!4117 (buf!4545 (_2!8102 lt!266685))))))

(assert (=> d!61213 (= (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266685))) (currentByte!8632 (_2!8102 lt!266685)) (currentBit!8627 (_2!8102 lt!266685))) lt!266725)))

(declare-fun b!173330 () Bool)

(declare-fun res!143570 () Bool)

(assert (=> b!173330 (=> (not res!143570) (not e!121012))))

(assert (=> b!173330 (= res!143570 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!266725))))

(declare-fun b!173331 () Bool)

(declare-fun lt!266724 () (_ BitVec 64))

(assert (=> b!173331 (= e!121012 (bvsle lt!266725 (bvmul lt!266724 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!173331 (or (= lt!266724 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!266724 #b0000000000000000000000000000000000000000000000000000000000001000) lt!266724)))))

(assert (=> b!173331 (= lt!266724 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266685)))))))

(assert (= (and d!61213 res!143571) b!173330))

(assert (= (and b!173330 res!143570) b!173331))

(declare-fun m!272441 () Bool)

(assert (=> d!61213 m!272441))

(declare-fun m!272443 () Bool)

(assert (=> d!61213 m!272443))

(assert (=> b!173273 d!61213))

(declare-fun d!61229 () Bool)

(declare-fun e!121013 () Bool)

(assert (=> d!61229 e!121013))

(declare-fun res!143573 () Bool)

(assert (=> d!61229 (=> (not res!143573) (not e!121013))))

(declare-fun lt!266731 () (_ BitVec 64))

(declare-fun lt!266729 () (_ BitVec 64))

(declare-fun lt!266727 () (_ BitVec 64))

(assert (=> d!61229 (= res!143573 (= lt!266731 (bvsub lt!266727 lt!266729)))))

(assert (=> d!61229 (or (= (bvand lt!266727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266727 lt!266729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61229 (= lt!266729 (remainingBits!0 ((_ sign_extend 32) (size!4117 (buf!4545 thiss!1187))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187))))))

(declare-fun lt!266732 () (_ BitVec 64))

(declare-fun lt!266728 () (_ BitVec 64))

(assert (=> d!61229 (= lt!266727 (bvmul lt!266732 lt!266728))))

(assert (=> d!61229 (or (= lt!266732 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!266728 (bvsdiv (bvmul lt!266732 lt!266728) lt!266732)))))

(assert (=> d!61229 (= lt!266728 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61229 (= lt!266732 ((_ sign_extend 32) (size!4117 (buf!4545 thiss!1187))))))

(assert (=> d!61229 (= lt!266731 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8632 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8627 thiss!1187))))))

(assert (=> d!61229 (invariant!0 (currentBit!8627 thiss!1187) (currentByte!8632 thiss!1187) (size!4117 (buf!4545 thiss!1187)))))

(assert (=> d!61229 (= (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)) lt!266731)))

(declare-fun b!173332 () Bool)

(declare-fun res!143572 () Bool)

(assert (=> b!173332 (=> (not res!143572) (not e!121013))))

(assert (=> b!173332 (= res!143572 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!266731))))

(declare-fun b!173333 () Bool)

(declare-fun lt!266730 () (_ BitVec 64))

(assert (=> b!173333 (= e!121013 (bvsle lt!266731 (bvmul lt!266730 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!173333 (or (= lt!266730 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!266730 #b0000000000000000000000000000000000000000000000000000000000001000) lt!266730)))))

(assert (=> b!173333 (= lt!266730 ((_ sign_extend 32) (size!4117 (buf!4545 thiss!1187))))))

(assert (= (and d!61229 res!143573) b!173332))

(assert (= (and b!173332 res!143572) b!173333))

(declare-fun m!272445 () Bool)

(assert (=> d!61229 m!272445))

(assert (=> d!61229 m!272373))

(assert (=> b!173273 d!61229))

(declare-fun d!61233 () Bool)

(declare-fun res!143581 () Bool)

(declare-fun e!121018 () Bool)

(assert (=> d!61233 (=> (not res!143581) (not e!121018))))

(assert (=> d!61233 (= res!143581 (= (size!4117 (buf!4545 thiss!1187)) (size!4117 (buf!4545 (_2!8102 lt!266685)))))))

(assert (=> d!61233 (= (isPrefixOf!0 thiss!1187 (_2!8102 lt!266685)) e!121018)))

(declare-fun b!173340 () Bool)

(declare-fun res!143582 () Bool)

(assert (=> b!173340 (=> (not res!143582) (not e!121018))))

(assert (=> b!173340 (= res!143582 (bvsle (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)) (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266685))) (currentByte!8632 (_2!8102 lt!266685)) (currentBit!8627 (_2!8102 lt!266685)))))))

(declare-fun b!173341 () Bool)

(declare-fun e!121019 () Bool)

(assert (=> b!173341 (= e!121018 e!121019)))

(declare-fun res!143580 () Bool)

(assert (=> b!173341 (=> res!143580 e!121019)))

(assert (=> b!173341 (= res!143580 (= (size!4117 (buf!4545 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!173342 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9326 array!9326 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173342 (= e!121019 (arrayBitRangesEq!0 (buf!4545 thiss!1187) (buf!4545 (_2!8102 lt!266685)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187))))))

(assert (= (and d!61233 res!143581) b!173340))

(assert (= (and b!173340 res!143582) b!173341))

(assert (= (and b!173341 (not res!143580)) b!173342))

(assert (=> b!173340 m!272377))

(assert (=> b!173340 m!272375))

(assert (=> b!173342 m!272377))

(assert (=> b!173342 m!272377))

(declare-fun m!272447 () Bool)

(assert (=> b!173342 m!272447))

(assert (=> b!173274 d!61233))

(declare-fun d!61237 () Bool)

(assert (=> d!61237 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 thiss!1187))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4117 (buf!4545 thiss!1187))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15252 () Bool)

(assert (= bs!15252 d!61237))

(assert (=> bs!15252 m!272445))

(assert (=> b!173275 d!61237))

(declare-fun d!61239 () Bool)

(assert (=> d!61239 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8627 thiss!1187) (currentByte!8632 thiss!1187) (size!4117 (buf!4545 thiss!1187))))))

(declare-fun bs!15253 () Bool)

(assert (= bs!15253 d!61239))

(assert (=> bs!15253 m!272373))

(assert (=> start!38520 d!61239))

(declare-fun b!173424 () Bool)

(declare-fun e!121068 () Bool)

(declare-fun e!121072 () Bool)

(assert (=> b!173424 (= e!121068 e!121072)))

(declare-fun res!143656 () Bool)

(assert (=> b!173424 (=> (not res!143656) (not e!121072))))

(declare-datatypes ((tuple2!14932 0))(
  ( (tuple2!14933 (_1!8108 BitStream!7342) (_2!8108 (_ BitVec 64))) )
))
(declare-fun lt!266964 () tuple2!14932)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173424 (= res!143656 (= (_2!8108 lt!266964) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun lt!266991 () tuple2!14922)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14932)

(assert (=> b!173424 (= lt!266964 (readNBitsLSBFirstsLoopPure!0 (_1!8103 lt!266991) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!266972 () Unit!12403)

(declare-fun lt!267004 () Unit!12403)

(assert (=> b!173424 (= lt!266972 lt!267004)))

(declare-fun lt!266959 () tuple2!14920)

(declare-fun lt!266974 () (_ BitVec 64))

(assert (=> b!173424 (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266959)))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187)) lt!266974)))

(assert (=> b!173424 (= lt!267004 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4545 (_2!8102 lt!266959)) lt!266974))))

(declare-fun e!121070 () Bool)

(assert (=> b!173424 e!121070))

(declare-fun res!143659 () Bool)

(assert (=> b!173424 (=> (not res!143659) (not e!121070))))

(assert (=> b!173424 (= res!143659 (and (= (size!4117 (buf!4545 thiss!1187)) (size!4117 (buf!4545 (_2!8102 lt!266959)))) (bvsge lt!266974 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173424 (= lt!266974 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!173424 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!173424 (= lt!266991 (reader!0 thiss!1187 (_2!8102 lt!266959)))))

(declare-fun b!173425 () Bool)

(declare-fun e!121066 () (_ BitVec 64))

(assert (=> b!173425 (= e!121066 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!173426 () Bool)

(declare-fun e!121064 () Bool)

(declare-datatypes ((tuple2!14934 0))(
  ( (tuple2!14935 (_1!8109 BitStream!7342) (_2!8109 Bool)) )
))
(declare-fun lt!266963 () tuple2!14934)

(declare-fun lt!266978 () tuple2!14920)

(assert (=> b!173426 (= e!121064 (= (bitIndex!0 (size!4117 (buf!4545 (_1!8109 lt!266963))) (currentByte!8632 (_1!8109 lt!266963)) (currentBit!8627 (_1!8109 lt!266963))) (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266978))) (currentByte!8632 (_2!8102 lt!266978)) (currentBit!8627 (_2!8102 lt!266978)))))))

(declare-fun b!173428 () Bool)

(declare-fun res!143652 () Bool)

(declare-fun call!2861 () Bool)

(assert (=> b!173428 (= res!143652 call!2861)))

(declare-fun e!121065 () Bool)

(assert (=> b!173428 (=> (not res!143652) (not e!121065))))

(declare-fun b!173429 () Bool)

(declare-fun e!121067 () Bool)

(declare-fun lt!267006 () tuple2!14934)

(declare-fun lt!266973 () tuple2!14934)

(assert (=> b!173429 (= e!121067 (= (_2!8109 lt!267006) (_2!8109 lt!266973)))))

(declare-fun b!173430 () Bool)

(declare-fun res!143655 () Bool)

(assert (=> b!173430 (=> (not res!143655) (not e!121068))))

(assert (=> b!173430 (= res!143655 (= (size!4117 (buf!4545 thiss!1187)) (size!4117 (buf!4545 (_2!8102 lt!266959)))))))

(declare-fun b!173431 () Bool)

(declare-fun readBitPure!0 (BitStream!7342) tuple2!14934)

(declare-fun readerFrom!0 (BitStream!7342 (_ BitVec 32) (_ BitVec 32)) BitStream!7342)

(assert (=> b!173431 (= lt!266963 (readBitPure!0 (readerFrom!0 (_2!8102 lt!266978) (currentBit!8627 thiss!1187) (currentByte!8632 thiss!1187))))))

(declare-fun lt!266988 () Bool)

(declare-fun res!143660 () Bool)

(assert (=> b!173431 (= res!143660 (and (= (_2!8109 lt!266963) lt!266988) (= (_1!8109 lt!266963) (_2!8102 lt!266978))))))

(assert (=> b!173431 (=> (not res!143660) (not e!121064))))

(assert (=> b!173431 (= e!121065 e!121064)))

(declare-fun b!173432 () Bool)

(declare-fun res!143658 () Bool)

(assert (=> b!173432 (=> (not res!143658) (not e!121068))))

(declare-fun lt!266985 () (_ BitVec 64))

(declare-fun lt!266969 () (_ BitVec 64))

(assert (=> b!173432 (= res!143658 (= (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266959))) (currentByte!8632 (_2!8102 lt!266959)) (currentBit!8627 (_2!8102 lt!266959))) (bvsub lt!266969 lt!266985)))))

(assert (=> b!173432 (or (= (bvand lt!266969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266985 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266969 lt!266985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173432 (= lt!266985 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!266956 () (_ BitVec 64))

(declare-fun lt!266984 () (_ BitVec 64))

(assert (=> b!173432 (= lt!266969 (bvadd lt!266956 lt!266984))))

(assert (=> b!173432 (or (not (= (bvand lt!266956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266984 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!266956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!266956 lt!266984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173432 (= lt!266984 ((_ sign_extend 32) nBits!340))))

(assert (=> b!173432 (= lt!266956 (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)))))

(declare-fun b!173433 () Bool)

(assert (=> b!173433 (= e!121072 (= (_1!8108 lt!266964) (_2!8103 lt!266991)))))

(declare-fun b!173434 () Bool)

(declare-fun res!143654 () Bool)

(assert (=> b!173434 (=> (not res!143654) (not e!121068))))

(assert (=> b!173434 (= res!143654 (isPrefixOf!0 thiss!1187 (_2!8102 lt!266959)))))

(declare-fun b!173435 () Bool)

(assert (=> b!173435 (= e!121066 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!173436 () Bool)

(declare-fun e!121069 () Bool)

(declare-fun lt!266992 () tuple2!14932)

(declare-fun lt!266999 () tuple2!14922)

(assert (=> b!173436 (= e!121069 (= (_1!8108 lt!266992) (_2!8103 lt!266999)))))

(declare-fun b!173427 () Bool)

(declare-fun res!143651 () Bool)

(assert (=> b!173427 (= res!143651 (= (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266978))) (currentByte!8632 (_2!8102 lt!266978)) (currentBit!8627 (_2!8102 lt!266978))) (bvadd (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!173427 (=> (not res!143651) (not e!121065))))

(declare-fun d!61241 () Bool)

(assert (=> d!61241 e!121068))

(declare-fun res!143661 () Bool)

(assert (=> d!61241 (=> (not res!143661) (not e!121068))))

(assert (=> d!61241 (= res!143661 (invariant!0 (currentBit!8627 (_2!8102 lt!266959)) (currentByte!8632 (_2!8102 lt!266959)) (size!4117 (buf!4545 (_2!8102 lt!266959)))))))

(declare-fun e!121071 () tuple2!14920)

(assert (=> d!61241 (= lt!266959 e!121071)))

(declare-fun c!9113 () Bool)

(assert (=> d!61241 (= c!9113 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61241 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61241 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!266959)))

(declare-fun b!173437 () Bool)

(declare-fun Unit!12410 () Unit!12403)

(assert (=> b!173437 (= e!121071 (tuple2!14921 Unit!12410 thiss!1187))))

(declare-fun lt!266955 () Unit!12403)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7342) Unit!12403)

(assert (=> b!173437 (= lt!266955 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!173437 call!2861))

(declare-fun lt!266977 () Unit!12403)

(assert (=> b!173437 (= lt!266977 lt!266955)))

(declare-fun bm!2858 () Bool)

(assert (=> bm!2858 (= call!2861 (isPrefixOf!0 thiss!1187 (ite c!9113 thiss!1187 (_2!8102 lt!266978))))))

(declare-fun b!173438 () Bool)

(declare-fun lt!266968 () tuple2!14920)

(assert (=> b!173438 (= e!121071 (tuple2!14921 (_1!8102 lt!266968) (_2!8102 lt!266968)))))

(assert (=> b!173438 (= lt!266988 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7342 Bool) tuple2!14920)

(assert (=> b!173438 (= lt!266978 (appendBit!0 thiss!1187 lt!266988))))

(declare-fun res!143657 () Bool)

(assert (=> b!173438 (= res!143657 (= (size!4117 (buf!4545 thiss!1187)) (size!4117 (buf!4545 (_2!8102 lt!266978)))))))

(assert (=> b!173438 (=> (not res!143657) (not e!121065))))

(assert (=> b!173438 e!121065))

(declare-fun lt!266997 () tuple2!14920)

(assert (=> b!173438 (= lt!266997 lt!266978)))

(assert (=> b!173438 (= lt!266968 (appendBitsLSBFirstLoopTR!0 (_2!8102 lt!266997) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!266986 () Unit!12403)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7342 BitStream!7342 BitStream!7342) Unit!12403)

(assert (=> b!173438 (= lt!266986 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8102 lt!266997) (_2!8102 lt!266968)))))

(assert (=> b!173438 (isPrefixOf!0 thiss!1187 (_2!8102 lt!266968))))

(declare-fun lt!266971 () Unit!12403)

(assert (=> b!173438 (= lt!266971 lt!266986)))

(assert (=> b!173438 (invariant!0 (currentBit!8627 thiss!1187) (currentByte!8632 thiss!1187) (size!4117 (buf!4545 (_2!8102 lt!266997))))))

(declare-fun lt!267005 () BitStream!7342)

(assert (=> b!173438 (= lt!267005 (BitStream!7343 (buf!4545 (_2!8102 lt!266997)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)))))

(assert (=> b!173438 (invariant!0 (currentBit!8627 lt!267005) (currentByte!8632 lt!267005) (size!4117 (buf!4545 (_2!8102 lt!266968))))))

(declare-fun lt!267007 () BitStream!7342)

(assert (=> b!173438 (= lt!267007 (BitStream!7343 (buf!4545 (_2!8102 lt!266968)) (currentByte!8632 lt!267005) (currentBit!8627 lt!267005)))))

(assert (=> b!173438 (= lt!267006 (readBitPure!0 lt!267005))))

(assert (=> b!173438 (= lt!266973 (readBitPure!0 lt!267007))))

(declare-fun lt!266990 () Unit!12403)

(declare-fun readBitPrefixLemma!0 (BitStream!7342 BitStream!7342) Unit!12403)

(assert (=> b!173438 (= lt!266990 (readBitPrefixLemma!0 lt!267005 (_2!8102 lt!266968)))))

(declare-fun res!143653 () Bool)

(assert (=> b!173438 (= res!143653 (= (bitIndex!0 (size!4117 (buf!4545 (_1!8109 lt!267006))) (currentByte!8632 (_1!8109 lt!267006)) (currentBit!8627 (_1!8109 lt!267006))) (bitIndex!0 (size!4117 (buf!4545 (_1!8109 lt!266973))) (currentByte!8632 (_1!8109 lt!266973)) (currentBit!8627 (_1!8109 lt!266973)))))))

(assert (=> b!173438 (=> (not res!143653) (not e!121067))))

(assert (=> b!173438 e!121067))

(declare-fun lt!267002 () Unit!12403)

(assert (=> b!173438 (= lt!267002 lt!266990)))

(declare-fun lt!266953 () tuple2!14922)

(assert (=> b!173438 (= lt!266953 (reader!0 thiss!1187 (_2!8102 lt!266968)))))

(declare-fun lt!266982 () tuple2!14922)

(assert (=> b!173438 (= lt!266982 (reader!0 (_2!8102 lt!266997) (_2!8102 lt!266968)))))

(declare-fun lt!267003 () tuple2!14934)

(assert (=> b!173438 (= lt!267003 (readBitPure!0 (_1!8103 lt!266953)))))

(assert (=> b!173438 (= (_2!8109 lt!267003) lt!266988)))

(declare-fun lt!266980 () Unit!12403)

(declare-fun Unit!12411 () Unit!12403)

(assert (=> b!173438 (= lt!266980 Unit!12411)))

(declare-fun lt!266957 () (_ BitVec 64))

(assert (=> b!173438 (= lt!266957 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!266960 () (_ BitVec 64))

(assert (=> b!173438 (= lt!266960 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!266989 () Unit!12403)

(assert (=> b!173438 (= lt!266989 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4545 (_2!8102 lt!266968)) lt!266960))))

(assert (=> b!173438 (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266968)))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187)) lt!266960)))

(declare-fun lt!266994 () Unit!12403)

(assert (=> b!173438 (= lt!266994 lt!266989)))

(declare-fun lt!267001 () tuple2!14932)

(assert (=> b!173438 (= lt!267001 (readNBitsLSBFirstsLoopPure!0 (_1!8103 lt!266953) nBits!340 #b00000000000000000000000000000000 lt!266957))))

(declare-fun lt!266965 () (_ BitVec 64))

(assert (=> b!173438 (= lt!266965 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!267000 () Unit!12403)

(assert (=> b!173438 (= lt!267000 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8102 lt!266997) (buf!4545 (_2!8102 lt!266968)) lt!266965))))

(assert (=> b!173438 (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266968)))) ((_ sign_extend 32) (currentByte!8632 (_2!8102 lt!266997))) ((_ sign_extend 32) (currentBit!8627 (_2!8102 lt!266997))) lt!266965)))

(declare-fun lt!266995 () Unit!12403)

(assert (=> b!173438 (= lt!266995 lt!267000)))

(declare-fun lt!266976 () tuple2!14932)

(assert (=> b!173438 (= lt!266976 (readNBitsLSBFirstsLoopPure!0 (_1!8103 lt!266982) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!266957 (ite (_2!8109 lt!267003) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!266987 () tuple2!14932)

(assert (=> b!173438 (= lt!266987 (readNBitsLSBFirstsLoopPure!0 (_1!8103 lt!266953) nBits!340 #b00000000000000000000000000000000 lt!266957))))

(declare-fun c!9114 () Bool)

(assert (=> b!173438 (= c!9114 (_2!8109 (readBitPure!0 (_1!8103 lt!266953))))))

(declare-fun lt!266961 () tuple2!14932)

(declare-fun withMovedBitIndex!0 (BitStream!7342 (_ BitVec 64)) BitStream!7342)

(assert (=> b!173438 (= lt!266961 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8103 lt!266953) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!266957 e!121066)))))

(declare-fun lt!266966 () Unit!12403)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12403)

(assert (=> b!173438 (= lt!266966 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8103 lt!266953) nBits!340 #b00000000000000000000000000000000 lt!266957))))

(assert (=> b!173438 (and (= (_2!8108 lt!266987) (_2!8108 lt!266961)) (= (_1!8108 lt!266987) (_1!8108 lt!266961)))))

(declare-fun lt!266981 () Unit!12403)

(assert (=> b!173438 (= lt!266981 lt!266966)))

(assert (=> b!173438 (= (_1!8103 lt!266953) (withMovedBitIndex!0 (_2!8103 lt!266953) (bvsub (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)) (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266968))) (currentByte!8632 (_2!8102 lt!266968)) (currentBit!8627 (_2!8102 lt!266968))))))))

(declare-fun lt!266979 () Unit!12403)

(declare-fun Unit!12412 () Unit!12403)

(assert (=> b!173438 (= lt!266979 Unit!12412)))

(assert (=> b!173438 (= (_1!8103 lt!266982) (withMovedBitIndex!0 (_2!8103 lt!266982) (bvsub (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266997))) (currentByte!8632 (_2!8102 lt!266997)) (currentBit!8627 (_2!8102 lt!266997))) (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266968))) (currentByte!8632 (_2!8102 lt!266968)) (currentBit!8627 (_2!8102 lt!266968))))))))

(declare-fun lt!266958 () Unit!12403)

(declare-fun Unit!12413 () Unit!12403)

(assert (=> b!173438 (= lt!266958 Unit!12413)))

(assert (=> b!173438 (= (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)) (bvsub (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266997))) (currentByte!8632 (_2!8102 lt!266997)) (currentBit!8627 (_2!8102 lt!266997))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!266983 () Unit!12403)

(declare-fun Unit!12414 () Unit!12403)

(assert (=> b!173438 (= lt!266983 Unit!12414)))

(assert (=> b!173438 (= (_2!8108 lt!267001) (_2!8108 lt!266976))))

(declare-fun lt!266970 () Unit!12403)

(declare-fun Unit!12415 () Unit!12403)

(assert (=> b!173438 (= lt!266970 Unit!12415)))

(assert (=> b!173438 (invariant!0 (currentBit!8627 (_2!8102 lt!266968)) (currentByte!8632 (_2!8102 lt!266968)) (size!4117 (buf!4545 (_2!8102 lt!266968))))))

(declare-fun lt!266998 () Unit!12403)

(declare-fun Unit!12416 () Unit!12403)

(assert (=> b!173438 (= lt!266998 Unit!12416)))

(assert (=> b!173438 (= (size!4117 (buf!4545 thiss!1187)) (size!4117 (buf!4545 (_2!8102 lt!266968))))))

(declare-fun lt!266975 () Unit!12403)

(declare-fun Unit!12417 () Unit!12403)

(assert (=> b!173438 (= lt!266975 Unit!12417)))

(assert (=> b!173438 (= (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266968))) (currentByte!8632 (_2!8102 lt!266968)) (currentBit!8627 (_2!8102 lt!266968))) (bvsub (bvadd (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!266962 () Unit!12403)

(declare-fun Unit!12418 () Unit!12403)

(assert (=> b!173438 (= lt!266962 Unit!12418)))

(declare-fun lt!266954 () Unit!12403)

(declare-fun Unit!12419 () Unit!12403)

(assert (=> b!173438 (= lt!266954 Unit!12419)))

(assert (=> b!173438 (= lt!266999 (reader!0 thiss!1187 (_2!8102 lt!266968)))))

(declare-fun lt!266993 () (_ BitVec 64))

(assert (=> b!173438 (= lt!266993 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!266967 () Unit!12403)

(assert (=> b!173438 (= lt!266967 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4545 (_2!8102 lt!266968)) lt!266993))))

(assert (=> b!173438 (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266968)))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187)) lt!266993)))

(declare-fun lt!266996 () Unit!12403)

(assert (=> b!173438 (= lt!266996 lt!266967)))

(assert (=> b!173438 (= lt!266992 (readNBitsLSBFirstsLoopPure!0 (_1!8103 lt!266999) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!143650 () Bool)

(assert (=> b!173438 (= res!143650 (= (_2!8108 lt!266992) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!173438 (=> (not res!143650) (not e!121069))))

(assert (=> b!173438 e!121069))

(declare-fun lt!267008 () Unit!12403)

(declare-fun Unit!12420 () Unit!12403)

(assert (=> b!173438 (= lt!267008 Unit!12420)))

(declare-fun b!173439 () Bool)

(assert (=> b!173439 (= e!121070 (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 thiss!1187))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187)) lt!266974))))

(assert (= (and d!61241 c!9113) b!173437))

(assert (= (and d!61241 (not c!9113)) b!173438))

(assert (= (and b!173438 res!143657) b!173427))

(assert (= (and b!173427 res!143651) b!173428))

(assert (= (and b!173428 res!143652) b!173431))

(assert (= (and b!173431 res!143660) b!173426))

(assert (= (and b!173438 res!143653) b!173429))

(assert (= (and b!173438 c!9114) b!173435))

(assert (= (and b!173438 (not c!9114)) b!173425))

(assert (= (and b!173438 res!143650) b!173436))

(assert (= (or b!173437 b!173428) bm!2858))

(assert (= (and d!61241 res!143661) b!173430))

(assert (= (and b!173430 res!143655) b!173432))

(assert (= (and b!173432 res!143658) b!173434))

(assert (= (and b!173434 res!143654) b!173424))

(assert (= (and b!173424 res!143659) b!173439))

(assert (= (and b!173424 res!143656) b!173433))

(declare-fun m!272493 () Bool)

(assert (=> bm!2858 m!272493))

(declare-fun m!272495 () Bool)

(assert (=> b!173424 m!272495))

(declare-fun m!272497 () Bool)

(assert (=> b!173424 m!272497))

(declare-fun m!272499 () Bool)

(assert (=> b!173424 m!272499))

(declare-fun m!272501 () Bool)

(assert (=> b!173424 m!272501))

(declare-fun m!272503 () Bool)

(assert (=> b!173424 m!272503))

(declare-fun m!272505 () Bool)

(assert (=> b!173424 m!272505))

(declare-fun m!272507 () Bool)

(assert (=> b!173439 m!272507))

(declare-fun m!272509 () Bool)

(assert (=> d!61241 m!272509))

(declare-fun m!272511 () Bool)

(assert (=> b!173434 m!272511))

(declare-fun m!272513 () Bool)

(assert (=> b!173438 m!272513))

(declare-fun m!272515 () Bool)

(assert (=> b!173438 m!272515))

(declare-fun m!272517 () Bool)

(assert (=> b!173438 m!272517))

(assert (=> b!173438 m!272501))

(declare-fun m!272519 () Bool)

(assert (=> b!173438 m!272519))

(declare-fun m!272521 () Bool)

(assert (=> b!173438 m!272521))

(declare-fun m!272523 () Bool)

(assert (=> b!173438 m!272523))

(declare-fun m!272525 () Bool)

(assert (=> b!173438 m!272525))

(declare-fun m!272527 () Bool)

(assert (=> b!173438 m!272527))

(declare-fun m!272529 () Bool)

(assert (=> b!173438 m!272529))

(declare-fun m!272531 () Bool)

(assert (=> b!173438 m!272531))

(declare-fun m!272533 () Bool)

(assert (=> b!173438 m!272533))

(declare-fun m!272535 () Bool)

(assert (=> b!173438 m!272535))

(declare-fun m!272537 () Bool)

(assert (=> b!173438 m!272537))

(assert (=> b!173438 m!272377))

(declare-fun m!272539 () Bool)

(assert (=> b!173438 m!272539))

(declare-fun m!272541 () Bool)

(assert (=> b!173438 m!272541))

(declare-fun m!272543 () Bool)

(assert (=> b!173438 m!272543))

(declare-fun m!272545 () Bool)

(assert (=> b!173438 m!272545))

(declare-fun m!272547 () Bool)

(assert (=> b!173438 m!272547))

(declare-fun m!272549 () Bool)

(assert (=> b!173438 m!272549))

(declare-fun m!272551 () Bool)

(assert (=> b!173438 m!272551))

(assert (=> b!173438 m!272499))

(declare-fun m!272553 () Bool)

(assert (=> b!173438 m!272553))

(declare-fun m!272555 () Bool)

(assert (=> b!173438 m!272555))

(declare-fun m!272557 () Bool)

(assert (=> b!173438 m!272557))

(declare-fun m!272559 () Bool)

(assert (=> b!173438 m!272559))

(declare-fun m!272561 () Bool)

(assert (=> b!173438 m!272561))

(declare-fun m!272563 () Bool)

(assert (=> b!173438 m!272563))

(declare-fun m!272565 () Bool)

(assert (=> b!173438 m!272565))

(assert (=> b!173438 m!272565))

(declare-fun m!272567 () Bool)

(assert (=> b!173438 m!272567))

(declare-fun m!272569 () Bool)

(assert (=> b!173438 m!272569))

(declare-fun m!272571 () Bool)

(assert (=> b!173438 m!272571))

(declare-fun m!272573 () Bool)

(assert (=> b!173438 m!272573))

(declare-fun m!272575 () Bool)

(assert (=> b!173437 m!272575))

(declare-fun m!272577 () Bool)

(assert (=> b!173431 m!272577))

(assert (=> b!173431 m!272577))

(declare-fun m!272579 () Bool)

(assert (=> b!173431 m!272579))

(declare-fun m!272581 () Bool)

(assert (=> b!173426 m!272581))

(declare-fun m!272583 () Bool)

(assert (=> b!173426 m!272583))

(assert (=> b!173427 m!272583))

(assert (=> b!173427 m!272377))

(declare-fun m!272585 () Bool)

(assert (=> b!173432 m!272585))

(assert (=> b!173432 m!272377))

(assert (=> b!173270 d!61241))

(declare-fun d!61265 () Bool)

(assert (=> d!61265 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 (_1!8103 lt!266687)))) ((_ sign_extend 32) (currentByte!8632 (_1!8103 lt!266687))) ((_ sign_extend 32) (currentBit!8627 (_1!8103 lt!266687))) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4117 (buf!4545 (_1!8103 lt!266687)))) ((_ sign_extend 32) (currentByte!8632 (_1!8103 lt!266687))) ((_ sign_extend 32) (currentBit!8627 (_1!8103 lt!266687)))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15256 () Bool)

(assert (= bs!15256 d!61265))

(declare-fun m!272587 () Bool)

(assert (=> bs!15256 m!272587))

(assert (=> b!173276 d!61265))

(declare-fun d!61267 () Bool)

(assert (=> d!61267 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266685)))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266685)))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15257 () Bool)

(assert (= bs!15257 d!61267))

(declare-fun m!272589 () Bool)

(assert (=> bs!15257 m!272589))

(assert (=> b!173276 d!61267))

(declare-fun d!61269 () Bool)

(assert (=> d!61269 (validate_offset_bits!1 ((_ sign_extend 32) (size!4117 (buf!4545 (_2!8102 lt!266685)))) ((_ sign_extend 32) (currentByte!8632 thiss!1187)) ((_ sign_extend 32) (currentBit!8627 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!267019 () Unit!12403)

(declare-fun choose!9 (BitStream!7342 array!9326 (_ BitVec 64) BitStream!7342) Unit!12403)

(assert (=> d!61269 (= lt!267019 (choose!9 thiss!1187 (buf!4545 (_2!8102 lt!266685)) ((_ sign_extend 32) nBits!340) (BitStream!7343 (buf!4545 (_2!8102 lt!266685)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187))))))

(assert (=> d!61269 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4545 (_2!8102 lt!266685)) ((_ sign_extend 32) nBits!340)) lt!267019)))

(declare-fun bs!15258 () Bool)

(assert (= bs!15258 d!61269))

(assert (=> bs!15258 m!272367))

(declare-fun m!272591 () Bool)

(assert (=> bs!15258 m!272591))

(assert (=> b!173276 d!61269))

(declare-fun b!173498 () Bool)

(declare-fun e!121104 () Unit!12403)

(declare-fun Unit!12422 () Unit!12403)

(assert (=> b!173498 (= e!121104 Unit!12422)))

(declare-fun b!173499 () Bool)

(declare-fun lt!267220 () Unit!12403)

(assert (=> b!173499 (= e!121104 lt!267220)))

(declare-fun lt!267229 () (_ BitVec 64))

(assert (=> b!173499 (= lt!267229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!267228 () (_ BitVec 64))

(assert (=> b!173499 (= lt!267228 (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9326 array!9326 (_ BitVec 64) (_ BitVec 64)) Unit!12403)

(assert (=> b!173499 (= lt!267220 (arrayBitRangesEqSymmetric!0 (buf!4545 thiss!1187) (buf!4545 (_2!8102 lt!266685)) lt!267229 lt!267228))))

(assert (=> b!173499 (arrayBitRangesEq!0 (buf!4545 (_2!8102 lt!266685)) (buf!4545 thiss!1187) lt!267229 lt!267228)))

(declare-fun b!173500 () Bool)

(declare-fun res!143705 () Bool)

(declare-fun e!121105 () Bool)

(assert (=> b!173500 (=> (not res!143705) (not e!121105))))

(declare-fun lt!267235 () tuple2!14922)

(assert (=> b!173500 (= res!143705 (isPrefixOf!0 (_2!8103 lt!267235) (_2!8102 lt!266685)))))

(declare-fun d!61271 () Bool)

(assert (=> d!61271 e!121105))

(declare-fun res!143706 () Bool)

(assert (=> d!61271 (=> (not res!143706) (not e!121105))))

(assert (=> d!61271 (= res!143706 (isPrefixOf!0 (_1!8103 lt!267235) (_2!8103 lt!267235)))))

(declare-fun lt!267230 () BitStream!7342)

(assert (=> d!61271 (= lt!267235 (tuple2!14923 lt!267230 (_2!8102 lt!266685)))))

(declare-fun lt!267239 () Unit!12403)

(declare-fun lt!267221 () Unit!12403)

(assert (=> d!61271 (= lt!267239 lt!267221)))

(assert (=> d!61271 (isPrefixOf!0 lt!267230 (_2!8102 lt!266685))))

(assert (=> d!61271 (= lt!267221 (lemmaIsPrefixTransitive!0 lt!267230 (_2!8102 lt!266685) (_2!8102 lt!266685)))))

(declare-fun lt!267223 () Unit!12403)

(declare-fun lt!267232 () Unit!12403)

(assert (=> d!61271 (= lt!267223 lt!267232)))

(assert (=> d!61271 (isPrefixOf!0 lt!267230 (_2!8102 lt!266685))))

(assert (=> d!61271 (= lt!267232 (lemmaIsPrefixTransitive!0 lt!267230 thiss!1187 (_2!8102 lt!266685)))))

(declare-fun lt!267225 () Unit!12403)

(assert (=> d!61271 (= lt!267225 e!121104)))

(declare-fun c!9123 () Bool)

(assert (=> d!61271 (= c!9123 (not (= (size!4117 (buf!4545 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!267227 () Unit!12403)

(declare-fun lt!267236 () Unit!12403)

(assert (=> d!61271 (= lt!267227 lt!267236)))

(assert (=> d!61271 (isPrefixOf!0 (_2!8102 lt!266685) (_2!8102 lt!266685))))

(assert (=> d!61271 (= lt!267236 (lemmaIsPrefixRefl!0 (_2!8102 lt!266685)))))

(declare-fun lt!267238 () Unit!12403)

(declare-fun lt!267231 () Unit!12403)

(assert (=> d!61271 (= lt!267238 lt!267231)))

(assert (=> d!61271 (= lt!267231 (lemmaIsPrefixRefl!0 (_2!8102 lt!266685)))))

(declare-fun lt!267226 () Unit!12403)

(declare-fun lt!267222 () Unit!12403)

(assert (=> d!61271 (= lt!267226 lt!267222)))

(assert (=> d!61271 (isPrefixOf!0 lt!267230 lt!267230)))

(assert (=> d!61271 (= lt!267222 (lemmaIsPrefixRefl!0 lt!267230))))

(declare-fun lt!267224 () Unit!12403)

(declare-fun lt!267234 () Unit!12403)

(assert (=> d!61271 (= lt!267224 lt!267234)))

(assert (=> d!61271 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61271 (= lt!267234 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61271 (= lt!267230 (BitStream!7343 (buf!4545 (_2!8102 lt!266685)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)))))

(assert (=> d!61271 (isPrefixOf!0 thiss!1187 (_2!8102 lt!266685))))

(assert (=> d!61271 (= (reader!0 thiss!1187 (_2!8102 lt!266685)) lt!267235)))

(declare-fun b!173501 () Bool)

(declare-fun res!143704 () Bool)

(assert (=> b!173501 (=> (not res!143704) (not e!121105))))

(assert (=> b!173501 (= res!143704 (isPrefixOf!0 (_1!8103 lt!267235) thiss!1187))))

(declare-fun b!173502 () Bool)

(declare-fun lt!267233 () (_ BitVec 64))

(declare-fun lt!267237 () (_ BitVec 64))

(assert (=> b!173502 (= e!121105 (= (_1!8103 lt!267235) (withMovedBitIndex!0 (_2!8103 lt!267235) (bvsub lt!267233 lt!267237))))))

(assert (=> b!173502 (or (= (bvand lt!267233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267237 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!267233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!267233 lt!267237) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173502 (= lt!267237 (bitIndex!0 (size!4117 (buf!4545 (_2!8102 lt!266685))) (currentByte!8632 (_2!8102 lt!266685)) (currentBit!8627 (_2!8102 lt!266685))))))

(assert (=> b!173502 (= lt!267233 (bitIndex!0 (size!4117 (buf!4545 thiss!1187)) (currentByte!8632 thiss!1187) (currentBit!8627 thiss!1187)))))

(assert (= (and d!61271 c!9123) b!173499))

(assert (= (and d!61271 (not c!9123)) b!173498))

(assert (= (and d!61271 res!143706) b!173501))

(assert (= (and b!173501 res!143704) b!173500))

(assert (= (and b!173500 res!143705) b!173502))

(declare-fun m!272593 () Bool)

(assert (=> b!173501 m!272593))

(assert (=> b!173499 m!272377))

(declare-fun m!272595 () Bool)

(assert (=> b!173499 m!272595))

(declare-fun m!272597 () Bool)

(assert (=> b!173499 m!272597))

(declare-fun m!272599 () Bool)

(assert (=> d!61271 m!272599))

(declare-fun m!272601 () Bool)

(assert (=> d!61271 m!272601))

(declare-fun m!272603 () Bool)

(assert (=> d!61271 m!272603))

(declare-fun m!272607 () Bool)

(assert (=> d!61271 m!272607))

(declare-fun m!272609 () Bool)

(assert (=> d!61271 m!272609))

(declare-fun m!272613 () Bool)

(assert (=> d!61271 m!272613))

(declare-fun m!272615 () Bool)

(assert (=> d!61271 m!272615))

(assert (=> d!61271 m!272381))

(assert (=> d!61271 m!272575))

(declare-fun m!272619 () Bool)

(assert (=> d!61271 m!272619))

(declare-fun m!272621 () Bool)

(assert (=> d!61271 m!272621))

(declare-fun m!272625 () Bool)

(assert (=> b!173500 m!272625))

(declare-fun m!272627 () Bool)

(assert (=> b!173502 m!272627))

(assert (=> b!173502 m!272375))

(assert (=> b!173502 m!272377))

(assert (=> b!173276 d!61271))

(declare-fun d!61273 () Bool)

(assert (=> d!61273 (= (array_inv!3858 (buf!4545 thiss!1187)) (bvsge (size!4117 (buf!4545 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173271 d!61273))

(declare-fun d!61275 () Bool)

(assert (=> d!61275 (= (invariant!0 (currentBit!8627 thiss!1187) (currentByte!8632 thiss!1187) (size!4117 (buf!4545 thiss!1187))) (and (bvsge (currentBit!8627 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8627 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8632 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8632 thiss!1187) (size!4117 (buf!4545 thiss!1187))) (and (= (currentBit!8627 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8632 thiss!1187) (size!4117 (buf!4545 thiss!1187)))))))))

(assert (=> b!173272 d!61275))

(push 1)

(assert (not d!61213))

(assert (not d!61269))

(assert (not d!61239))

(assert (not b!173427))

(assert (not b!173432))

(assert (not b!173500))

(assert (not d!61241))

(assert (not b!173342))

(assert (not b!173340))

(assert (not d!61229))

(assert (not d!61267))

(assert (not b!173431))

(assert (not b!173438))

(assert (not d!61265))

(assert (not b!173437))

(assert (not bm!2858))

(assert (not b!173434))

(assert (not d!61237))

(assert (not d!61271))

(assert (not b!173439))

(assert (not b!173424))

(assert (not b!173499))

(assert (not b!173501))

(assert (not b!173502))

(assert (not b!173426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

