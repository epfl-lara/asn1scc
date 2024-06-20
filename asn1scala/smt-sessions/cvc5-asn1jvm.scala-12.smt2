; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!298 () Bool)

(assert start!298)

(declare-fun b!767 () Bool)

(declare-fun e!435 () Bool)

(declare-fun e!437 () Bool)

(assert (=> b!767 (= e!435 e!437)))

(declare-fun res!2853 () Bool)

(assert (=> b!767 (=> (not res!2853) (not e!437))))

(declare-fun lt!352 () (_ BitVec 64))

(declare-fun lt!353 () (_ BitVec 64))

(assert (=> b!767 (= res!2853 (= lt!352 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!353)))))

(declare-datatypes ((array!90 0))(
  ( (array!91 (arr!421 (Array (_ BitVec 32) (_ BitVec 8))) (size!34 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!52 0))(
  ( (BitStream!53 (buf!346 array!90) (currentByte!1262 (_ BitVec 32)) (currentBit!1257 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13 0))(
  ( (Unit!14) )
))
(declare-datatypes ((tuple2!34 0))(
  ( (tuple2!35 (_1!17 Unit!13) (_2!17 BitStream!52)) )
))
(declare-fun lt!350 () tuple2!34)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!767 (= lt!352 (bitIndex!0 (size!34 (buf!346 (_2!17 lt!350))) (currentByte!1262 (_2!17 lt!350)) (currentBit!1257 (_2!17 lt!350))))))

(declare-fun thiss!932 () BitStream!52)

(assert (=> b!767 (= lt!353 (bitIndex!0 (size!34 (buf!346 thiss!932)) (currentByte!1262 thiss!932) (currentBit!1257 thiss!932)))))

(declare-fun b!768 () Bool)

(declare-fun res!2860 () Bool)

(assert (=> b!768 (=> (not res!2860) (not e!437))))

(declare-fun isPrefixOf!0 (BitStream!52 BitStream!52) Bool)

(assert (=> b!768 (= res!2860 (isPrefixOf!0 thiss!932 (_2!17 lt!350)))))

(declare-fun b!769 () Bool)

(declare-fun e!431 () Bool)

(declare-fun e!433 () Bool)

(assert (=> b!769 (= e!431 (not e!433))))

(declare-fun res!2857 () Bool)

(assert (=> b!769 (=> res!2857 e!433)))

(assert (=> b!769 (= res!2857 (not (= (size!34 (buf!346 (_2!17 lt!350))) (size!34 (buf!346 thiss!932)))))))

(assert (=> b!769 e!435))

(declare-fun res!2855 () Bool)

(assert (=> b!769 (=> (not res!2855) (not e!435))))

(assert (=> b!769 (= res!2855 (= (size!34 (buf!346 thiss!932)) (size!34 (buf!346 (_2!17 lt!350)))))))

(declare-fun appendBit!0 (BitStream!52 Bool) tuple2!34)

(assert (=> b!769 (= lt!350 (appendBit!0 thiss!932 true))))

(declare-fun res!2859 () Bool)

(assert (=> start!298 (=> (not res!2859) (not e!431))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!298 (= res!2859 (validate_offset_bit!0 ((_ sign_extend 32) (size!34 (buf!346 thiss!932))) ((_ sign_extend 32) (currentByte!1262 thiss!932)) ((_ sign_extend 32) (currentBit!1257 thiss!932))))))

(assert (=> start!298 e!431))

(declare-fun e!436 () Bool)

(declare-fun inv!12 (BitStream!52) Bool)

(assert (=> start!298 (and (inv!12 thiss!932) e!436)))

(declare-fun b!770 () Bool)

(declare-fun e!434 () Bool)

(declare-datatypes ((tuple2!36 0))(
  ( (tuple2!37 (_1!18 BitStream!52) (_2!18 Bool)) )
))
(declare-fun lt!351 () tuple2!36)

(assert (=> b!770 (= e!434 (= (bitIndex!0 (size!34 (buf!346 (_1!18 lt!351))) (currentByte!1262 (_1!18 lt!351)) (currentBit!1257 (_1!18 lt!351))) lt!352))))

(declare-fun b!771 () Bool)

(declare-fun res!2856 () Bool)

(assert (=> b!771 (=> res!2856 e!433)))

(assert (=> b!771 (= res!2856 (not (isPrefixOf!0 thiss!932 (_2!17 lt!350))))))

(declare-fun b!772 () Bool)

(declare-fun array_inv!31 (array!90) Bool)

(assert (=> b!772 (= e!436 (array_inv!31 (buf!346 thiss!932)))))

(declare-fun b!773 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!773 (= e!433 (invariant!0 (currentBit!1257 (_2!17 lt!350)) (currentByte!1262 (_2!17 lt!350)) (size!34 (buf!346 (_2!17 lt!350)))))))

(declare-fun b!774 () Bool)

(assert (=> b!774 (= e!437 e!434)))

(declare-fun res!2858 () Bool)

(assert (=> b!774 (=> (not res!2858) (not e!434))))

(assert (=> b!774 (= res!2858 (and (_2!18 lt!351) (= (_1!18 lt!351) (_2!17 lt!350))))))

(declare-fun readBitPure!0 (BitStream!52) tuple2!36)

(declare-fun readerFrom!0 (BitStream!52 (_ BitVec 32) (_ BitVec 32)) BitStream!52)

(assert (=> b!774 (= lt!351 (readBitPure!0 (readerFrom!0 (_2!17 lt!350) (currentBit!1257 thiss!932) (currentByte!1262 thiss!932))))))

(declare-fun b!775 () Bool)

(declare-fun res!2854 () Bool)

(assert (=> b!775 (=> res!2854 e!433)))

(assert (=> b!775 (= res!2854 (not (= (bitIndex!0 (size!34 (buf!346 (_2!17 lt!350))) (currentByte!1262 (_2!17 lt!350)) (currentBit!1257 (_2!17 lt!350))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!34 (buf!346 thiss!932)) (currentByte!1262 thiss!932) (currentBit!1257 thiss!932))))))))

(assert (= (and start!298 res!2859) b!769))

(assert (= (and b!769 res!2855) b!767))

(assert (= (and b!767 res!2853) b!768))

(assert (= (and b!768 res!2860) b!774))

(assert (= (and b!774 res!2858) b!770))

(assert (= (and b!769 (not res!2857)) b!775))

(assert (= (and b!775 (not res!2854)) b!771))

(assert (= (and b!771 (not res!2856)) b!773))

(assert (= start!298 b!772))

(declare-fun m!475 () Bool)

(assert (=> b!773 m!475))

(declare-fun m!477 () Bool)

(assert (=> b!775 m!477))

(declare-fun m!479 () Bool)

(assert (=> b!775 m!479))

(declare-fun m!481 () Bool)

(assert (=> start!298 m!481))

(declare-fun m!483 () Bool)

(assert (=> start!298 m!483))

(declare-fun m!485 () Bool)

(assert (=> b!768 m!485))

(declare-fun m!487 () Bool)

(assert (=> b!769 m!487))

(declare-fun m!489 () Bool)

(assert (=> b!770 m!489))

(declare-fun m!491 () Bool)

(assert (=> b!772 m!491))

(assert (=> b!771 m!485))

(declare-fun m!493 () Bool)

(assert (=> b!774 m!493))

(assert (=> b!774 m!493))

(declare-fun m!495 () Bool)

(assert (=> b!774 m!495))

(assert (=> b!767 m!477))

(assert (=> b!767 m!479))

(push 1)

(assert (not b!774))

(assert (not start!298))

(assert (not b!770))

(assert (not b!772))

(assert (not b!771))

(assert (not b!775))

(assert (not b!768))

(assert (not b!769))

(assert (not b!767))

(assert (not b!773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!980 () Bool)

(declare-datatypes ((tuple2!46 0))(
  ( (tuple2!47 (_1!23 Bool) (_2!23 BitStream!52)) )
))
(declare-fun lt!380 () tuple2!46)

(declare-fun readBit!0 (BitStream!52) tuple2!46)

(assert (=> d!980 (= lt!380 (readBit!0 (readerFrom!0 (_2!17 lt!350) (currentBit!1257 thiss!932) (currentByte!1262 thiss!932))))))

(assert (=> d!980 (= (readBitPure!0 (readerFrom!0 (_2!17 lt!350) (currentBit!1257 thiss!932) (currentByte!1262 thiss!932))) (tuple2!37 (_2!23 lt!380) (_1!23 lt!380)))))

(declare-fun bs!402 () Bool)

(assert (= bs!402 d!980))

(assert (=> bs!402 m!493))

(declare-fun m!541 () Bool)

(assert (=> bs!402 m!541))

(assert (=> b!774 d!980))

(declare-fun d!984 () Bool)

(declare-fun e!482 () Bool)

(assert (=> d!984 e!482))

(declare-fun res!2913 () Bool)

(assert (=> d!984 (=> (not res!2913) (not e!482))))

(assert (=> d!984 (= res!2913 (invariant!0 (currentBit!1257 (_2!17 lt!350)) (currentByte!1262 (_2!17 lt!350)) (size!34 (buf!346 (_2!17 lt!350)))))))

(assert (=> d!984 (= (readerFrom!0 (_2!17 lt!350) (currentBit!1257 thiss!932) (currentByte!1262 thiss!932)) (BitStream!53 (buf!346 (_2!17 lt!350)) (currentByte!1262 thiss!932) (currentBit!1257 thiss!932)))))

(declare-fun b!832 () Bool)

(assert (=> b!832 (= e!482 (invariant!0 (currentBit!1257 thiss!932) (currentByte!1262 thiss!932) (size!34 (buf!346 (_2!17 lt!350)))))))

(assert (= (and d!984 res!2913) b!832))

(assert (=> d!984 m!475))

(declare-fun m!545 () Bool)

(assert (=> b!832 m!545))

(assert (=> b!774 d!984))

(declare-fun d!988 () Bool)

(assert (=> d!988 (= (invariant!0 (currentBit!1257 (_2!17 lt!350)) (currentByte!1262 (_2!17 lt!350)) (size!34 (buf!346 (_2!17 lt!350)))) (and (bvsge (currentBit!1257 (_2!17 lt!350)) #b00000000000000000000000000000000) (bvslt (currentBit!1257 (_2!17 lt!350)) #b00000000000000000000000000001000) (bvsge (currentByte!1262 (_2!17 lt!350)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1262 (_2!17 lt!350)) (size!34 (buf!346 (_2!17 lt!350)))) (and (= (currentBit!1257 (_2!17 lt!350)) #b00000000000000000000000000000000) (= (currentByte!1262 (_2!17 lt!350)) (size!34 (buf!346 (_2!17 lt!350))))))))))

(assert (=> b!773 d!988))

(declare-fun d!990 () Bool)

(declare-fun res!2937 () Bool)

(declare-fun e!497 () Bool)

(assert (=> d!990 (=> (not res!2937) (not e!497))))

(assert (=> d!990 (= res!2937 (= (size!34 (buf!346 thiss!932)) (size!34 (buf!346 (_2!17 lt!350)))))))

(assert (=> d!990 (= (isPrefixOf!0 thiss!932 (_2!17 lt!350)) e!497)))

(declare-fun b!854 () Bool)

(declare-fun res!2935 () Bool)

(assert (=> b!854 (=> (not res!2935) (not e!497))))

(assert (=> b!854 (= res!2935 (bvsle (bitIndex!0 (size!34 (buf!346 thiss!932)) (currentByte!1262 thiss!932) (currentBit!1257 thiss!932)) (bitIndex!0 (size!34 (buf!346 (_2!17 lt!350))) (currentByte!1262 (_2!17 lt!350)) (currentBit!1257 (_2!17 lt!350)))))))

(declare-fun b!855 () Bool)

(declare-fun e!498 () Bool)

(assert (=> b!855 (= e!497 e!498)))

(declare-fun res!2936 () Bool)

(assert (=> b!855 (=> res!2936 e!498)))

(assert (=> b!855 (= res!2936 (= (size!34 (buf!346 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!856 () Bool)

(declare-fun arrayBitRangesEq!0 (array!90 array!90 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!856 (= e!498 (arrayBitRangesEq!0 (buf!346 thiss!932) (buf!346 (_2!17 lt!350)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!34 (buf!346 thiss!932)) (currentByte!1262 thiss!932) (currentBit!1257 thiss!932))))))

(assert (= (and d!990 res!2937) b!854))

(assert (= (and b!854 res!2935) b!855))

(assert (= (and b!855 (not res!2936)) b!856))

(assert (=> b!854 m!479))

(assert (=> b!854 m!477))

(assert (=> b!856 m!479))

(assert (=> b!856 m!479))

(declare-fun m!553 () Bool)

(assert (=> b!856 m!553))

(assert (=> b!768 d!990))

(declare-fun d!998 () Bool)

(declare-fun e!511 () Bool)

(assert (=> d!998 e!511))

(declare-fun res!2959 () Bool)

(assert (=> d!998 (=> (not res!2959) (not e!511))))

(declare-fun lt!428 () (_ BitVec 64))

(declare-fun lt!427 () (_ BitVec 64))

(declare-fun lt!430 () (_ BitVec 64))

(assert (=> d!998 (= res!2959 (= lt!427 (bvsub lt!428 lt!430)))))

(assert (=> d!998 (or (= (bvand lt!428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428 lt!430) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!998 (= lt!430 (remainingBits!0 ((_ sign_extend 32) (size!34 (buf!346 (_2!17 lt!350)))) ((_ sign_extend 32) (currentByte!1262 (_2!17 lt!350))) ((_ sign_extend 32) (currentBit!1257 (_2!17 lt!350)))))))

(declare-fun lt!426 () (_ BitVec 64))

(declare-fun lt!431 () (_ BitVec 64))

(assert (=> d!998 (= lt!428 (bvmul lt!426 lt!431))))

(assert (=> d!998 (or (= lt!426 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!431 (bvsdiv (bvmul lt!426 lt!431) lt!426)))))

(assert (=> d!998 (= lt!431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!998 (= lt!426 ((_ sign_extend 32) (size!34 (buf!346 (_2!17 lt!350)))))))

(assert (=> d!998 (= lt!427 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1262 (_2!17 lt!350))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1257 (_2!17 lt!350)))))))

(assert (=> d!998 (invariant!0 (currentBit!1257 (_2!17 lt!350)) (currentByte!1262 (_2!17 lt!350)) (size!34 (buf!346 (_2!17 lt!350))))))

(assert (=> d!998 (= (bitIndex!0 (size!34 (buf!346 (_2!17 lt!350))) (currentByte!1262 (_2!17 lt!350)) (currentBit!1257 (_2!17 lt!350))) lt!427)))

(declare-fun b!877 () Bool)

(declare-fun res!2958 () Bool)

(assert (=> b!877 (=> (not res!2958) (not e!511))))

(assert (=> b!877 (= res!2958 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!427))))

(declare-fun b!878 () Bool)

(declare-fun lt!429 () (_ BitVec 64))

(assert (=> b!878 (= e!511 (bvsle lt!427 (bvmul lt!429 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!878 (or (= lt!429 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!429 #b0000000000000000000000000000000000000000000000000000000000001000) lt!429)))))

(assert (=> b!878 (= lt!429 ((_ sign_extend 32) (size!34 (buf!346 (_2!17 lt!350)))))))

(assert (= (and d!998 res!2959) b!877))

(assert (= (and b!877 res!2958) b!878))

(declare-fun m!565 () Bool)

(assert (=> d!998 m!565))

(assert (=> d!998 m!475))

(assert (=> b!775 d!998))

(declare-fun d!1008 () Bool)

(declare-fun e!512 () Bool)

(assert (=> d!1008 e!512))

(declare-fun res!2961 () Bool)

(assert (=> d!1008 (=> (not res!2961) (not e!512))))

(declare-fun lt!434 () (_ BitVec 64))

(declare-fun lt!433 () (_ BitVec 64))

(declare-fun lt!436 () (_ BitVec 64))

(assert (=> d!1008 (= res!2961 (= lt!433 (bvsub lt!434 lt!436)))))

(assert (=> d!1008 (or (= (bvand lt!434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!436 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!434 lt!436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1008 (= lt!436 (remainingBits!0 ((_ sign_extend 32) (size!34 (buf!346 thiss!932))) ((_ sign_extend 32) (currentByte!1262 thiss!932)) ((_ sign_extend 32) (currentBit!1257 thiss!932))))))

(declare-fun lt!432 () (_ BitVec 64))

(declare-fun lt!437 () (_ BitVec 64))

(assert (=> d!1008 (= lt!434 (bvmul lt!432 lt!437))))

(assert (=> d!1008 (or (= lt!432 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!437 (bvsdiv (bvmul lt!432 lt!437) lt!432)))))

(assert (=> d!1008 (= lt!437 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1008 (= lt!432 ((_ sign_extend 32) (size!34 (buf!346 thiss!932))))))

(assert (=> d!1008 (= lt!433 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1262 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1257 thiss!932))))))

(assert (=> d!1008 (invariant!0 (currentBit!1257 thiss!932) (currentByte!1262 thiss!932) (size!34 (buf!346 thiss!932)))))

(assert (=> d!1008 (= (bitIndex!0 (size!34 (buf!346 thiss!932)) (currentByte!1262 thiss!932) (currentBit!1257 thiss!932)) lt!433)))

(declare-fun b!879 () Bool)

(declare-fun res!2960 () Bool)

(assert (=> b!879 (=> (not res!2960) (not e!512))))

(assert (=> b!879 (= res!2960 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433))))

(declare-fun b!880 () Bool)

(declare-fun lt!435 () (_ BitVec 64))

(assert (=> b!880 (= e!512 (bvsle lt!433 (bvmul lt!435 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!880 (or (= lt!435 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!435 #b0000000000000000000000000000000000000000000000000000000000001000) lt!435)))))

(assert (=> b!880 (= lt!435 ((_ sign_extend 32) (size!34 (buf!346 thiss!932))))))

(assert (= (and d!1008 res!2961) b!879))

(assert (= (and b!879 res!2960) b!880))

(declare-fun m!567 () Bool)

(assert (=> d!1008 m!567))

(declare-fun m!569 () Bool)

(assert (=> d!1008 m!569))

(assert (=> b!775 d!1008))

(declare-fun d!1010 () Bool)

(declare-fun e!513 () Bool)

(assert (=> d!1010 e!513))

(declare-fun res!2963 () Bool)

(assert (=> d!1010 (=> (not res!2963) (not e!513))))

(declare-fun lt!439 () (_ BitVec 64))

(declare-fun lt!442 () (_ BitVec 64))

(declare-fun lt!440 () (_ BitVec 64))

(assert (=> d!1010 (= res!2963 (= lt!439 (bvsub lt!440 lt!442)))))

(assert (=> d!1010 (or (= (bvand lt!440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440 lt!442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1010 (= lt!442 (remainingBits!0 ((_ sign_extend 32) (size!34 (buf!346 (_1!18 lt!351)))) ((_ sign_extend 32) (currentByte!1262 (_1!18 lt!351))) ((_ sign_extend 32) (currentBit!1257 (_1!18 lt!351)))))))

(declare-fun lt!438 () (_ BitVec 64))

(declare-fun lt!443 () (_ BitVec 64))

(assert (=> d!1010 (= lt!440 (bvmul lt!438 lt!443))))

(assert (=> d!1010 (or (= lt!438 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!443 (bvsdiv (bvmul lt!438 lt!443) lt!438)))))

(assert (=> d!1010 (= lt!443 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1010 (= lt!438 ((_ sign_extend 32) (size!34 (buf!346 (_1!18 lt!351)))))))

(assert (=> d!1010 (= lt!439 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1262 (_1!18 lt!351))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1257 (_1!18 lt!351)))))))

(assert (=> d!1010 (invariant!0 (currentBit!1257 (_1!18 lt!351)) (currentByte!1262 (_1!18 lt!351)) (size!34 (buf!346 (_1!18 lt!351))))))

(assert (=> d!1010 (= (bitIndex!0 (size!34 (buf!346 (_1!18 lt!351))) (currentByte!1262 (_1!18 lt!351)) (currentBit!1257 (_1!18 lt!351))) lt!439)))

(declare-fun b!881 () Bool)

(declare-fun res!2962 () Bool)

(assert (=> b!881 (=> (not res!2962) (not e!513))))

(assert (=> b!881 (= res!2962 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!439))))

(declare-fun b!882 () Bool)

(declare-fun lt!441 () (_ BitVec 64))

(assert (=> b!882 (= e!513 (bvsle lt!439 (bvmul lt!441 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!882 (or (= lt!441 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441)))))

(assert (=> b!882 (= lt!441 ((_ sign_extend 32) (size!34 (buf!346 (_1!18 lt!351)))))))

(assert (= (and d!1010 res!2963) b!881))

(assert (= (and b!881 res!2962) b!882))

(declare-fun m!571 () Bool)

(assert (=> d!1010 m!571))

(declare-fun m!573 () Bool)

(assert (=> d!1010 m!573))

(assert (=> b!770 d!1010))

(declare-fun b!926 () Bool)

(declare-fun res!3004 () Bool)

(declare-fun e!535 () Bool)

(assert (=> b!926 (=> (not res!3004) (not e!535))))

(declare-fun lt!494 () tuple2!34)

(assert (=> b!926 (= res!3004 (isPrefixOf!0 thiss!932 (_2!17 lt!494)))))

(declare-fun b!925 () Bool)

(declare-fun res!3005 () Bool)

(assert (=> b!925 (=> (not res!3005) (not e!535))))

(declare-fun lt!492 () (_ BitVec 64))

(declare-fun lt!491 () (_ BitVec 64))

(assert (=> b!925 (= res!3005 (= (bitIndex!0 (size!34 (buf!346 (_2!17 lt!494))) (currentByte!1262 (_2!17 lt!494)) (currentBit!1257 (_2!17 lt!494))) (bvadd lt!491 lt!492)))))

(assert (=> b!925 (or (not (= (bvand lt!491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!492 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!491 lt!492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!925 (= lt!492 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!925 (= lt!491 (bitIndex!0 (size!34 (buf!346 thiss!932)) (currentByte!1262 thiss!932) (currentBit!1257 thiss!932)))))

(declare-fun b!928 () Bool)

(declare-fun e!536 () Bool)

(declare-fun lt!493 () tuple2!36)

(assert (=> b!928 (= e!536 (= (bitIndex!0 (size!34 (buf!346 (_1!18 lt!493))) (currentByte!1262 (_1!18 lt!493)) (currentBit!1257 (_1!18 lt!493))) (bitIndex!0 (size!34 (buf!346 (_2!17 lt!494))) (currentByte!1262 (_2!17 lt!494)) (currentBit!1257 (_2!17 lt!494)))))))

(declare-fun d!1012 () Bool)

(assert (=> d!1012 e!535))

(declare-fun res!3006 () Bool)

(assert (=> d!1012 (=> (not res!3006) (not e!535))))

(assert (=> d!1012 (= res!3006 (= (size!34 (buf!346 thiss!932)) (size!34 (buf!346 (_2!17 lt!494)))))))

(declare-fun choose!16 (BitStream!52 Bool) tuple2!34)

(assert (=> d!1012 (= lt!494 (choose!16 thiss!932 true))))

(assert (=> d!1012 (validate_offset_bit!0 ((_ sign_extend 32) (size!34 (buf!346 thiss!932))) ((_ sign_extend 32) (currentByte!1262 thiss!932)) ((_ sign_extend 32) (currentBit!1257 thiss!932)))))

(assert (=> d!1012 (= (appendBit!0 thiss!932 true) lt!494)))

(declare-fun b!927 () Bool)

(assert (=> b!927 (= e!535 e!536)))

(declare-fun res!3007 () Bool)

(assert (=> b!927 (=> (not res!3007) (not e!536))))

(assert (=> b!927 (= res!3007 (and (= (_2!18 lt!493) true) (= (_1!18 lt!493) (_2!17 lt!494))))))

(assert (=> b!927 (= lt!493 (readBitPure!0 (readerFrom!0 (_2!17 lt!494) (currentBit!1257 thiss!932) (currentByte!1262 thiss!932))))))

(assert (= (and d!1012 res!3006) b!925))

(assert (= (and b!925 res!3005) b!926))

(assert (= (and b!926 res!3004) b!927))

(assert (= (and b!927 res!3007) b!928))

(declare-fun m!605 () Bool)

(assert (=> d!1012 m!605))

(assert (=> d!1012 m!481))

(declare-fun m!607 () Bool)

(assert (=> b!926 m!607))

(declare-fun m!609 () Bool)

(assert (=> b!927 m!609))

(assert (=> b!927 m!609))

(declare-fun m!611 () Bool)

(assert (=> b!927 m!611))

(declare-fun m!613 () Bool)

(assert (=> b!925 m!613))

(assert (=> b!925 m!479))

(declare-fun m!615 () Bool)

(assert (=> b!928 m!615))

(assert (=> b!928 m!613))

(assert (=> b!769 d!1012))

(assert (=> b!771 d!990))

(declare-fun d!1030 () Bool)

(assert (=> d!1030 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!34 (buf!346 thiss!932))) ((_ sign_extend 32) (currentByte!1262 thiss!932)) ((_ sign_extend 32) (currentBit!1257 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!34 (buf!346 thiss!932))) ((_ sign_extend 32) (currentByte!1262 thiss!932)) ((_ sign_extend 32) (currentBit!1257 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!407 () Bool)

(assert (= bs!407 d!1030))

(assert (=> bs!407 m!567))

(assert (=> start!298 d!1030))

(declare-fun d!1034 () Bool)

(assert (=> d!1034 (= (inv!12 thiss!932) (invariant!0 (currentBit!1257 thiss!932) (currentByte!1262 thiss!932) (size!34 (buf!346 thiss!932))))))

(declare-fun bs!408 () Bool)

(assert (= bs!408 d!1034))

(assert (=> bs!408 m!569))

(assert (=> start!298 d!1034))

(assert (=> b!767 d!998))

(assert (=> b!767 d!1008))

(declare-fun d!1038 () Bool)

(assert (=> d!1038 (= (array_inv!31 (buf!346 thiss!932)) (bvsge (size!34 (buf!346 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!772 d!1038))

(push 1)

(assert (not d!1010))

(assert (not d!1034))

(assert (not b!926))

(assert (not d!1012))

(assert (not d!984))

(assert (not d!1030))

(assert (not b!854))

(assert (not b!927))

(assert (not d!1008))

(assert (not d!980))

(assert (not d!998))

(assert (not b!925))

(assert (not b!832))

(assert (not b!856))

(assert (not b!928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

