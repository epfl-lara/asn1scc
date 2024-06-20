; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17766 () Bool)

(assert start!17766)

(declare-fun b!86213 () Bool)

(declare-fun res!70803 () Bool)

(declare-fun e!57361 () Bool)

(assert (=> b!86213 (=> (not res!70803) (not e!57361))))

(declare-datatypes ((array!4091 0))(
  ( (array!4092 (arr!2485 (Array (_ BitVec 32) (_ BitVec 8))) (size!1848 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3258 0))(
  ( (BitStream!3259 (buf!2238 array!4091) (currentByte!4444 (_ BitVec 32)) (currentBit!4439 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3258)

(declare-fun thiss!1151 () BitStream!3258)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!86213 (= res!70803 (and (bvsle i!576 nBits!336) (= (size!1848 (buf!2238 thiss!1152)) (size!1848 (buf!2238 thiss!1151)))))))

(declare-fun res!70808 () Bool)

(assert (=> start!17766 (=> (not res!70808) (not e!57361))))

(assert (=> start!17766 (= res!70808 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17766 e!57361))

(declare-fun e!57359 () Bool)

(declare-fun inv!12 (BitStream!3258) Bool)

(assert (=> start!17766 (and (inv!12 thiss!1152) e!57359)))

(declare-fun e!57355 () Bool)

(assert (=> start!17766 (and (inv!12 thiss!1151) e!57355)))

(assert (=> start!17766 true))

(declare-fun b!86214 () Bool)

(declare-fun res!70816 () Bool)

(declare-fun e!57356 () Bool)

(assert (=> b!86214 (=> res!70816 e!57356)))

(declare-datatypes ((Unit!5712 0))(
  ( (Unit!5713) )
))
(declare-datatypes ((tuple3!396 0))(
  ( (tuple3!397 (_1!3883 Unit!5712) (_2!3883 BitStream!3258) (_3!222 (_ BitVec 32))) )
))
(declare-fun lt!135065 () tuple3!396)

(assert (=> b!86214 (= res!70816 (or (bvsgt (_3!222 lt!135065) nBits!336) (not (= (size!1848 (buf!2238 (_2!3883 lt!135065))) (size!1848 (buf!2238 thiss!1151))))))))

(declare-fun b!86215 () Bool)

(declare-fun e!57360 () Bool)

(declare-fun e!57357 () Bool)

(assert (=> b!86215 (= e!57360 (not e!57357))))

(declare-fun res!70800 () Bool)

(assert (=> b!86215 (=> res!70800 e!57357)))

(declare-datatypes ((tuple2!7322 0))(
  ( (tuple2!7323 (_1!3884 Unit!5712) (_2!3884 BitStream!3258)) )
))
(declare-fun lt!135062 () tuple2!7322)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86215 (= res!70800 (not (invariant!0 (currentBit!4439 (_2!3884 lt!135062)) (currentByte!4444 (_2!3884 lt!135062)) (size!1848 (buf!2238 (_2!3884 lt!135062))))))))

(declare-fun e!57358 () Bool)

(assert (=> b!86215 e!57358))

(declare-fun res!70807 () Bool)

(assert (=> b!86215 (=> (not res!70807) (not e!57358))))

(assert (=> b!86215 (= res!70807 (= (size!1848 (buf!2238 thiss!1152)) (size!1848 (buf!2238 (_2!3884 lt!135062)))))))

(declare-fun lt!135063 () Bool)

(declare-fun appendBit!0 (BitStream!3258 Bool) tuple2!7322)

(assert (=> b!86215 (= lt!135062 (appendBit!0 thiss!1152 lt!135063))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!86215 (= lt!135063 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86216 () Bool)

(declare-fun e!57353 () Bool)

(declare-datatypes ((tuple2!7324 0))(
  ( (tuple2!7325 (_1!3885 BitStream!3258) (_2!3885 Bool)) )
))
(declare-fun lt!135064 () tuple2!7324)

(declare-fun lt!135061 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86216 (= e!57353 (= (bitIndex!0 (size!1848 (buf!2238 (_1!3885 lt!135064))) (currentByte!4444 (_1!3885 lt!135064)) (currentBit!4439 (_1!3885 lt!135064))) lt!135061))))

(declare-fun b!86217 () Bool)

(declare-fun res!70811 () Bool)

(assert (=> b!86217 (=> res!70811 e!57356)))

(declare-fun lt!135060 () (_ BitVec 64))

(assert (=> b!86217 (= res!70811 (not (= (bitIndex!0 (size!1848 (buf!2238 (_2!3883 lt!135065))) (currentByte!4444 (_2!3883 lt!135065)) (currentBit!4439 (_2!3883 lt!135065))) (bvadd lt!135060 ((_ sign_extend 32) (_3!222 lt!135065))))))))

(declare-fun b!86218 () Bool)

(declare-fun res!70815 () Bool)

(assert (=> b!86218 (=> (not res!70815) (not e!57361))))

(assert (=> b!86218 (= res!70815 (invariant!0 (currentBit!4439 thiss!1151) (currentByte!4444 thiss!1151) (size!1848 (buf!2238 thiss!1151))))))

(declare-fun b!86219 () Bool)

(assert (=> b!86219 (= e!57357 e!57356)))

(declare-fun res!70810 () Bool)

(assert (=> b!86219 (=> res!70810 e!57356)))

(assert (=> b!86219 (= res!70810 (bvslt (_3!222 lt!135065) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3258 (_ BitVec 64) BitStream!3258 (_ BitVec 32)) tuple3!396)

(assert (=> b!86219 (= lt!135065 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3884 lt!135062) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86220 () Bool)

(declare-fun array_inv!1694 (array!4091) Bool)

(assert (=> b!86220 (= e!57355 (array_inv!1694 (buf!2238 thiss!1151)))))

(declare-fun b!86221 () Bool)

(declare-fun e!57363 () Bool)

(assert (=> b!86221 (= e!57358 e!57363)))

(declare-fun res!70798 () Bool)

(assert (=> b!86221 (=> (not res!70798) (not e!57363))))

(declare-fun lt!135066 () (_ BitVec 64))

(assert (=> b!86221 (= res!70798 (= lt!135061 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135066)))))

(assert (=> b!86221 (= lt!135061 (bitIndex!0 (size!1848 (buf!2238 (_2!3884 lt!135062))) (currentByte!4444 (_2!3884 lt!135062)) (currentBit!4439 (_2!3884 lt!135062))))))

(declare-fun b!86222 () Bool)

(assert (=> b!86222 (= e!57356 (and (bvsle ((_ sign_extend 32) (size!1848 (buf!2238 (_2!3883 lt!135065)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4444 (_2!3883 lt!135065))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4439 (_2!3883 lt!135065))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!86223 () Bool)

(declare-fun res!70809 () Bool)

(assert (=> b!86223 (=> (not res!70809) (not e!57360))))

(assert (=> b!86223 (= res!70809 (bvslt i!576 nBits!336))))

(declare-fun b!86224 () Bool)

(declare-fun res!70806 () Bool)

(assert (=> b!86224 (=> (not res!70806) (not e!57361))))

(assert (=> b!86224 (= res!70806 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86225 () Bool)

(declare-fun res!70814 () Bool)

(assert (=> b!86225 (=> (not res!70814) (not e!57361))))

(assert (=> b!86225 (= res!70814 (invariant!0 (currentBit!4439 thiss!1152) (currentByte!4444 thiss!1152) (size!1848 (buf!2238 thiss!1152))))))

(declare-fun b!86226 () Bool)

(assert (=> b!86226 (= e!57361 e!57360)))

(declare-fun res!70813 () Bool)

(assert (=> b!86226 (=> (not res!70813) (not e!57360))))

(assert (=> b!86226 (= res!70813 (= lt!135066 (bvadd lt!135060 ((_ sign_extend 32) i!576))))))

(assert (=> b!86226 (= lt!135066 (bitIndex!0 (size!1848 (buf!2238 thiss!1152)) (currentByte!4444 thiss!1152) (currentBit!4439 thiss!1152)))))

(assert (=> b!86226 (= lt!135060 (bitIndex!0 (size!1848 (buf!2238 thiss!1151)) (currentByte!4444 thiss!1151) (currentBit!4439 thiss!1151)))))

(declare-fun b!86227 () Bool)

(declare-fun res!70804 () Bool)

(assert (=> b!86227 (=> (not res!70804) (not e!57363))))

(declare-fun isPrefixOf!0 (BitStream!3258 BitStream!3258) Bool)

(assert (=> b!86227 (= res!70804 (isPrefixOf!0 thiss!1152 (_2!3884 lt!135062)))))

(declare-fun b!86228 () Bool)

(assert (=> b!86228 (= e!57359 (array_inv!1694 (buf!2238 thiss!1152)))))

(declare-fun b!86229 () Bool)

(declare-fun res!70805 () Bool)

(assert (=> b!86229 (=> res!70805 e!57357)))

(assert (=> b!86229 (= res!70805 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86230 () Bool)

(declare-fun res!70802 () Bool)

(assert (=> b!86230 (=> (not res!70802) (not e!57361))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86230 (= res!70802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1848 (buf!2238 thiss!1151))) ((_ sign_extend 32) (currentByte!4444 thiss!1151)) ((_ sign_extend 32) (currentBit!4439 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86231 () Bool)

(declare-fun res!70799 () Bool)

(assert (=> b!86231 (=> res!70799 e!57356)))

(assert (=> b!86231 (= res!70799 (not (invariant!0 (currentBit!4439 (_2!3883 lt!135065)) (currentByte!4444 (_2!3883 lt!135065)) (size!1848 (buf!2238 (_2!3883 lt!135065))))))))

(declare-fun b!86232 () Bool)

(declare-fun res!70801 () Bool)

(assert (=> b!86232 (=> (not res!70801) (not e!57360))))

(assert (=> b!86232 (= res!70801 (validate_offset_bits!1 ((_ sign_extend 32) (size!1848 (buf!2238 thiss!1152))) ((_ sign_extend 32) (currentByte!4444 thiss!1152)) ((_ sign_extend 32) (currentBit!4439 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86233 () Bool)

(assert (=> b!86233 (= e!57363 e!57353)))

(declare-fun res!70812 () Bool)

(assert (=> b!86233 (=> (not res!70812) (not e!57353))))

(assert (=> b!86233 (= res!70812 (and (= (_2!3885 lt!135064) lt!135063) (= (_1!3885 lt!135064) (_2!3884 lt!135062))))))

(declare-fun readBitPure!0 (BitStream!3258) tuple2!7324)

(declare-fun readerFrom!0 (BitStream!3258 (_ BitVec 32) (_ BitVec 32)) BitStream!3258)

(assert (=> b!86233 (= lt!135064 (readBitPure!0 (readerFrom!0 (_2!3884 lt!135062) (currentBit!4439 thiss!1152) (currentByte!4444 thiss!1152))))))

(assert (= (and start!17766 res!70808) b!86230))

(assert (= (and b!86230 res!70802) b!86218))

(assert (= (and b!86218 res!70815) b!86224))

(assert (= (and b!86224 res!70806) b!86225))

(assert (= (and b!86225 res!70814) b!86213))

(assert (= (and b!86213 res!70803) b!86226))

(assert (= (and b!86226 res!70813) b!86232))

(assert (= (and b!86232 res!70801) b!86223))

(assert (= (and b!86223 res!70809) b!86215))

(assert (= (and b!86215 res!70807) b!86221))

(assert (= (and b!86221 res!70798) b!86227))

(assert (= (and b!86227 res!70804) b!86233))

(assert (= (and b!86233 res!70812) b!86216))

(assert (= (and b!86215 (not res!70800)) b!86229))

(assert (= (and b!86229 (not res!70805)) b!86219))

(assert (= (and b!86219 (not res!70810)) b!86231))

(assert (= (and b!86231 (not res!70799)) b!86214))

(assert (= (and b!86214 (not res!70816)) b!86217))

(assert (= (and b!86217 (not res!70811)) b!86222))

(assert (= start!17766 b!86228))

(assert (= start!17766 b!86220))

(declare-fun m!132129 () Bool)

(assert (=> b!86226 m!132129))

(declare-fun m!132131 () Bool)

(assert (=> b!86226 m!132131))

(declare-fun m!132133 () Bool)

(assert (=> start!17766 m!132133))

(declare-fun m!132135 () Bool)

(assert (=> start!17766 m!132135))

(declare-fun m!132137 () Bool)

(assert (=> b!86228 m!132137))

(declare-fun m!132139 () Bool)

(assert (=> b!86221 m!132139))

(declare-fun m!132141 () Bool)

(assert (=> b!86230 m!132141))

(declare-fun m!132143 () Bool)

(assert (=> b!86215 m!132143))

(declare-fun m!132145 () Bool)

(assert (=> b!86215 m!132145))

(declare-fun m!132147 () Bool)

(assert (=> b!86232 m!132147))

(declare-fun m!132149 () Bool)

(assert (=> b!86220 m!132149))

(declare-fun m!132151 () Bool)

(assert (=> b!86217 m!132151))

(declare-fun m!132153 () Bool)

(assert (=> b!86227 m!132153))

(declare-fun m!132155 () Bool)

(assert (=> b!86218 m!132155))

(declare-fun m!132157 () Bool)

(assert (=> b!86219 m!132157))

(declare-fun m!132159 () Bool)

(assert (=> b!86216 m!132159))

(declare-fun m!132161 () Bool)

(assert (=> b!86225 m!132161))

(declare-fun m!132163 () Bool)

(assert (=> b!86231 m!132163))

(declare-fun m!132165 () Bool)

(assert (=> b!86233 m!132165))

(assert (=> b!86233 m!132165))

(declare-fun m!132167 () Bool)

(assert (=> b!86233 m!132167))

(check-sat (not b!86219) (not b!86231) (not b!86217) (not b!86232) (not b!86218) (not b!86225) (not b!86230) (not b!86226) (not start!17766) (not b!86216) (not b!86215) (not b!86220) (not b!86228) (not b!86227) (not b!86233) (not b!86221))
(check-sat)
