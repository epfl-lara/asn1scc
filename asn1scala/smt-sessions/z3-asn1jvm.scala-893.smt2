; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25380 () Bool)

(assert start!25380)

(declare-fun b!128176 () Bool)

(declare-fun e!84993 () Bool)

(declare-datatypes ((array!5916 0))(
  ( (array!5917 (arr!3292 (Array (_ BitVec 32) (_ BitVec 8))) (size!2675 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4614 0))(
  ( (BitStream!4615 (buf!3033 array!5916) (currentByte!5785 (_ BitVec 32)) (currentBit!5780 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4614)

(assert (=> b!128176 (= e!84993 (not (or (bvsgt ((_ sign_extend 32) (size!2675 (buf!3033 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5785 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5780 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!2675 (buf!3033 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5785 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5780 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!84995 () Bool)

(assert (=> b!128176 e!84995))

(declare-fun res!106071 () Bool)

(assert (=> b!128176 (=> (not res!106071) (not e!84995))))

(declare-datatypes ((Unit!7952 0))(
  ( (Unit!7953) )
))
(declare-datatypes ((tuple2!10810 0))(
  ( (tuple2!10811 (_1!5702 Unit!7952) (_2!5702 BitStream!4614)) )
))
(declare-fun lt!199077 () tuple2!10810)

(assert (=> b!128176 (= res!106071 (= (size!2675 (buf!3033 thiss!1634)) (size!2675 (buf!3033 (_2!5702 lt!199077)))))))

(declare-fun arr!237 () array!5916)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByte!0 (BitStream!4614 (_ BitVec 8)) tuple2!10810)

(assert (=> b!128176 (= lt!199077 (appendByte!0 thiss!1634 (select (arr!3292 arr!237) from!447)))))

(declare-fun b!128177 () Bool)

(declare-fun res!106068 () Bool)

(assert (=> b!128177 (=> (not res!106068) (not e!84995))))

(declare-fun isPrefixOf!0 (BitStream!4614 BitStream!4614) Bool)

(assert (=> b!128177 (= res!106068 (isPrefixOf!0 thiss!1634 (_2!5702 lt!199077)))))

(declare-fun b!128178 () Bool)

(declare-fun e!84994 () Bool)

(declare-fun array_inv!2464 (array!5916) Bool)

(assert (=> b!128178 (= e!84994 (array_inv!2464 (buf!3033 thiss!1634)))))

(declare-fun b!128179 () Bool)

(declare-fun res!106066 () Bool)

(assert (=> b!128179 (=> (not res!106066) (not e!84993))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128179 (= res!106066 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2675 (buf!3033 thiss!1634))) ((_ sign_extend 32) (currentByte!5785 thiss!1634)) ((_ sign_extend 32) (currentBit!5780 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!10812 0))(
  ( (tuple2!10813 (_1!5703 BitStream!4614) (_2!5703 BitStream!4614)) )
))
(declare-fun lt!199078 () tuple2!10812)

(declare-datatypes ((tuple2!10814 0))(
  ( (tuple2!10815 (_1!5704 BitStream!4614) (_2!5704 (_ BitVec 8))) )
))
(declare-fun lt!199079 () tuple2!10814)

(declare-fun b!128180 () Bool)

(assert (=> b!128180 (= e!84995 (and (= (_2!5704 lt!199079) (select (arr!3292 arr!237) from!447)) (= (_1!5704 lt!199079) (_2!5703 lt!199078))))))

(declare-fun readBytePure!0 (BitStream!4614) tuple2!10814)

(assert (=> b!128180 (= lt!199079 (readBytePure!0 (_1!5703 lt!199078)))))

(declare-fun reader!0 (BitStream!4614 BitStream!4614) tuple2!10812)

(assert (=> b!128180 (= lt!199078 (reader!0 thiss!1634 (_2!5702 lt!199077)))))

(declare-fun b!128182 () Bool)

(declare-fun res!106067 () Bool)

(assert (=> b!128182 (=> (not res!106067) (not e!84993))))

(assert (=> b!128182 (= res!106067 (bvslt from!447 to!404))))

(declare-fun b!128183 () Bool)

(declare-fun res!106069 () Bool)

(assert (=> b!128183 (=> (not res!106069) (not e!84993))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128183 (= res!106069 (invariant!0 (currentBit!5780 thiss!1634) (currentByte!5785 thiss!1634) (size!2675 (buf!3033 thiss!1634))))))

(declare-fun b!128181 () Bool)

(declare-fun res!106070 () Bool)

(assert (=> b!128181 (=> (not res!106070) (not e!84995))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128181 (= res!106070 (= (bitIndex!0 (size!2675 (buf!3033 (_2!5702 lt!199077))) (currentByte!5785 (_2!5702 lt!199077)) (currentBit!5780 (_2!5702 lt!199077))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2675 (buf!3033 thiss!1634)) (currentByte!5785 thiss!1634) (currentBit!5780 thiss!1634)))))))

(declare-fun res!106072 () Bool)

(assert (=> start!25380 (=> (not res!106072) (not e!84993))))

(assert (=> start!25380 (= res!106072 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2675 arr!237))))))

(assert (=> start!25380 e!84993))

(assert (=> start!25380 true))

(assert (=> start!25380 (array_inv!2464 arr!237)))

(declare-fun inv!12 (BitStream!4614) Bool)

(assert (=> start!25380 (and (inv!12 thiss!1634) e!84994)))

(assert (= (and start!25380 res!106072) b!128179))

(assert (= (and b!128179 res!106066) b!128182))

(assert (= (and b!128182 res!106067) b!128183))

(assert (= (and b!128183 res!106069) b!128176))

(assert (= (and b!128176 res!106071) b!128181))

(assert (= (and b!128181 res!106070) b!128177))

(assert (= (and b!128177 res!106068) b!128180))

(assert (= start!25380 b!128178))

(declare-fun m!193939 () Bool)

(assert (=> b!128181 m!193939))

(declare-fun m!193941 () Bool)

(assert (=> b!128181 m!193941))

(declare-fun m!193943 () Bool)

(assert (=> b!128180 m!193943))

(declare-fun m!193945 () Bool)

(assert (=> b!128180 m!193945))

(declare-fun m!193947 () Bool)

(assert (=> b!128180 m!193947))

(declare-fun m!193949 () Bool)

(assert (=> start!25380 m!193949))

(declare-fun m!193951 () Bool)

(assert (=> start!25380 m!193951))

(declare-fun m!193953 () Bool)

(assert (=> b!128183 m!193953))

(declare-fun m!193955 () Bool)

(assert (=> b!128178 m!193955))

(assert (=> b!128176 m!193943))

(assert (=> b!128176 m!193943))

(declare-fun m!193957 () Bool)

(assert (=> b!128176 m!193957))

(declare-fun m!193959 () Bool)

(assert (=> b!128179 m!193959))

(declare-fun m!193961 () Bool)

(assert (=> b!128177 m!193961))

(check-sat (not b!128178) (not b!128176) (not start!25380) (not b!128179) (not b!128183) (not b!128180) (not b!128177) (not b!128181))
(check-sat)
(get-model)

(declare-fun d!41438 () Bool)

(assert (=> d!41438 (= (invariant!0 (currentBit!5780 thiss!1634) (currentByte!5785 thiss!1634) (size!2675 (buf!3033 thiss!1634))) (and (bvsge (currentBit!5780 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5780 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5785 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5785 thiss!1634) (size!2675 (buf!3033 thiss!1634))) (and (= (currentBit!5780 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5785 thiss!1634) (size!2675 (buf!3033 thiss!1634)))))))))

(assert (=> b!128183 d!41438))

(declare-fun d!41440 () Bool)

(assert (=> d!41440 (= (array_inv!2464 (buf!3033 thiss!1634)) (bvsge (size!2675 (buf!3033 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!128178 d!41440))

(declare-fun d!41442 () Bool)

(assert (=> d!41442 (= (array_inv!2464 arr!237) (bvsge (size!2675 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25380 d!41442))

(declare-fun d!41444 () Bool)

(assert (=> d!41444 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5780 thiss!1634) (currentByte!5785 thiss!1634) (size!2675 (buf!3033 thiss!1634))))))

(declare-fun bs!10080 () Bool)

(assert (= bs!10080 d!41444))

(assert (=> bs!10080 m!193953))

(assert (=> start!25380 d!41444))

(declare-fun d!41446 () Bool)

(declare-fun res!106118 () Bool)

(declare-fun e!85026 () Bool)

(assert (=> d!41446 (=> (not res!106118) (not e!85026))))

(assert (=> d!41446 (= res!106118 (= (size!2675 (buf!3033 thiss!1634)) (size!2675 (buf!3033 (_2!5702 lt!199077)))))))

(assert (=> d!41446 (= (isPrefixOf!0 thiss!1634 (_2!5702 lt!199077)) e!85026)))

(declare-fun b!128231 () Bool)

(declare-fun res!106117 () Bool)

(assert (=> b!128231 (=> (not res!106117) (not e!85026))))

(assert (=> b!128231 (= res!106117 (bvsle (bitIndex!0 (size!2675 (buf!3033 thiss!1634)) (currentByte!5785 thiss!1634) (currentBit!5780 thiss!1634)) (bitIndex!0 (size!2675 (buf!3033 (_2!5702 lt!199077))) (currentByte!5785 (_2!5702 lt!199077)) (currentBit!5780 (_2!5702 lt!199077)))))))

(declare-fun b!128232 () Bool)

(declare-fun e!85025 () Bool)

(assert (=> b!128232 (= e!85026 e!85025)))

(declare-fun res!106119 () Bool)

(assert (=> b!128232 (=> res!106119 e!85025)))

(assert (=> b!128232 (= res!106119 (= (size!2675 (buf!3033 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!128233 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5916 array!5916 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!128233 (= e!85025 (arrayBitRangesEq!0 (buf!3033 thiss!1634) (buf!3033 (_2!5702 lt!199077)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2675 (buf!3033 thiss!1634)) (currentByte!5785 thiss!1634) (currentBit!5780 thiss!1634))))))

(assert (= (and d!41446 res!106118) b!128231))

(assert (= (and b!128231 res!106117) b!128232))

(assert (= (and b!128232 (not res!106119)) b!128233))

(assert (=> b!128231 m!193941))

(assert (=> b!128231 m!193939))

(assert (=> b!128233 m!193941))

(assert (=> b!128233 m!193941))

(declare-fun m!194001 () Bool)

(assert (=> b!128233 m!194001))

(assert (=> b!128177 d!41446))

(declare-fun d!41448 () Bool)

(declare-fun e!85033 () Bool)

(assert (=> d!41448 e!85033))

(declare-fun res!106131 () Bool)

(assert (=> d!41448 (=> (not res!106131) (not e!85033))))

(declare-fun lt!199175 () (_ BitVec 64))

(declare-fun lt!199174 () (_ BitVec 64))

(declare-fun lt!199172 () (_ BitVec 64))

(assert (=> d!41448 (= res!106131 (= lt!199174 (bvsub lt!199172 lt!199175)))))

(assert (=> d!41448 (or (= (bvand lt!199172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199175 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!199172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!199172 lt!199175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41448 (= lt!199175 (remainingBits!0 ((_ sign_extend 32) (size!2675 (buf!3033 (_2!5702 lt!199077)))) ((_ sign_extend 32) (currentByte!5785 (_2!5702 lt!199077))) ((_ sign_extend 32) (currentBit!5780 (_2!5702 lt!199077)))))))

(declare-fun lt!199171 () (_ BitVec 64))

(declare-fun lt!199176 () (_ BitVec 64))

(assert (=> d!41448 (= lt!199172 (bvmul lt!199171 lt!199176))))

(assert (=> d!41448 (or (= lt!199171 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!199176 (bvsdiv (bvmul lt!199171 lt!199176) lt!199171)))))

(assert (=> d!41448 (= lt!199176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41448 (= lt!199171 ((_ sign_extend 32) (size!2675 (buf!3033 (_2!5702 lt!199077)))))))

(assert (=> d!41448 (= lt!199174 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5785 (_2!5702 lt!199077))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5780 (_2!5702 lt!199077)))))))

(assert (=> d!41448 (invariant!0 (currentBit!5780 (_2!5702 lt!199077)) (currentByte!5785 (_2!5702 lt!199077)) (size!2675 (buf!3033 (_2!5702 lt!199077))))))

(assert (=> d!41448 (= (bitIndex!0 (size!2675 (buf!3033 (_2!5702 lt!199077))) (currentByte!5785 (_2!5702 lt!199077)) (currentBit!5780 (_2!5702 lt!199077))) lt!199174)))

(declare-fun b!128248 () Bool)

(declare-fun res!106130 () Bool)

(assert (=> b!128248 (=> (not res!106130) (not e!85033))))

(assert (=> b!128248 (= res!106130 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!199174))))

(declare-fun b!128249 () Bool)

(declare-fun lt!199173 () (_ BitVec 64))

(assert (=> b!128249 (= e!85033 (bvsle lt!199174 (bvmul lt!199173 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!128249 (or (= lt!199173 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!199173 #b0000000000000000000000000000000000000000000000000000000000001000) lt!199173)))))

(assert (=> b!128249 (= lt!199173 ((_ sign_extend 32) (size!2675 (buf!3033 (_2!5702 lt!199077)))))))

(assert (= (and d!41448 res!106131) b!128248))

(assert (= (and b!128248 res!106130) b!128249))

(declare-fun m!194003 () Bool)

(assert (=> d!41448 m!194003))

(declare-fun m!194005 () Bool)

(assert (=> d!41448 m!194005))

(assert (=> b!128181 d!41448))

(declare-fun d!41450 () Bool)

(declare-fun e!85036 () Bool)

(assert (=> d!41450 e!85036))

(declare-fun res!106136 () Bool)

(assert (=> d!41450 (=> (not res!106136) (not e!85036))))

(declare-fun lt!199198 () (_ BitVec 64))

(declare-fun lt!199201 () (_ BitVec 64))

(declare-fun lt!199200 () (_ BitVec 64))

(assert (=> d!41450 (= res!106136 (= lt!199200 (bvsub lt!199198 lt!199201)))))

(assert (=> d!41450 (or (= (bvand lt!199198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!199198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!199198 lt!199201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41450 (= lt!199201 (remainingBits!0 ((_ sign_extend 32) (size!2675 (buf!3033 thiss!1634))) ((_ sign_extend 32) (currentByte!5785 thiss!1634)) ((_ sign_extend 32) (currentBit!5780 thiss!1634))))))

(declare-fun lt!199197 () (_ BitVec 64))

(declare-fun lt!199202 () (_ BitVec 64))

(assert (=> d!41450 (= lt!199198 (bvmul lt!199197 lt!199202))))

(assert (=> d!41450 (or (= lt!199197 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!199202 (bvsdiv (bvmul lt!199197 lt!199202) lt!199197)))))

(assert (=> d!41450 (= lt!199202 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41450 (= lt!199197 ((_ sign_extend 32) (size!2675 (buf!3033 thiss!1634))))))

(assert (=> d!41450 (= lt!199200 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5785 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5780 thiss!1634))))))

(assert (=> d!41450 (invariant!0 (currentBit!5780 thiss!1634) (currentByte!5785 thiss!1634) (size!2675 (buf!3033 thiss!1634)))))

(assert (=> d!41450 (= (bitIndex!0 (size!2675 (buf!3033 thiss!1634)) (currentByte!5785 thiss!1634) (currentBit!5780 thiss!1634)) lt!199200)))

(declare-fun b!128255 () Bool)

(declare-fun res!106135 () Bool)

(assert (=> b!128255 (=> (not res!106135) (not e!85036))))

(assert (=> b!128255 (= res!106135 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!199200))))

(declare-fun b!128256 () Bool)

(declare-fun lt!199199 () (_ BitVec 64))

(assert (=> b!128256 (= e!85036 (bvsle lt!199200 (bvmul lt!199199 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!128256 (or (= lt!199199 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!199199 #b0000000000000000000000000000000000000000000000000000000000001000) lt!199199)))))

(assert (=> b!128256 (= lt!199199 ((_ sign_extend 32) (size!2675 (buf!3033 thiss!1634))))))

(assert (= (and d!41450 res!106136) b!128255))

(assert (= (and b!128255 res!106135) b!128256))

(declare-fun m!194007 () Bool)

(assert (=> d!41450 m!194007))

(assert (=> d!41450 m!193953))

(assert (=> b!128181 d!41450))

(declare-fun d!41452 () Bool)

(declare-fun e!85050 () Bool)

(assert (=> d!41452 e!85050))

(declare-fun res!106164 () Bool)

(assert (=> d!41452 (=> (not res!106164) (not e!85050))))

(declare-fun lt!199302 () tuple2!10810)

(assert (=> d!41452 (= res!106164 (= (size!2675 (buf!3033 thiss!1634)) (size!2675 (buf!3033 (_2!5702 lt!199302)))))))

(declare-fun choose!6 (BitStream!4614 (_ BitVec 8)) tuple2!10810)

(assert (=> d!41452 (= lt!199302 (choose!6 thiss!1634 (select (arr!3292 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!41452 (validate_offset_byte!0 ((_ sign_extend 32) (size!2675 (buf!3033 thiss!1634))) ((_ sign_extend 32) (currentByte!5785 thiss!1634)) ((_ sign_extend 32) (currentBit!5780 thiss!1634)))))

(assert (=> d!41452 (= (appendByte!0 thiss!1634 (select (arr!3292 arr!237) from!447)) lt!199302)))

(declare-fun b!128290 () Bool)

(declare-fun res!106165 () Bool)

(assert (=> b!128290 (=> (not res!106165) (not e!85050))))

(declare-fun lt!199303 () (_ BitVec 64))

(declare-fun lt!199304 () (_ BitVec 64))

(assert (=> b!128290 (= res!106165 (= (bitIndex!0 (size!2675 (buf!3033 (_2!5702 lt!199302))) (currentByte!5785 (_2!5702 lt!199302)) (currentBit!5780 (_2!5702 lt!199302))) (bvadd lt!199303 lt!199304)))))

(assert (=> b!128290 (or (not (= (bvand lt!199303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199304 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!199303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!199303 lt!199304) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128290 (= lt!199304 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!128290 (= lt!199303 (bitIndex!0 (size!2675 (buf!3033 thiss!1634)) (currentByte!5785 thiss!1634) (currentBit!5780 thiss!1634)))))

(declare-fun b!128291 () Bool)

(declare-fun res!106166 () Bool)

(assert (=> b!128291 (=> (not res!106166) (not e!85050))))

(assert (=> b!128291 (= res!106166 (isPrefixOf!0 thiss!1634 (_2!5702 lt!199302)))))

(declare-fun b!128292 () Bool)

(declare-fun lt!199305 () tuple2!10814)

(declare-fun lt!199301 () tuple2!10812)

(assert (=> b!128292 (= e!85050 (and (= (_2!5704 lt!199305) (select (arr!3292 arr!237) from!447)) (= (_1!5704 lt!199305) (_2!5703 lt!199301))))))

(assert (=> b!128292 (= lt!199305 (readBytePure!0 (_1!5703 lt!199301)))))

(assert (=> b!128292 (= lt!199301 (reader!0 thiss!1634 (_2!5702 lt!199302)))))

(assert (= (and d!41452 res!106164) b!128290))

(assert (= (and b!128290 res!106165) b!128291))

(assert (= (and b!128291 res!106166) b!128292))

(assert (=> d!41452 m!193943))

(declare-fun m!194073 () Bool)

(assert (=> d!41452 m!194073))

(declare-fun m!194075 () Bool)

(assert (=> d!41452 m!194075))

(declare-fun m!194077 () Bool)

(assert (=> b!128290 m!194077))

(assert (=> b!128290 m!193941))

(declare-fun m!194079 () Bool)

(assert (=> b!128291 m!194079))

(declare-fun m!194081 () Bool)

(assert (=> b!128292 m!194081))

(declare-fun m!194083 () Bool)

(assert (=> b!128292 m!194083))

(assert (=> b!128176 d!41452))

(declare-fun d!41470 () Bool)

(declare-datatypes ((tuple2!10826 0))(
  ( (tuple2!10827 (_1!5710 (_ BitVec 8)) (_2!5710 BitStream!4614)) )
))
(declare-fun lt!199319 () tuple2!10826)

(declare-fun readByte!0 (BitStream!4614) tuple2!10826)

(assert (=> d!41470 (= lt!199319 (readByte!0 (_1!5703 lt!199078)))))

(assert (=> d!41470 (= (readBytePure!0 (_1!5703 lt!199078)) (tuple2!10815 (_2!5710 lt!199319) (_1!5710 lt!199319)))))

(declare-fun bs!10083 () Bool)

(assert (= bs!10083 d!41470))

(declare-fun m!194097 () Bool)

(assert (=> bs!10083 m!194097))

(assert (=> b!128180 d!41470))

(declare-fun b!128326 () Bool)

(declare-fun e!85067 () Unit!7952)

(declare-fun lt!199391 () Unit!7952)

(assert (=> b!128326 (= e!85067 lt!199391)))

(declare-fun lt!199385 () (_ BitVec 64))

(assert (=> b!128326 (= lt!199385 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!199386 () (_ BitVec 64))

(assert (=> b!128326 (= lt!199386 (bitIndex!0 (size!2675 (buf!3033 thiss!1634)) (currentByte!5785 thiss!1634) (currentBit!5780 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5916 array!5916 (_ BitVec 64) (_ BitVec 64)) Unit!7952)

(assert (=> b!128326 (= lt!199391 (arrayBitRangesEqSymmetric!0 (buf!3033 thiss!1634) (buf!3033 (_2!5702 lt!199077)) lt!199385 lt!199386))))

(assert (=> b!128326 (arrayBitRangesEq!0 (buf!3033 (_2!5702 lt!199077)) (buf!3033 thiss!1634) lt!199385 lt!199386)))

(declare-fun b!128327 () Bool)

(declare-fun res!106198 () Bool)

(declare-fun e!85066 () Bool)

(assert (=> b!128327 (=> (not res!106198) (not e!85066))))

(declare-fun lt!199392 () tuple2!10812)

(assert (=> b!128327 (= res!106198 (isPrefixOf!0 (_1!5703 lt!199392) thiss!1634))))

(declare-fun b!128328 () Bool)

(declare-fun res!106196 () Bool)

(assert (=> b!128328 (=> (not res!106196) (not e!85066))))

(assert (=> b!128328 (= res!106196 (isPrefixOf!0 (_2!5703 lt!199392) (_2!5702 lt!199077)))))

(declare-fun b!128329 () Bool)

(declare-fun lt!199394 () (_ BitVec 64))

(declare-fun lt!199388 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4614 (_ BitVec 64)) BitStream!4614)

(assert (=> b!128329 (= e!85066 (= (_1!5703 lt!199392) (withMovedBitIndex!0 (_2!5703 lt!199392) (bvsub lt!199388 lt!199394))))))

(assert (=> b!128329 (or (= (bvand lt!199388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!199388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!199388 lt!199394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128329 (= lt!199394 (bitIndex!0 (size!2675 (buf!3033 (_2!5702 lt!199077))) (currentByte!5785 (_2!5702 lt!199077)) (currentBit!5780 (_2!5702 lt!199077))))))

(assert (=> b!128329 (= lt!199388 (bitIndex!0 (size!2675 (buf!3033 thiss!1634)) (currentByte!5785 thiss!1634) (currentBit!5780 thiss!1634)))))

(declare-fun b!128330 () Bool)

(declare-fun Unit!7958 () Unit!7952)

(assert (=> b!128330 (= e!85067 Unit!7958)))

(declare-fun d!41476 () Bool)

(assert (=> d!41476 e!85066))

(declare-fun res!106197 () Bool)

(assert (=> d!41476 (=> (not res!106197) (not e!85066))))

(assert (=> d!41476 (= res!106197 (isPrefixOf!0 (_1!5703 lt!199392) (_2!5703 lt!199392)))))

(declare-fun lt!199383 () BitStream!4614)

(assert (=> d!41476 (= lt!199392 (tuple2!10813 lt!199383 (_2!5702 lt!199077)))))

(declare-fun lt!199375 () Unit!7952)

(declare-fun lt!199393 () Unit!7952)

(assert (=> d!41476 (= lt!199375 lt!199393)))

(assert (=> d!41476 (isPrefixOf!0 lt!199383 (_2!5702 lt!199077))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4614 BitStream!4614 BitStream!4614) Unit!7952)

(assert (=> d!41476 (= lt!199393 (lemmaIsPrefixTransitive!0 lt!199383 (_2!5702 lt!199077) (_2!5702 lt!199077)))))

(declare-fun lt!199378 () Unit!7952)

(declare-fun lt!199382 () Unit!7952)

(assert (=> d!41476 (= lt!199378 lt!199382)))

(assert (=> d!41476 (isPrefixOf!0 lt!199383 (_2!5702 lt!199077))))

(assert (=> d!41476 (= lt!199382 (lemmaIsPrefixTransitive!0 lt!199383 thiss!1634 (_2!5702 lt!199077)))))

(declare-fun lt!199387 () Unit!7952)

(assert (=> d!41476 (= lt!199387 e!85067)))

(declare-fun c!7539 () Bool)

(assert (=> d!41476 (= c!7539 (not (= (size!2675 (buf!3033 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!199389 () Unit!7952)

(declare-fun lt!199379 () Unit!7952)

(assert (=> d!41476 (= lt!199389 lt!199379)))

(assert (=> d!41476 (isPrefixOf!0 (_2!5702 lt!199077) (_2!5702 lt!199077))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4614) Unit!7952)

(assert (=> d!41476 (= lt!199379 (lemmaIsPrefixRefl!0 (_2!5702 lt!199077)))))

(declare-fun lt!199384 () Unit!7952)

(declare-fun lt!199381 () Unit!7952)

(assert (=> d!41476 (= lt!199384 lt!199381)))

(assert (=> d!41476 (= lt!199381 (lemmaIsPrefixRefl!0 (_2!5702 lt!199077)))))

(declare-fun lt!199390 () Unit!7952)

(declare-fun lt!199376 () Unit!7952)

(assert (=> d!41476 (= lt!199390 lt!199376)))

(assert (=> d!41476 (isPrefixOf!0 lt!199383 lt!199383)))

(assert (=> d!41476 (= lt!199376 (lemmaIsPrefixRefl!0 lt!199383))))

(declare-fun lt!199377 () Unit!7952)

(declare-fun lt!199380 () Unit!7952)

(assert (=> d!41476 (= lt!199377 lt!199380)))

(assert (=> d!41476 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41476 (= lt!199380 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41476 (= lt!199383 (BitStream!4615 (buf!3033 (_2!5702 lt!199077)) (currentByte!5785 thiss!1634) (currentBit!5780 thiss!1634)))))

(assert (=> d!41476 (isPrefixOf!0 thiss!1634 (_2!5702 lt!199077))))

(assert (=> d!41476 (= (reader!0 thiss!1634 (_2!5702 lt!199077)) lt!199392)))

(assert (= (and d!41476 c!7539) b!128326))

(assert (= (and d!41476 (not c!7539)) b!128330))

(assert (= (and d!41476 res!106197) b!128327))

(assert (= (and b!128327 res!106198) b!128328))

(assert (= (and b!128328 res!106196) b!128329))

(assert (=> b!128326 m!193941))

(declare-fun m!194113 () Bool)

(assert (=> b!128326 m!194113))

(declare-fun m!194115 () Bool)

(assert (=> b!128326 m!194115))

(declare-fun m!194117 () Bool)

(assert (=> b!128328 m!194117))

(declare-fun m!194119 () Bool)

(assert (=> b!128327 m!194119))

(declare-fun m!194121 () Bool)

(assert (=> b!128329 m!194121))

(assert (=> b!128329 m!193939))

(assert (=> b!128329 m!193941))

(declare-fun m!194123 () Bool)

(assert (=> d!41476 m!194123))

(declare-fun m!194125 () Bool)

(assert (=> d!41476 m!194125))

(assert (=> d!41476 m!193961))

(declare-fun m!194127 () Bool)

(assert (=> d!41476 m!194127))

(declare-fun m!194129 () Bool)

(assert (=> d!41476 m!194129))

(declare-fun m!194131 () Bool)

(assert (=> d!41476 m!194131))

(declare-fun m!194133 () Bool)

(assert (=> d!41476 m!194133))

(declare-fun m!194135 () Bool)

(assert (=> d!41476 m!194135))

(declare-fun m!194137 () Bool)

(assert (=> d!41476 m!194137))

(declare-fun m!194139 () Bool)

(assert (=> d!41476 m!194139))

(declare-fun m!194141 () Bool)

(assert (=> d!41476 m!194141))

(assert (=> b!128180 d!41476))

(declare-fun d!41480 () Bool)

(assert (=> d!41480 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2675 (buf!3033 thiss!1634))) ((_ sign_extend 32) (currentByte!5785 thiss!1634)) ((_ sign_extend 32) (currentBit!5780 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2675 (buf!3033 thiss!1634))) ((_ sign_extend 32) (currentByte!5785 thiss!1634)) ((_ sign_extend 32) (currentBit!5780 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10085 () Bool)

(assert (= bs!10085 d!41480))

(assert (=> bs!10085 m!194007))

(assert (=> b!128179 d!41480))

(check-sat (not b!128327) (not d!41452) (not b!128233) (not d!41476) (not b!128290) (not d!41470) (not d!41450) (not b!128329) (not d!41480) (not d!41444) (not b!128291) (not b!128231) (not b!128328) (not b!128292) (not b!128326) (not d!41448))
