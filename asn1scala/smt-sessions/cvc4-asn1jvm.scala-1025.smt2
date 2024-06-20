; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29330 () Bool)

(assert start!29330)

(declare-fun b!152046 () Bool)

(declare-fun e!101661 () Bool)

(declare-datatypes ((array!6789 0))(
  ( (array!6790 (arr!3889 (Array (_ BitVec 32) (_ BitVec 8))) (size!3072 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5402 0))(
  ( (BitStream!5403 (buf!3569 array!6789) (currentByte!6501 (_ BitVec 32)) (currentBit!6496 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5402)

(declare-fun lt!238043 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152046 (= e!101661 (validate_offset_bits!1 ((_ sign_extend 32) (size!3072 (buf!3569 thiss!1634))) ((_ sign_extend 32) (currentByte!6501 thiss!1634)) ((_ sign_extend 32) (currentBit!6496 thiss!1634)) lt!238043))))

(declare-fun b!152047 () Bool)

(declare-fun res!127496 () Bool)

(declare-fun e!101660 () Bool)

(assert (=> b!152047 (=> (not res!127496) (not e!101660))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!152047 (= res!127496 (bvsge from!447 to!404))))

(declare-fun b!152048 () Bool)

(declare-fun e!101656 () Bool)

(declare-fun array_inv!2861 (array!6789) Bool)

(assert (=> b!152048 (= e!101656 (array_inv!2861 (buf!3569 thiss!1634)))))

(declare-fun b!152050 () Bool)

(declare-fun e!101659 () Bool)

(assert (=> b!152050 (= e!101660 (not e!101659))))

(declare-fun res!127495 () Bool)

(assert (=> b!152050 (=> res!127495 e!101659)))

(declare-fun lt!238042 () (_ BitVec 64))

(assert (=> b!152050 (= res!127495 (not (= lt!238042 (bvadd lt!238042 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!238043)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152050 (= lt!238042 (bitIndex!0 (size!3072 (buf!3569 thiss!1634)) (currentByte!6501 thiss!1634) (currentBit!6496 thiss!1634)))))

(assert (=> b!152050 (= lt!238043 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5402 BitStream!5402) Bool)

(assert (=> b!152050 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9656 0))(
  ( (Unit!9657) )
))
(declare-fun lt!238044 () Unit!9656)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5402) Unit!9656)

(assert (=> b!152050 (= lt!238044 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!152051 () Bool)

(declare-fun res!127494 () Bool)

(assert (=> b!152051 (=> (not res!127494) (not e!101660))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!152051 (= res!127494 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3072 (buf!3569 thiss!1634))) ((_ sign_extend 32) (currentByte!6501 thiss!1634)) ((_ sign_extend 32) (currentBit!6496 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!152049 () Bool)

(assert (=> b!152049 (= e!101659 e!101661)))

(declare-fun res!127493 () Bool)

(assert (=> b!152049 (=> res!127493 e!101661)))

(assert (=> b!152049 (= res!127493 (bvslt lt!238043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!13538 0))(
  ( (tuple2!13539 (_1!7144 BitStream!5402) (_2!7144 BitStream!5402)) )
))
(declare-fun lt!238045 () tuple2!13538)

(declare-fun reader!0 (BitStream!5402 BitStream!5402) tuple2!13538)

(assert (=> b!152049 (= lt!238045 (reader!0 thiss!1634 thiss!1634))))

(declare-fun res!127497 () Bool)

(assert (=> start!29330 (=> (not res!127497) (not e!101660))))

(declare-fun arr!237 () array!6789)

(assert (=> start!29330 (= res!127497 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3072 arr!237))))))

(assert (=> start!29330 e!101660))

(assert (=> start!29330 true))

(assert (=> start!29330 (array_inv!2861 arr!237)))

(declare-fun inv!12 (BitStream!5402) Bool)

(assert (=> start!29330 (and (inv!12 thiss!1634) e!101656)))

(assert (= (and start!29330 res!127497) b!152051))

(assert (= (and b!152051 res!127494) b!152047))

(assert (= (and b!152047 res!127496) b!152050))

(assert (= (and b!152050 (not res!127495)) b!152049))

(assert (= (and b!152049 (not res!127493)) b!152046))

(assert (= start!29330 b!152048))

(declare-fun m!237763 () Bool)

(assert (=> b!152049 m!237763))

(declare-fun m!237765 () Bool)

(assert (=> b!152050 m!237765))

(declare-fun m!237767 () Bool)

(assert (=> b!152050 m!237767))

(declare-fun m!237769 () Bool)

(assert (=> b!152050 m!237769))

(declare-fun m!237771 () Bool)

(assert (=> b!152046 m!237771))

(declare-fun m!237773 () Bool)

(assert (=> start!29330 m!237773))

(declare-fun m!237775 () Bool)

(assert (=> start!29330 m!237775))

(declare-fun m!237777 () Bool)

(assert (=> b!152051 m!237777))

(declare-fun m!237779 () Bool)

(assert (=> b!152048 m!237779))

(push 1)

(assert (not b!152051))

(assert (not b!152049))

(assert (not b!152046))

(assert (not b!152048))

(assert (not b!152050))

(assert (not start!29330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!49840 () Bool)

(assert (=> d!49840 (= (array_inv!2861 (buf!3569 thiss!1634)) (bvsge (size!3072 (buf!3569 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!152048 d!49840))

(declare-fun d!49842 () Bool)

(assert (=> d!49842 (= (array_inv!2861 arr!237) (bvsge (size!3072 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!29330 d!49842))

(declare-fun d!49844 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!49844 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6496 thiss!1634) (currentByte!6501 thiss!1634) (size!3072 (buf!3569 thiss!1634))))))

(declare-fun bs!12182 () Bool)

(assert (= bs!12182 d!49844))

(declare-fun m!237781 () Bool)

(assert (=> bs!12182 m!237781))

(assert (=> start!29330 d!49844))

(declare-fun d!49846 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3072 (buf!3569 thiss!1634))) ((_ sign_extend 32) (currentByte!6501 thiss!1634)) ((_ sign_extend 32) (currentBit!6496 thiss!1634)) lt!238043) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3072 (buf!3569 thiss!1634))) ((_ sign_extend 32) (currentByte!6501 thiss!1634)) ((_ sign_extend 32) (currentBit!6496 thiss!1634))) lt!238043))))

(declare-fun bs!12183 () Bool)

(assert (= bs!12183 d!49846))

(declare-fun m!237783 () Bool)

(assert (=> bs!12183 m!237783))

(assert (=> b!152046 d!49846))

(declare-fun d!49848 () Bool)

(assert (=> d!49848 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3072 (buf!3569 thiss!1634))) ((_ sign_extend 32) (currentByte!6501 thiss!1634)) ((_ sign_extend 32) (currentBit!6496 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3072 (buf!3569 thiss!1634))) ((_ sign_extend 32) (currentByte!6501 thiss!1634)) ((_ sign_extend 32) (currentBit!6496 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12184 () Bool)

(assert (= bs!12184 d!49848))

(assert (=> bs!12184 m!237783))

(assert (=> b!152051 d!49848))

(declare-fun lt!238149 () (_ BitVec 64))

(declare-fun e!101672 () Bool)

(declare-fun lt!238151 () tuple2!13538)

(declare-fun b!152077 () Bool)

(declare-fun lt!238147 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5402 (_ BitVec 64)) BitStream!5402)

(assert (=> b!152077 (= e!101672 (= (_1!7144 lt!238151) (withMovedBitIndex!0 (_2!7144 lt!238151) (bvsub lt!238147 lt!238149))))))

(assert (=> b!152077 (or (= (bvand lt!238147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238149 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238147 lt!238149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!152077 (= lt!238149 (bitIndex!0 (size!3072 (buf!3569 thiss!1634)) (currentByte!6501 thiss!1634) (currentBit!6496 thiss!1634)))))

(assert (=> b!152077 (= lt!238147 (bitIndex!0 (size!3072 (buf!3569 thiss!1634)) (currentByte!6501 thiss!1634) (currentBit!6496 thiss!1634)))))

(declare-fun d!49850 () Bool)

(assert (=> d!49850 e!101672))

(declare-fun res!127515 () Bool)

(assert (=> d!49850 (=> (not res!127515) (not e!101672))))

(assert (=> d!49850 (= res!127515 (isPrefixOf!0 (_1!7144 lt!238151) (_2!7144 lt!238151)))))

(declare-fun lt!238152 () BitStream!5402)

(assert (=> d!49850 (= lt!238151 (tuple2!13539 lt!238152 thiss!1634))))

(declare-fun lt!238157 () Unit!9656)

(declare-fun lt!238159 () Unit!9656)

(assert (=> d!49850 (= lt!238157 lt!238159)))

(assert (=> d!49850 (isPrefixOf!0 lt!238152 thiss!1634)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5402 BitStream!5402 BitStream!5402) Unit!9656)

(assert (=> d!49850 (= lt!238159 (lemmaIsPrefixTransitive!0 lt!238152 thiss!1634 thiss!1634))))

(declare-fun lt!238163 () Unit!9656)

(declare-fun lt!238154 () Unit!9656)

(assert (=> d!49850 (= lt!238163 lt!238154)))

(assert (=> d!49850 (isPrefixOf!0 lt!238152 thiss!1634)))

(assert (=> d!49850 (= lt!238154 (lemmaIsPrefixTransitive!0 lt!238152 thiss!1634 thiss!1634))))

(declare-fun lt!238150 () Unit!9656)

(declare-fun e!101673 () Unit!9656)

(assert (=> d!49850 (= lt!238150 e!101673)))

(declare-fun c!8124 () Bool)

(assert (=> d!49850 (= c!8124 (not (= (size!3072 (buf!3569 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!238165 () Unit!9656)

(declare-fun lt!238146 () Unit!9656)

(assert (=> d!49850 (= lt!238165 lt!238146)))

(assert (=> d!49850 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49850 (= lt!238146 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238161 () Unit!9656)

(declare-fun lt!238164 () Unit!9656)

(assert (=> d!49850 (= lt!238161 lt!238164)))

(assert (=> d!49850 (= lt!238164 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238153 () Unit!9656)

(declare-fun lt!238156 () Unit!9656)

(assert (=> d!49850 (= lt!238153 lt!238156)))

(assert (=> d!49850 (isPrefixOf!0 lt!238152 lt!238152)))

(assert (=> d!49850 (= lt!238156 (lemmaIsPrefixRefl!0 lt!238152))))

(declare-fun lt!238158 () Unit!9656)

(declare-fun lt!238148 () Unit!9656)

(assert (=> d!49850 (= lt!238158 lt!238148)))

(assert (=> d!49850 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49850 (= lt!238148 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49850 (= lt!238152 (BitStream!5403 (buf!3569 thiss!1634) (currentByte!6501 thiss!1634) (currentBit!6496 thiss!1634)))))

(assert (=> d!49850 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49850 (= (reader!0 thiss!1634 thiss!1634) lt!238151)))

(declare-fun b!152078 () Bool)

(declare-fun lt!238155 () Unit!9656)

(assert (=> b!152078 (= e!101673 lt!238155)))

(declare-fun lt!238160 () (_ BitVec 64))

(assert (=> b!152078 (= lt!238160 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!238162 () (_ BitVec 64))

(assert (=> b!152078 (= lt!238162 (bitIndex!0 (size!3072 (buf!3569 thiss!1634)) (currentByte!6501 thiss!1634) (currentBit!6496 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6789 array!6789 (_ BitVec 64) (_ BitVec 64)) Unit!9656)

(assert (=> b!152078 (= lt!238155 (arrayBitRangesEqSymmetric!0 (buf!3569 thiss!1634) (buf!3569 thiss!1634) lt!238160 lt!238162))))

(declare-fun arrayBitRangesEq!0 (array!6789 array!6789 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152078 (arrayBitRangesEq!0 (buf!3569 thiss!1634) (buf!3569 thiss!1634) lt!238160 lt!238162)))

(declare-fun b!152079 () Bool)

(declare-fun res!127513 () Bool)

(assert (=> b!152079 (=> (not res!127513) (not e!101672))))

(assert (=> b!152079 (= res!127513 (isPrefixOf!0 (_1!7144 lt!238151) thiss!1634))))

(declare-fun b!152080 () Bool)

(declare-fun res!127514 () Bool)

(assert (=> b!152080 (=> (not res!127514) (not e!101672))))

(assert (=> b!152080 (= res!127514 (isPrefixOf!0 (_2!7144 lt!238151) thiss!1634))))

(declare-fun b!152081 () Bool)

(declare-fun Unit!9659 () Unit!9656)

(assert (=> b!152081 (= e!101673 Unit!9659)))

(assert (= (and d!49850 c!8124) b!152078))

(assert (= (and d!49850 (not c!8124)) b!152081))

(assert (= (and d!49850 res!127515) b!152079))

(assert (= (and b!152079 res!127513) b!152080))

(assert (= (and b!152080 res!127514) b!152077))

(declare-fun m!237809 () Bool)

(assert (=> b!152080 m!237809))

(declare-fun m!237811 () Bool)

(assert (=> b!152077 m!237811))

(assert (=> b!152077 m!237765))

(assert (=> b!152077 m!237765))

(assert (=> d!49850 m!237767))

(assert (=> d!49850 m!237767))

(assert (=> d!49850 m!237769))

(declare-fun m!237813 () Bool)

(assert (=> d!49850 m!237813))

(assert (=> d!49850 m!237769))

(declare-fun m!237815 () Bool)

(assert (=> d!49850 m!237815))

(assert (=> d!49850 m!237815))

(assert (=> d!49850 m!237767))

(declare-fun m!237817 () Bool)

(assert (=> d!49850 m!237817))

(declare-fun m!237819 () Bool)

(assert (=> d!49850 m!237819))

(declare-fun m!237821 () Bool)

(assert (=> d!49850 m!237821))

(assert (=> b!152078 m!237765))

(declare-fun m!237823 () Bool)

(assert (=> b!152078 m!237823))

(declare-fun m!237825 () Bool)

(assert (=> b!152078 m!237825))

(declare-fun m!237827 () Bool)

(assert (=> b!152079 m!237827))

(assert (=> b!152049 d!49850))

(declare-fun d!49862 () Bool)

(declare-fun e!101679 () Bool)

(assert (=> d!49862 e!101679))

(declare-fun res!127527 () Bool)

(assert (=> d!49862 (=> (not res!127527) (not e!101679))))

(declare-fun lt!238201 () (_ BitVec 64))

(declare-fun lt!238198 () (_ BitVec 64))

(declare-fun lt!238196 () (_ BitVec 64))

(assert (=> d!49862 (= res!127527 (= lt!238196 (bvsub lt!238201 lt!238198)))))

(assert (=> d!49862 (or (= (bvand lt!238201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238198 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238201 lt!238198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49862 (= lt!238198 (remainingBits!0 ((_ sign_extend 32) (size!3072 (buf!3569 thiss!1634))) ((_ sign_extend 32) (currentByte!6501 thiss!1634)) ((_ sign_extend 32) (currentBit!6496 thiss!1634))))))

(declare-fun lt!238199 () (_ BitVec 64))

(declare-fun lt!238200 () (_ BitVec 64))

(assert (=> d!49862 (= lt!238201 (bvmul lt!238199 lt!238200))))

(assert (=> d!49862 (or (= lt!238199 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!238200 (bvsdiv (bvmul lt!238199 lt!238200) lt!238199)))))

(assert (=> d!49862 (= lt!238200 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49862 (= lt!238199 ((_ sign_extend 32) (size!3072 (buf!3569 thiss!1634))))))

(assert (=> d!49862 (= lt!238196 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6501 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6496 thiss!1634))))))

(assert (=> d!49862 (invariant!0 (currentBit!6496 thiss!1634) (currentByte!6501 thiss!1634) (size!3072 (buf!3569 thiss!1634)))))

(assert (=> d!49862 (= (bitIndex!0 (size!3072 (buf!3569 thiss!1634)) (currentByte!6501 thiss!1634) (currentBit!6496 thiss!1634)) lt!238196)))

(declare-fun b!152092 () Bool)

(declare-fun res!127526 () Bool)

(assert (=> b!152092 (=> (not res!127526) (not e!101679))))

(assert (=> b!152092 (= res!127526 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!238196))))

(declare-fun b!152093 () Bool)

(declare-fun lt!238197 () (_ BitVec 64))

(assert (=> b!152093 (= e!101679 (bvsle lt!238196 (bvmul lt!238197 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152093 (or (= lt!238197 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!238197 #b0000000000000000000000000000000000000000000000000000000000001000) lt!238197)))))

(assert (=> b!152093 (= lt!238197 ((_ sign_extend 32) (size!3072 (buf!3569 thiss!1634))))))

(assert (= (and d!49862 res!127527) b!152092))

(assert (= (and b!152092 res!127526) b!152093))

(assert (=> d!49862 m!237783))

(assert (=> d!49862 m!237781))

(assert (=> b!152050 d!49862))

(declare-fun d!49866 () Bool)

(declare-fun res!127544 () Bool)

(declare-fun e!101691 () Bool)

(assert (=> d!49866 (=> (not res!127544) (not e!101691))))

(assert (=> d!49866 (= res!127544 (= (size!3072 (buf!3569 thiss!1634)) (size!3072 (buf!3569 thiss!1634))))))

(assert (=> d!49866 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!101691)))

(declare-fun b!152109 () Bool)

(declare-fun res!127543 () Bool)

(assert (=> b!152109 (=> (not res!127543) (not e!101691))))

(assert (=> b!152109 (= res!127543 (bvsle (bitIndex!0 (size!3072 (buf!3569 thiss!1634)) (currentByte!6501 thiss!1634) (currentBit!6496 thiss!1634)) (bitIndex!0 (size!3072 (buf!3569 thiss!1634)) (currentByte!6501 thiss!1634) (currentBit!6496 thiss!1634))))))

(declare-fun b!152110 () Bool)

(declare-fun e!101690 () Bool)

(assert (=> b!152110 (= e!101691 e!101690)))

(declare-fun res!127545 () Bool)

(assert (=> b!152110 (=> res!127545 e!101690)))

(assert (=> b!152110 (= res!127545 (= (size!3072 (buf!3569 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!152111 () Bool)

(assert (=> b!152111 (= e!101690 (arrayBitRangesEq!0 (buf!3569 thiss!1634) (buf!3569 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3072 (buf!3569 thiss!1634)) (currentByte!6501 thiss!1634) (currentBit!6496 thiss!1634))))))

(assert (= (and d!49866 res!127544) b!152109))

(assert (= (and b!152109 res!127543) b!152110))

(assert (= (and b!152110 (not res!127545)) b!152111))

(assert (=> b!152109 m!237765))

(assert (=> b!152109 m!237765))

(assert (=> b!152111 m!237765))

(assert (=> b!152111 m!237765))

(declare-fun m!237831 () Bool)

(assert (=> b!152111 m!237831))

(assert (=> b!152050 d!49866))

(declare-fun d!49870 () Bool)

(assert (=> d!49870 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!238207 () Unit!9656)

(declare-fun choose!11 (BitStream!5402) Unit!9656)

(assert (=> d!49870 (= lt!238207 (choose!11 thiss!1634))))

(assert (=> d!49870 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!238207)))

(declare-fun bs!12191 () Bool)

(assert (= bs!12191 d!49870))

(assert (=> bs!12191 m!237767))

(declare-fun m!237835 () Bool)

(assert (=> bs!12191 m!237835))

(assert (=> b!152050 d!49870))

(push 1)

(assert (not d!49850))

(assert (not d!49846))

(assert (not d!49844))

(assert (not b!152079))

(assert (not b!152111))

(assert (not d!49870))

(assert (not b!152109))

(assert (not b!152078))

(assert (not b!152077))

(assert (not d!49848))

(assert (not d!49862))

(assert (not b!152080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

