; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!238 () Bool)

(assert start!238)

(declare-fun b!595 () Bool)

(declare-fun e!312 () Bool)

(declare-datatypes ((array!81 0))(
  ( (array!82 (arr!418 (Array (_ BitVec 32) (_ BitVec 8))) (size!31 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!46 0))(
  ( (BitStream!47 (buf!343 array!81) (currentByte!1250 (_ BitVec 32)) (currentBit!1245 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!46)

(declare-fun array_inv!28 (array!81) Bool)

(assert (=> b!595 (= e!312 (array_inv!28 (buf!343 thiss!932)))))

(declare-fun b!596 () Bool)

(declare-fun e!309 () Bool)

(declare-datatypes ((tuple2!16 0))(
  ( (tuple2!17 (_1!8 BitStream!46) (_2!8 Bool)) )
))
(declare-fun lt!180 () tuple2!16)

(declare-fun lt!182 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!596 (= e!309 (= (bitIndex!0 (size!31 (buf!343 (_1!8 lt!180))) (currentByte!1250 (_1!8 lt!180)) (currentBit!1245 (_1!8 lt!180))) lt!182))))

(declare-fun b!597 () Bool)

(declare-fun e!308 () Bool)

(declare-fun e!311 () Bool)

(assert (=> b!597 (= e!308 e!311)))

(declare-fun res!2694 () Bool)

(assert (=> b!597 (=> (not res!2694) (not e!311))))

(declare-fun lt!179 () (_ BitVec 64))

(assert (=> b!597 (= res!2694 (= lt!182 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!179)))))

(declare-datatypes ((Unit!7 0))(
  ( (Unit!8) )
))
(declare-datatypes ((tuple2!18 0))(
  ( (tuple2!19 (_1!9 Unit!7) (_2!9 BitStream!46)) )
))
(declare-fun lt!181 () tuple2!18)

(assert (=> b!597 (= lt!182 (bitIndex!0 (size!31 (buf!343 (_2!9 lt!181))) (currentByte!1250 (_2!9 lt!181)) (currentBit!1245 (_2!9 lt!181))))))

(assert (=> b!597 (= lt!179 (bitIndex!0 (size!31 (buf!343 thiss!932)) (currentByte!1250 thiss!932) (currentBit!1245 thiss!932)))))

(declare-fun b!598 () Bool)

(declare-fun e!310 () Bool)

(declare-fun e!314 () Bool)

(assert (=> b!598 (= e!310 (not e!314))))

(declare-fun res!2695 () Bool)

(assert (=> b!598 (=> res!2695 e!314)))

(assert (=> b!598 (= res!2695 (not (= (size!31 (buf!343 (_2!9 lt!181))) (size!31 (buf!343 thiss!932)))))))

(assert (=> b!598 e!308))

(declare-fun res!2692 () Bool)

(assert (=> b!598 (=> (not res!2692) (not e!308))))

(assert (=> b!598 (= res!2692 (= (size!31 (buf!343 thiss!932)) (size!31 (buf!343 (_2!9 lt!181)))))))

(declare-fun appendBit!0 (BitStream!46 Bool) tuple2!18)

(assert (=> b!598 (= lt!181 (appendBit!0 thiss!932 true))))

(declare-fun res!2691 () Bool)

(assert (=> start!238 (=> (not res!2691) (not e!310))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!238 (= res!2691 (validate_offset_bit!0 ((_ sign_extend 32) (size!31 (buf!343 thiss!932))) ((_ sign_extend 32) (currentByte!1250 thiss!932)) ((_ sign_extend 32) (currentBit!1245 thiss!932))))))

(assert (=> start!238 e!310))

(declare-fun inv!12 (BitStream!46) Bool)

(assert (=> start!238 (and (inv!12 thiss!932) e!312)))

(declare-fun b!599 () Bool)

(declare-fun res!2693 () Bool)

(assert (=> b!599 (=> (not res!2693) (not e!311))))

(declare-fun isPrefixOf!0 (BitStream!46 BitStream!46) Bool)

(assert (=> b!599 (= res!2693 (isPrefixOf!0 thiss!932 (_2!9 lt!181)))))

(declare-fun b!600 () Bool)

(assert (=> b!600 (= e!311 e!309)))

(declare-fun res!2690 () Bool)

(assert (=> b!600 (=> (not res!2690) (not e!309))))

(assert (=> b!600 (= res!2690 (and (_2!8 lt!180) (= (_1!8 lt!180) (_2!9 lt!181))))))

(declare-fun readBitPure!0 (BitStream!46) tuple2!16)

(declare-fun readerFrom!0 (BitStream!46 (_ BitVec 32) (_ BitVec 32)) BitStream!46)

(assert (=> b!600 (= lt!180 (readBitPure!0 (readerFrom!0 (_2!9 lt!181) (currentBit!1245 thiss!932) (currentByte!1250 thiss!932))))))

(declare-fun b!601 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!601 (= e!314 (invariant!0 (currentBit!1245 thiss!932) (currentByte!1250 thiss!932) (size!31 (buf!343 thiss!932))))))

(assert (= (and start!238 res!2691) b!598))

(assert (= (and b!598 res!2692) b!597))

(assert (= (and b!597 res!2694) b!599))

(assert (= (and b!599 res!2693) b!600))

(assert (= (and b!600 res!2690) b!596))

(assert (= (and b!598 (not res!2695)) b!601))

(assert (= start!238 b!595))

(declare-fun m!325 () Bool)

(assert (=> b!596 m!325))

(declare-fun m!327 () Bool)

(assert (=> b!598 m!327))

(declare-fun m!329 () Bool)

(assert (=> start!238 m!329))

(declare-fun m!331 () Bool)

(assert (=> start!238 m!331))

(declare-fun m!333 () Bool)

(assert (=> b!595 m!333))

(declare-fun m!335 () Bool)

(assert (=> b!600 m!335))

(assert (=> b!600 m!335))

(declare-fun m!337 () Bool)

(assert (=> b!600 m!337))

(declare-fun m!339 () Bool)

(assert (=> b!597 m!339))

(declare-fun m!341 () Bool)

(assert (=> b!597 m!341))

(declare-fun m!343 () Bool)

(assert (=> b!601 m!343))

(declare-fun m!345 () Bool)

(assert (=> b!599 m!345))

(push 1)

(assert (not b!601))

(assert (not start!238))

(assert (not b!597))

(assert (not b!596))

(assert (not b!599))

(assert (not b!595))

(assert (not b!598))

(assert (not b!600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!912 () Bool)

(declare-fun e!371 () Bool)

(assert (=> d!912 e!371))

(declare-fun res!2754 () Bool)

(assert (=> d!912 (=> (not res!2754) (not e!371))))

(declare-fun lt!222 () (_ BitVec 64))

(declare-fun lt!221 () (_ BitVec 64))

(declare-fun lt!224 () (_ BitVec 64))

(assert (=> d!912 (= res!2754 (= lt!221 (bvsub lt!224 lt!222)))))

(assert (=> d!912 (or (= (bvand lt!224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!224 lt!222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!912 (= lt!222 (remainingBits!0 ((_ sign_extend 32) (size!31 (buf!343 (_1!8 lt!180)))) ((_ sign_extend 32) (currentByte!1250 (_1!8 lt!180))) ((_ sign_extend 32) (currentBit!1245 (_1!8 lt!180)))))))

(declare-fun lt!223 () (_ BitVec 64))

(declare-fun lt!225 () (_ BitVec 64))

(assert (=> d!912 (= lt!224 (bvmul lt!223 lt!225))))

(assert (=> d!912 (or (= lt!223 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225 (bvsdiv (bvmul lt!223 lt!225) lt!223)))))

(assert (=> d!912 (= lt!225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!912 (= lt!223 ((_ sign_extend 32) (size!31 (buf!343 (_1!8 lt!180)))))))

(assert (=> d!912 (= lt!221 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1250 (_1!8 lt!180))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1245 (_1!8 lt!180)))))))

(assert (=> d!912 (invariant!0 (currentBit!1245 (_1!8 lt!180)) (currentByte!1250 (_1!8 lt!180)) (size!31 (buf!343 (_1!8 lt!180))))))

(assert (=> d!912 (= (bitIndex!0 (size!31 (buf!343 (_1!8 lt!180))) (currentByte!1250 (_1!8 lt!180)) (currentBit!1245 (_1!8 lt!180))) lt!221)))

(declare-fun b!666 () Bool)

(declare-fun res!2755 () Bool)

(assert (=> b!666 (=> (not res!2755) (not e!371))))

(assert (=> b!666 (= res!2755 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221))))

(declare-fun b!667 () Bool)

(declare-fun lt!226 () (_ BitVec 64))

(assert (=> b!667 (= e!371 (bvsle lt!221 (bvmul lt!226 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!667 (or (= lt!226 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226)))))

(assert (=> b!667 (= lt!226 ((_ sign_extend 32) (size!31 (buf!343 (_1!8 lt!180)))))))

(assert (= (and d!912 res!2754) b!666))

(assert (= (and b!666 res!2755) b!667))

(declare-fun m!397 () Bool)

(assert (=> d!912 m!397))

(declare-fun m!399 () Bool)

(assert (=> d!912 m!399))

(assert (=> b!596 d!912))

(declare-fun d!924 () Bool)

(assert (=> d!924 (= (invariant!0 (currentBit!1245 thiss!932) (currentByte!1250 thiss!932) (size!31 (buf!343 thiss!932))) (and (bvsge (currentBit!1245 thiss!932) #b00000000000000000000000000000000) (bvslt (currentBit!1245 thiss!932) #b00000000000000000000000000001000) (bvsge (currentByte!1250 thiss!932) #b00000000000000000000000000000000) (or (bvslt (currentByte!1250 thiss!932) (size!31 (buf!343 thiss!932))) (and (= (currentBit!1245 thiss!932) #b00000000000000000000000000000000) (= (currentByte!1250 thiss!932) (size!31 (buf!343 thiss!932)))))))))

(assert (=> b!601 d!924))

(declare-fun b!702 () Bool)

(declare-fun res!2787 () Bool)

(declare-fun e!387 () Bool)

(assert (=> b!702 (=> (not res!2787) (not e!387))))

(declare-fun lt!277 () tuple2!18)

(assert (=> b!702 (= res!2787 (isPrefixOf!0 thiss!932 (_2!9 lt!277)))))

(declare-fun d!926 () Bool)

(assert (=> d!926 e!387))

(declare-fun res!2789 () Bool)

(assert (=> d!926 (=> (not res!2789) (not e!387))))

(assert (=> d!926 (= res!2789 (= (size!31 (buf!343 thiss!932)) (size!31 (buf!343 (_2!9 lt!277)))))))

(declare-fun choose!16 (BitStream!46 Bool) tuple2!18)

(assert (=> d!926 (= lt!277 (choose!16 thiss!932 true))))

(assert (=> d!926 (validate_offset_bit!0 ((_ sign_extend 32) (size!31 (buf!343 thiss!932))) ((_ sign_extend 32) (currentByte!1250 thiss!932)) ((_ sign_extend 32) (currentBit!1245 thiss!932)))))

(assert (=> d!926 (= (appendBit!0 thiss!932 true) lt!277)))

(declare-fun b!701 () Bool)

(declare-fun res!2788 () Bool)

(assert (=> b!701 (=> (not res!2788) (not e!387))))

(declare-fun lt!279 () (_ BitVec 64))

(declare-fun lt!278 () (_ BitVec 64))

(assert (=> b!701 (= res!2788 (= (bitIndex!0 (size!31 (buf!343 (_2!9 lt!277))) (currentByte!1250 (_2!9 lt!277)) (currentBit!1245 (_2!9 lt!277))) (bvadd lt!279 lt!278)))))

(assert (=> b!701 (or (not (= (bvand lt!279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!279 lt!278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!701 (= lt!278 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!701 (= lt!279 (bitIndex!0 (size!31 (buf!343 thiss!932)) (currentByte!1250 thiss!932) (currentBit!1245 thiss!932)))))

(declare-fun b!704 () Bool)

(declare-fun e!388 () Bool)

(declare-fun lt!280 () tuple2!16)

(assert (=> b!704 (= e!388 (= (bitIndex!0 (size!31 (buf!343 (_1!8 lt!280))) (currentByte!1250 (_1!8 lt!280)) (currentBit!1245 (_1!8 lt!280))) (bitIndex!0 (size!31 (buf!343 (_2!9 lt!277))) (currentByte!1250 (_2!9 lt!277)) (currentBit!1245 (_2!9 lt!277)))))))

(declare-fun b!703 () Bool)

(assert (=> b!703 (= e!387 e!388)))

(declare-fun res!2786 () Bool)

(assert (=> b!703 (=> (not res!2786) (not e!388))))

(assert (=> b!703 (= res!2786 (and (= (_2!8 lt!280) true) (= (_1!8 lt!280) (_2!9 lt!277))))))

(assert (=> b!703 (= lt!280 (readBitPure!0 (readerFrom!0 (_2!9 lt!277) (currentBit!1245 thiss!932) (currentByte!1250 thiss!932))))))

(assert (= (and d!926 res!2789) b!701))

(assert (= (and b!701 res!2788) b!702))

(assert (= (and b!702 res!2787) b!703))

(assert (= (and b!703 res!2786) b!704))

(declare-fun m!423 () Bool)

(assert (=> b!701 m!423))

(assert (=> b!701 m!341))

(declare-fun m!425 () Bool)

(assert (=> b!702 m!425))

(declare-fun m!427 () Bool)

(assert (=> b!703 m!427))

(assert (=> b!703 m!427))

(declare-fun m!429 () Bool)

(assert (=> b!703 m!429))

(declare-fun m!431 () Bool)

(assert (=> d!926 m!431))

(assert (=> d!926 m!329))

(declare-fun m!433 () Bool)

(assert (=> b!704 m!433))

(assert (=> b!704 m!423))

(assert (=> b!598 d!926))

(declare-fun d!940 () Bool)

(declare-fun e!393 () Bool)

(assert (=> d!940 e!393))

(declare-fun res!2798 () Bool)

(assert (=> d!940 (=> (not res!2798) (not e!393))))

(declare-fun lt!289 () (_ BitVec 64))

(declare-fun lt!292 () (_ BitVec 64))

(declare-fun lt!290 () (_ BitVec 64))

(assert (=> d!940 (= res!2798 (= lt!289 (bvsub lt!292 lt!290)))))

(assert (=> d!940 (or (= (bvand lt!292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292 lt!290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!940 (= lt!290 (remainingBits!0 ((_ sign_extend 32) (size!31 (buf!343 (_2!9 lt!181)))) ((_ sign_extend 32) (currentByte!1250 (_2!9 lt!181))) ((_ sign_extend 32) (currentBit!1245 (_2!9 lt!181)))))))

(declare-fun lt!291 () (_ BitVec 64))

(declare-fun lt!293 () (_ BitVec 64))

(assert (=> d!940 (= lt!292 (bvmul lt!291 lt!293))))

(assert (=> d!940 (or (= lt!291 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!293 (bvsdiv (bvmul lt!291 lt!293) lt!291)))))

(assert (=> d!940 (= lt!293 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!940 (= lt!291 ((_ sign_extend 32) (size!31 (buf!343 (_2!9 lt!181)))))))

(assert (=> d!940 (= lt!289 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1250 (_2!9 lt!181))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1245 (_2!9 lt!181)))))))

(assert (=> d!940 (invariant!0 (currentBit!1245 (_2!9 lt!181)) (currentByte!1250 (_2!9 lt!181)) (size!31 (buf!343 (_2!9 lt!181))))))

(assert (=> d!940 (= (bitIndex!0 (size!31 (buf!343 (_2!9 lt!181))) (currentByte!1250 (_2!9 lt!181)) (currentBit!1245 (_2!9 lt!181))) lt!289)))

(declare-fun b!713 () Bool)

(declare-fun res!2799 () Bool)

(assert (=> b!713 (=> (not res!2799) (not e!393))))

(assert (=> b!713 (= res!2799 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289))))

(declare-fun b!714 () Bool)

(declare-fun lt!294 () (_ BitVec 64))

(assert (=> b!714 (= e!393 (bvsle lt!289 (bvmul lt!294 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!714 (or (= lt!294 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!294 #b0000000000000000000000000000000000000000000000000000000000001000) lt!294)))))

(assert (=> b!714 (= lt!294 ((_ sign_extend 32) (size!31 (buf!343 (_2!9 lt!181)))))))

(assert (= (and d!940 res!2798) b!713))

(assert (= (and b!713 res!2799) b!714))

(declare-fun m!435 () Bool)

(assert (=> d!940 m!435))

(declare-fun m!439 () Bool)

(assert (=> d!940 m!439))

(assert (=> b!597 d!940))

(declare-fun d!944 () Bool)

(declare-fun e!394 () Bool)

(assert (=> d!944 e!394))

(declare-fun res!2800 () Bool)

(assert (=> d!944 (=> (not res!2800) (not e!394))))

(declare-fun lt!299 () (_ BitVec 64))

(declare-fun lt!296 () (_ BitVec 64))

(declare-fun lt!297 () (_ BitVec 64))

(assert (=> d!944 (= res!2800 (= lt!296 (bvsub lt!299 lt!297)))))

(assert (=> d!944 (or (= (bvand lt!299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!299 lt!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!944 (= lt!297 (remainingBits!0 ((_ sign_extend 32) (size!31 (buf!343 thiss!932))) ((_ sign_extend 32) (currentByte!1250 thiss!932)) ((_ sign_extend 32) (currentBit!1245 thiss!932))))))

(declare-fun lt!298 () (_ BitVec 64))

(declare-fun lt!300 () (_ BitVec 64))

(assert (=> d!944 (= lt!299 (bvmul lt!298 lt!300))))

(assert (=> d!944 (or (= lt!298 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!300 (bvsdiv (bvmul lt!298 lt!300) lt!298)))))

(assert (=> d!944 (= lt!300 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!944 (= lt!298 ((_ sign_extend 32) (size!31 (buf!343 thiss!932))))))

(assert (=> d!944 (= lt!296 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1250 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1245 thiss!932))))))

(assert (=> d!944 (invariant!0 (currentBit!1245 thiss!932) (currentByte!1250 thiss!932) (size!31 (buf!343 thiss!932)))))

(assert (=> d!944 (= (bitIndex!0 (size!31 (buf!343 thiss!932)) (currentByte!1250 thiss!932) (currentBit!1245 thiss!932)) lt!296)))

(declare-fun b!715 () Bool)

(declare-fun res!2801 () Bool)

(assert (=> b!715 (=> (not res!2801) (not e!394))))

(assert (=> b!715 (= res!2801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296))))

(declare-fun b!716 () Bool)

(declare-fun lt!301 () (_ BitVec 64))

(assert (=> b!716 (= e!394 (bvsle lt!296 (bvmul lt!301 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!716 (or (= lt!301 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301)))))

(assert (=> b!716 (= lt!301 ((_ sign_extend 32) (size!31 (buf!343 thiss!932))))))

(assert (= (and d!944 res!2800) b!715))

(assert (= (and b!715 res!2801) b!716))

(declare-fun m!441 () Bool)

(assert (=> d!944 m!441))

(assert (=> d!944 m!343))

(assert (=> b!597 d!944))

(declare-fun d!946 () Bool)

(declare-fun res!2818 () Bool)

(declare-fun e!404 () Bool)

(assert (=> d!946 (=> (not res!2818) (not e!404))))

(assert (=> d!946 (= res!2818 (= (size!31 (buf!343 thiss!932)) (size!31 (buf!343 (_2!9 lt!181)))))))

(assert (=> d!946 (= (isPrefixOf!0 thiss!932 (_2!9 lt!181)) e!404)))

(declare-fun b!730 () Bool)

(declare-fun res!2817 () Bool)

(assert (=> b!730 (=> (not res!2817) (not e!404))))

(assert (=> b!730 (= res!2817 (bvsle (bitIndex!0 (size!31 (buf!343 thiss!932)) (currentByte!1250 thiss!932) (currentBit!1245 thiss!932)) (bitIndex!0 (size!31 (buf!343 (_2!9 lt!181))) (currentByte!1250 (_2!9 lt!181)) (currentBit!1245 (_2!9 lt!181)))))))

(declare-fun b!731 () Bool)

(declare-fun e!405 () Bool)

(assert (=> b!731 (= e!404 e!405)))

(declare-fun res!2816 () Bool)

(assert (=> b!731 (=> res!2816 e!405)))

(assert (=> b!731 (= res!2816 (= (size!31 (buf!343 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!732 () Bool)

(declare-fun arrayBitRangesEq!0 (array!81 array!81 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!732 (= e!405 (arrayBitRangesEq!0 (buf!343 thiss!932) (buf!343 (_2!9 lt!181)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!31 (buf!343 thiss!932)) (currentByte!1250 thiss!932) (currentBit!1245 thiss!932))))))

(assert (= (and d!946 res!2818) b!730))

(assert (= (and b!730 res!2817) b!731))

(assert (= (and b!731 (not res!2816)) b!732))

(assert (=> b!730 m!341))

(assert (=> b!730 m!339))

(assert (=> b!732 m!341))

(assert (=> b!732 m!341))

(declare-fun m!459 () Bool)

(assert (=> b!732 m!459))

(assert (=> b!599 d!946))

(declare-fun d!954 () Bool)

(assert (=> d!954 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!31 (buf!343 thiss!932))) ((_ sign_extend 32) (currentByte!1250 thiss!932)) ((_ sign_extend 32) (currentBit!1245 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!31 (buf!343 thiss!932))) ((_ sign_extend 32) (currentByte!1250 thiss!932)) ((_ sign_extend 32) (currentBit!1245 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!395 () Bool)

(assert (= bs!395 d!954))

(assert (=> bs!395 m!441))

(assert (=> start!238 d!954))

(declare-fun d!956 () Bool)

(assert (=> d!956 (= (inv!12 thiss!932) (invariant!0 (currentBit!1245 thiss!932) (currentByte!1250 thiss!932) (size!31 (buf!343 thiss!932))))))

(declare-fun bs!397 () Bool)

(assert (= bs!397 d!956))

(assert (=> bs!397 m!343))

(assert (=> start!238 d!956))

(declare-fun d!960 () Bool)

(assert (=> d!960 (= (array_inv!28 (buf!343 thiss!932)) (bvsge (size!31 (buf!343 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!595 d!960))

(declare-fun d!962 () Bool)

(declare-datatypes ((tuple2!30 0))(
  ( (tuple2!31 (_1!15 Bool) (_2!15 BitStream!46)) )
))
(declare-fun lt!313 () tuple2!30)

(declare-fun readBit!0 (BitStream!46) tuple2!30)

(assert (=> d!962 (= lt!313 (readBit!0 (readerFrom!0 (_2!9 lt!181) (currentBit!1245 thiss!932) (currentByte!1250 thiss!932))))))

(assert (=> d!962 (= (readBitPure!0 (readerFrom!0 (_2!9 lt!181) (currentBit!1245 thiss!932) (currentByte!1250 thiss!932))) (tuple2!17 (_2!15 lt!313) (_1!15 lt!313)))))

(declare-fun bs!398 () Bool)

(assert (= bs!398 d!962))

(assert (=> bs!398 m!335))

(declare-fun m!465 () Bool)

(assert (=> bs!398 m!465))

(assert (=> b!600 d!962))

(declare-fun d!966 () Bool)

(declare-fun e!415 () Bool)

(assert (=> d!966 e!415))

(declare-fun res!2834 () Bool)

(assert (=> d!966 (=> (not res!2834) (not e!415))))

(assert (=> d!966 (= res!2834 (invariant!0 (currentBit!1245 (_2!9 lt!181)) (currentByte!1250 (_2!9 lt!181)) (size!31 (buf!343 (_2!9 lt!181)))))))

(assert (=> d!966 (= (readerFrom!0 (_2!9 lt!181) (currentBit!1245 thiss!932) (currentByte!1250 thiss!932)) (BitStream!47 (buf!343 (_2!9 lt!181)) (currentByte!1250 thiss!932) (currentBit!1245 thiss!932)))))

(declare-fun b!746 () Bool)

(assert (=> b!746 (= e!415 (invariant!0 (currentBit!1245 thiss!932) (currentByte!1250 thiss!932) (size!31 (buf!343 (_2!9 lt!181)))))))

(assert (= (and d!966 res!2834) b!746))

(assert (=> d!966 m!439))

(declare-fun m!469 () Bool)

(assert (=> b!746 m!469))

(assert (=> b!600 d!966))

(push 1)

(assert (not b!703))

(assert (not d!940))

(assert (not b!702))

(assert (not d!926))

(assert (not b!704))

(assert (not b!701))

(assert (not d!954))

(assert (not b!730))

(assert (not b!732))

(assert (not d!956))

(assert (not b!746))

(assert (not d!912))

(assert (not d!944))

(assert (not d!962))

(assert (not d!966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

