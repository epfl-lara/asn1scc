; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8204 () Bool)

(assert start!8204)

(declare-fun b!41075 () Bool)

(declare-fun res!34961 () Bool)

(declare-fun e!27175 () Bool)

(assert (=> b!41075 (=> (not res!34961) (not e!27175))))

(declare-datatypes ((array!2052 0))(
  ( (array!2053 (arr!1426 (Array (_ BitVec 32) (_ BitVec 8))) (size!927 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1598 0))(
  ( (BitStream!1599 (buf!1255 array!2052) (currentByte!2689 (_ BitVec 32)) (currentBit!2684 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1598)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41075 (= res!34961 (validate_offset_bits!1 ((_ sign_extend 32) (size!927 (buf!1255 thiss!1379))) ((_ sign_extend 32) (currentByte!2689 thiss!1379)) ((_ sign_extend 32) (currentBit!2684 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41076 () Bool)

(declare-fun e!27171 () Bool)

(declare-fun array_inv!852 (array!2052) Bool)

(assert (=> b!41076 (= e!27171 (array_inv!852 (buf!1255 thiss!1379)))))

(declare-fun b!41077 () Bool)

(declare-fun e!27174 () Bool)

(declare-fun e!27173 () Bool)

(assert (=> b!41077 (= e!27174 e!27173)))

(declare-fun res!34959 () Bool)

(assert (=> b!41077 (=> res!34959 e!27173)))

(assert (=> b!41077 (= res!34959 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-datatypes ((tuple2!3932 0))(
  ( (tuple2!3933 (_1!2053 BitStream!1598) (_2!2053 BitStream!1598)) )
))
(declare-fun lt!62221 () tuple2!3932)

(declare-fun reader!0 (BitStream!1598 BitStream!1598) tuple2!3932)

(assert (=> b!41077 (= lt!62221 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!41078 () Bool)

(assert (=> b!41078 (= e!27173 (validate_offset_bits!1 ((_ sign_extend 32) (size!927 (buf!1255 (_1!2053 lt!62221)))) ((_ sign_extend 32) (currentByte!2689 (_1!2053 lt!62221))) ((_ sign_extend 32) (currentBit!2684 (_1!2053 lt!62221))) (bvsub to!314 i!635)))))

(declare-fun b!41079 () Bool)

(declare-fun res!34960 () Bool)

(assert (=> b!41079 (=> res!34960 e!27174)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41079 (= res!34960 (not (invariant!0 (currentBit!2684 thiss!1379) (currentByte!2689 thiss!1379) (size!927 (buf!1255 thiss!1379)))))))

(declare-fun b!41080 () Bool)

(assert (=> b!41080 (= e!27175 (not e!27174))))

(declare-fun res!34958 () Bool)

(assert (=> b!41080 (=> res!34958 e!27174)))

(declare-fun lt!62219 () (_ BitVec 64))

(assert (=> b!41080 (= res!34958 (or (bvslt i!635 to!314) (not (= lt!62219 (bvsub (bvadd lt!62219 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1598 BitStream!1598) Bool)

(assert (=> b!41080 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2899 0))(
  ( (Unit!2900) )
))
(declare-fun lt!62220 () Unit!2899)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1598) Unit!2899)

(assert (=> b!41080 (= lt!62220 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41080 (= lt!62219 (bitIndex!0 (size!927 (buf!1255 thiss!1379)) (currentByte!2689 thiss!1379) (currentBit!2684 thiss!1379)))))

(declare-fun res!34962 () Bool)

(assert (=> start!8204 (=> (not res!34962) (not e!27175))))

(declare-fun srcBuffer!2 () array!2052)

(assert (=> start!8204 (= res!34962 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!927 srcBuffer!2))))))))

(assert (=> start!8204 e!27175))

(assert (=> start!8204 true))

(assert (=> start!8204 (array_inv!852 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1598) Bool)

(assert (=> start!8204 (and (inv!12 thiss!1379) e!27171)))

(assert (= (and start!8204 res!34962) b!41075))

(assert (= (and b!41075 res!34961) b!41080))

(assert (= (and b!41080 (not res!34958)) b!41079))

(assert (= (and b!41079 (not res!34960)) b!41077))

(assert (= (and b!41077 (not res!34959)) b!41078))

(assert (= start!8204 b!41076))

(declare-fun m!62723 () Bool)

(assert (=> b!41080 m!62723))

(declare-fun m!62725 () Bool)

(assert (=> b!41080 m!62725))

(declare-fun m!62727 () Bool)

(assert (=> b!41080 m!62727))

(declare-fun m!62729 () Bool)

(assert (=> b!41076 m!62729))

(declare-fun m!62731 () Bool)

(assert (=> b!41075 m!62731))

(declare-fun m!62733 () Bool)

(assert (=> b!41077 m!62733))

(declare-fun m!62735 () Bool)

(assert (=> b!41078 m!62735))

(declare-fun m!62737 () Bool)

(assert (=> b!41079 m!62737))

(declare-fun m!62739 () Bool)

(assert (=> start!8204 m!62739))

(declare-fun m!62741 () Bool)

(assert (=> start!8204 m!62741))

(push 1)

(assert (not b!41080))

(assert (not b!41076))

(assert (not b!41075))

(assert (not b!41079))

(assert (not b!41078))

(assert (not start!8204))

(assert (not b!41077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!41106 () Bool)

(declare-fun e!27187 () Unit!2899)

(declare-fun lt!62328 () Unit!2899)

(assert (=> b!41106 (= e!27187 lt!62328)))

(declare-fun lt!62337 () (_ BitVec 64))

(assert (=> b!41106 (= lt!62337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!62336 () (_ BitVec 64))

(assert (=> b!41106 (= lt!62336 (bitIndex!0 (size!927 (buf!1255 thiss!1379)) (currentByte!2689 thiss!1379) (currentBit!2684 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2052 array!2052 (_ BitVec 64) (_ BitVec 64)) Unit!2899)

(assert (=> b!41106 (= lt!62328 (arrayBitRangesEqSymmetric!0 (buf!1255 thiss!1379) (buf!1255 thiss!1379) lt!62337 lt!62336))))

(declare-fun arrayBitRangesEq!0 (array!2052 array!2052 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41106 (arrayBitRangesEq!0 (buf!1255 thiss!1379) (buf!1255 thiss!1379) lt!62337 lt!62336)))

(declare-fun b!41107 () Bool)

(declare-fun Unit!2901 () Unit!2899)

(assert (=> b!41107 (= e!27187 Unit!2901)))

(declare-fun b!41108 () Bool)

(declare-fun res!34978 () Bool)

(declare-fun e!27186 () Bool)

(assert (=> b!41108 (=> (not res!34978) (not e!27186))))

(declare-fun lt!62338 () tuple2!3932)

(assert (=> b!41108 (= res!34978 (isPrefixOf!0 (_1!2053 lt!62338) thiss!1379))))

(declare-fun b!41109 () Bool)

(declare-fun lt!62339 () (_ BitVec 64))

(declare-fun lt!62323 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1598 (_ BitVec 64)) BitStream!1598)

(assert (=> b!41109 (= e!27186 (= (_1!2053 lt!62338) (withMovedBitIndex!0 (_2!2053 lt!62338) (bvsub lt!62339 lt!62323))))))

(assert (=> b!41109 (or (= (bvand lt!62339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62323 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62339 lt!62323) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41109 (= lt!62323 (bitIndex!0 (size!927 (buf!1255 thiss!1379)) (currentByte!2689 thiss!1379) (currentBit!2684 thiss!1379)))))

(assert (=> b!41109 (= lt!62339 (bitIndex!0 (size!927 (buf!1255 thiss!1379)) (currentByte!2689 thiss!1379) (currentBit!2684 thiss!1379)))))

(declare-fun d!12034 () Bool)

(assert (=> d!12034 e!27186))

(declare-fun res!34979 () Bool)

(assert (=> d!12034 (=> (not res!34979) (not e!27186))))

(assert (=> d!12034 (= res!34979 (isPrefixOf!0 (_1!2053 lt!62338) (_2!2053 lt!62338)))))

(declare-fun lt!62322 () BitStream!1598)

(assert (=> d!12034 (= lt!62338 (tuple2!3933 lt!62322 thiss!1379))))

(declare-fun lt!62326 () Unit!2899)

(declare-fun lt!62341 () Unit!2899)

(assert (=> d!12034 (= lt!62326 lt!62341)))

(assert (=> d!12034 (isPrefixOf!0 lt!62322 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1598 BitStream!1598 BitStream!1598) Unit!2899)

(assert (=> d!12034 (= lt!62341 (lemmaIsPrefixTransitive!0 lt!62322 thiss!1379 thiss!1379))))

(declare-fun lt!62335 () Unit!2899)

(declare-fun lt!62333 () Unit!2899)

(assert (=> d!12034 (= lt!62335 lt!62333)))

(assert (=> d!12034 (isPrefixOf!0 lt!62322 thiss!1379)))

(assert (=> d!12034 (= lt!62333 (lemmaIsPrefixTransitive!0 lt!62322 thiss!1379 thiss!1379))))

(declare-fun lt!62332 () Unit!2899)

(assert (=> d!12034 (= lt!62332 e!27187)))

(declare-fun c!2757 () Bool)

(assert (=> d!12034 (= c!2757 (not (= (size!927 (buf!1255 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!62340 () Unit!2899)

(declare-fun lt!62327 () Unit!2899)

(assert (=> d!12034 (= lt!62340 lt!62327)))

(assert (=> d!12034 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12034 (= lt!62327 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62324 () Unit!2899)

(declare-fun lt!62331 () Unit!2899)

(assert (=> d!12034 (= lt!62324 lt!62331)))

(assert (=> d!12034 (= lt!62331 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62330 () Unit!2899)

(declare-fun lt!62334 () Unit!2899)

(assert (=> d!12034 (= lt!62330 lt!62334)))

(assert (=> d!12034 (isPrefixOf!0 lt!62322 lt!62322)))

(assert (=> d!12034 (= lt!62334 (lemmaIsPrefixRefl!0 lt!62322))))

(declare-fun lt!62329 () Unit!2899)

(declare-fun lt!62325 () Unit!2899)

(assert (=> d!12034 (= lt!62329 lt!62325)))

(assert (=> d!12034 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12034 (= lt!62325 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12034 (= lt!62322 (BitStream!1599 (buf!1255 thiss!1379) (currentByte!2689 thiss!1379) (currentBit!2684 thiss!1379)))))

(assert (=> d!12034 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12034 (= (reader!0 thiss!1379 thiss!1379) lt!62338)))

(declare-fun b!41110 () Bool)

(declare-fun res!34980 () Bool)

(assert (=> b!41110 (=> (not res!34980) (not e!27186))))

(assert (=> b!41110 (= res!34980 (isPrefixOf!0 (_2!2053 lt!62338) thiss!1379))))

(assert (= (and d!12034 c!2757) b!41106))

(assert (= (and d!12034 (not c!2757)) b!41107))

(assert (= (and d!12034 res!34979) b!41108))

(assert (= (and b!41108 res!34978) b!41110))

(assert (= (and b!41110 res!34980) b!41109))

(assert (=> b!41106 m!62727))

(declare-fun m!62765 () Bool)

(assert (=> b!41106 m!62765))

(declare-fun m!62767 () Bool)

(assert (=> b!41106 m!62767))

(declare-fun m!62769 () Bool)

(assert (=> b!41108 m!62769))

(declare-fun m!62771 () Bool)

(assert (=> b!41109 m!62771))

(assert (=> b!41109 m!62727))

(assert (=> b!41109 m!62727))

(declare-fun m!62773 () Bool)

(assert (=> b!41110 m!62773))

(declare-fun m!62775 () Bool)

(assert (=> d!12034 m!62775))

(assert (=> d!12034 m!62723))

(assert (=> d!12034 m!62723))

(declare-fun m!62779 () Bool)

(assert (=> d!12034 m!62779))

(declare-fun m!62781 () Bool)

(assert (=> d!12034 m!62781))

(declare-fun m!62783 () Bool)

(assert (=> d!12034 m!62783))

(assert (=> d!12034 m!62725))

(assert (=> d!12034 m!62779))

(assert (=> d!12034 m!62723))

(assert (=> d!12034 m!62725))

(declare-fun m!62785 () Bool)

(assert (=> d!12034 m!62785))

(assert (=> b!41077 d!12034))

(declare-fun d!12050 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12050 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!927 (buf!1255 (_1!2053 lt!62221)))) ((_ sign_extend 32) (currentByte!2689 (_1!2053 lt!62221))) ((_ sign_extend 32) (currentBit!2684 (_1!2053 lt!62221))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!927 (buf!1255 (_1!2053 lt!62221)))) ((_ sign_extend 32) (currentByte!2689 (_1!2053 lt!62221))) ((_ sign_extend 32) (currentBit!2684 (_1!2053 lt!62221)))) (bvsub to!314 i!635)))))

(declare-fun bs!3211 () Bool)

(assert (= bs!3211 d!12050))

(declare-fun m!62787 () Bool)

(assert (=> bs!3211 m!62787))

(assert (=> b!41078 d!12050))

(declare-fun d!12052 () Bool)

(assert (=> d!12052 (= (array_inv!852 srcBuffer!2) (bvsge (size!927 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8204 d!12052))

(declare-fun d!12054 () Bool)

(assert (=> d!12054 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2684 thiss!1379) (currentByte!2689 thiss!1379) (size!927 (buf!1255 thiss!1379))))))

(declare-fun bs!3212 () Bool)

(assert (= bs!3212 d!12054))

(assert (=> bs!3212 m!62737))

(assert (=> start!8204 d!12054))

(declare-fun d!12056 () Bool)

(assert (=> d!12056 (= (invariant!0 (currentBit!2684 thiss!1379) (currentByte!2689 thiss!1379) (size!927 (buf!1255 thiss!1379))) (and (bvsge (currentBit!2684 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2684 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2689 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2689 thiss!1379) (size!927 (buf!1255 thiss!1379))) (and (= (currentBit!2684 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2689 thiss!1379) (size!927 (buf!1255 thiss!1379)))))))))

(assert (=> b!41079 d!12056))

(declare-fun d!12058 () Bool)

(declare-fun res!34996 () Bool)

(declare-fun e!27198 () Bool)

(assert (=> d!12058 (=> (not res!34996) (not e!27198))))

(assert (=> d!12058 (= res!34996 (= (size!927 (buf!1255 thiss!1379)) (size!927 (buf!1255 thiss!1379))))))

(assert (=> d!12058 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!27198)))

(declare-fun b!41126 () Bool)

(declare-fun res!34998 () Bool)

(assert (=> b!41126 (=> (not res!34998) (not e!27198))))

(assert (=> b!41126 (= res!34998 (bvsle (bitIndex!0 (size!927 (buf!1255 thiss!1379)) (currentByte!2689 thiss!1379) (currentBit!2684 thiss!1379)) (bitIndex!0 (size!927 (buf!1255 thiss!1379)) (currentByte!2689 thiss!1379) (currentBit!2684 thiss!1379))))))

(declare-fun b!41127 () Bool)

(declare-fun e!27199 () Bool)

(assert (=> b!41127 (= e!27198 e!27199)))

(declare-fun res!34997 () Bool)

(assert (=> b!41127 (=> res!34997 e!27199)))

(assert (=> b!41127 (= res!34997 (= (size!927 (buf!1255 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!41128 () Bool)

(assert (=> b!41128 (= e!27199 (arrayBitRangesEq!0 (buf!1255 thiss!1379) (buf!1255 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!927 (buf!1255 thiss!1379)) (currentByte!2689 thiss!1379) (currentBit!2684 thiss!1379))))))

(assert (= (and d!12058 res!34996) b!41126))

(assert (= (and b!41126 res!34998) b!41127))

(assert (= (and b!41127 (not res!34997)) b!41128))

(assert (=> b!41126 m!62727))

(assert (=> b!41126 m!62727))

(assert (=> b!41128 m!62727))

(assert (=> b!41128 m!62727))

(declare-fun m!62793 () Bool)

(assert (=> b!41128 m!62793))

(assert (=> b!41080 d!12058))

(declare-fun d!12064 () Bool)

(assert (=> d!12064 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62347 () Unit!2899)

(declare-fun choose!11 (BitStream!1598) Unit!2899)

(assert (=> d!12064 (= lt!62347 (choose!11 thiss!1379))))

(assert (=> d!12064 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62347)))

(declare-fun bs!3216 () Bool)

(assert (= bs!3216 d!12064))

(assert (=> bs!3216 m!62723))

(declare-fun m!62795 () Bool)

(assert (=> bs!3216 m!62795))

(assert (=> b!41080 d!12064))

(declare-fun d!12066 () Bool)

(declare-fun e!27211 () Bool)

(assert (=> d!12066 e!27211))

(declare-fun res!35019 () Bool)

(assert (=> d!12066 (=> (not res!35019) (not e!27211))))

(declare-fun lt!62439 () (_ BitVec 64))

(declare-fun lt!62441 () (_ BitVec 64))

(declare-fun lt!62438 () (_ BitVec 64))

(assert (=> d!12066 (= res!35019 (= lt!62439 (bvsub lt!62441 lt!62438)))))

(assert (=> d!12066 (or (= (bvand lt!62441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62441 lt!62438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12066 (= lt!62438 (remainingBits!0 ((_ sign_extend 32) (size!927 (buf!1255 thiss!1379))) ((_ sign_extend 32) (currentByte!2689 thiss!1379)) ((_ sign_extend 32) (currentBit!2684 thiss!1379))))))

(declare-fun lt!62440 () (_ BitVec 64))

(declare-fun lt!62443 () (_ BitVec 64))

(assert (=> d!12066 (= lt!62441 (bvmul lt!62440 lt!62443))))

(assert (=> d!12066 (or (= lt!62440 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62443 (bvsdiv (bvmul lt!62440 lt!62443) lt!62440)))))

(assert (=> d!12066 (= lt!62443 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12066 (= lt!62440 ((_ sign_extend 32) (size!927 (buf!1255 thiss!1379))))))

(assert (=> d!12066 (= lt!62439 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2689 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2684 thiss!1379))))))

(assert (=> d!12066 (invariant!0 (currentBit!2684 thiss!1379) (currentByte!2689 thiss!1379) (size!927 (buf!1255 thiss!1379)))))

(assert (=> d!12066 (= (bitIndex!0 (size!927 (buf!1255 thiss!1379)) (currentByte!2689 thiss!1379) (currentBit!2684 thiss!1379)) lt!62439)))

(declare-fun b!41154 () Bool)

(declare-fun res!35018 () Bool)

(assert (=> b!41154 (=> (not res!35018) (not e!27211))))

(assert (=> b!41154 (= res!35018 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62439))))

(declare-fun b!41155 () Bool)

(declare-fun lt!62442 () (_ BitVec 64))

(assert (=> b!41155 (= e!27211 (bvsle lt!62439 (bvmul lt!62442 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!41155 (or (= lt!62442 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62442 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62442)))))

(assert (=> b!41155 (= lt!62442 ((_ sign_extend 32) (size!927 (buf!1255 thiss!1379))))))

(assert (= (and d!12066 res!35019) b!41154))

(assert (= (and b!41154 res!35018) b!41155))

(declare-fun m!62819 () Bool)

(assert (=> d!12066 m!62819))

(assert (=> d!12066 m!62737))

(assert (=> b!41080 d!12066))

(declare-fun d!12078 () Bool)

(assert (=> d!12078 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!927 (buf!1255 thiss!1379))) ((_ sign_extend 32) (currentByte!2689 thiss!1379)) ((_ sign_extend 32) (currentBit!2684 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!927 (buf!1255 thiss!1379))) ((_ sign_extend 32) (currentByte!2689 thiss!1379)) ((_ sign_extend 32) (currentBit!2684 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3219 () Bool)

(assert (= bs!3219 d!12078))

(assert (=> bs!3219 m!62819))

(assert (=> b!41075 d!12078))

(declare-fun d!12080 () Bool)

(assert (=> d!12080 (= (array_inv!852 (buf!1255 thiss!1379)) (bvsge (size!927 (buf!1255 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!41076 d!12080))

(push 1)

(assert (not d!12034))

(assert (not b!41110))

(assert (not d!12066))

(assert (not b!41106))

(assert (not d!12064))

(assert (not b!41109))

(assert (not d!12054))

(assert (not b!41108))

(assert (not b!41126))

(assert (not d!12078))

(assert (not d!12050))

(assert (not b!41128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

