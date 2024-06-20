; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17774 () Bool)

(assert start!17774)

(declare-fun b!86465 () Bool)

(declare-fun res!71035 () Bool)

(declare-fun e!57490 () Bool)

(assert (=> b!86465 (=> res!71035 e!57490)))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!86465 (= res!71035 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86466 () Bool)

(declare-fun e!57488 () Bool)

(declare-datatypes ((array!4099 0))(
  ( (array!4100 (arr!2489 (Array (_ BitVec 32) (_ BitVec 8))) (size!1852 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3266 0))(
  ( (BitStream!3267 (buf!2242 array!4099) (currentByte!4448 (_ BitVec 32)) (currentBit!4443 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3266)

(declare-fun array_inv!1698 (array!4099) Bool)

(assert (=> b!86466 (= e!57488 (array_inv!1698 (buf!2242 thiss!1152)))))

(declare-fun res!71040 () Bool)

(declare-fun e!57485 () Bool)

(assert (=> start!17774 (=> (not res!71040) (not e!57485))))

(assert (=> start!17774 (= res!71040 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17774 e!57485))

(declare-fun inv!12 (BitStream!3266) Bool)

(assert (=> start!17774 (and (inv!12 thiss!1152) e!57488)))

(declare-fun thiss!1151 () BitStream!3266)

(declare-fun e!57493 () Bool)

(assert (=> start!17774 (and (inv!12 thiss!1151) e!57493)))

(assert (=> start!17774 true))

(declare-fun b!86467 () Bool)

(declare-fun res!71037 () Bool)

(declare-fun e!57494 () Bool)

(assert (=> b!86467 (=> (not res!71037) (not e!57494))))

(declare-datatypes ((Unit!5720 0))(
  ( (Unit!5721) )
))
(declare-datatypes ((tuple2!7338 0))(
  ( (tuple2!7339 (_1!3895 Unit!5720) (_2!3895 BitStream!3266)) )
))
(declare-fun lt!135145 () tuple2!7338)

(declare-fun isPrefixOf!0 (BitStream!3266 BitStream!3266) Bool)

(assert (=> b!86467 (= res!71037 (isPrefixOf!0 thiss!1152 (_2!3895 lt!135145)))))

(declare-fun b!86468 () Bool)

(declare-fun res!71033 () Bool)

(assert (=> b!86468 (=> (not res!71033) (not e!57485))))

(assert (=> b!86468 (= res!71033 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86469 () Bool)

(declare-fun e!57491 () Bool)

(assert (=> b!86469 (= e!57491 e!57494)))

(declare-fun res!71038 () Bool)

(assert (=> b!86469 (=> (not res!71038) (not e!57494))))

(declare-fun lt!135148 () (_ BitVec 64))

(declare-fun lt!135147 () (_ BitVec 64))

(assert (=> b!86469 (= res!71038 (= lt!135148 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135147)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86469 (= lt!135148 (bitIndex!0 (size!1852 (buf!2242 (_2!3895 lt!135145))) (currentByte!4448 (_2!3895 lt!135145)) (currentBit!4443 (_2!3895 lt!135145))))))

(declare-fun b!86470 () Bool)

(declare-fun res!71027 () Bool)

(assert (=> b!86470 (=> (not res!71027) (not e!57485))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86470 (= res!71027 (validate_offset_bits!1 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1151))) ((_ sign_extend 32) (currentByte!4448 thiss!1151)) ((_ sign_extend 32) (currentBit!4443 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86471 () Bool)

(declare-fun res!71026 () Bool)

(declare-fun e!57495 () Bool)

(assert (=> b!86471 (=> res!71026 e!57495)))

(declare-datatypes ((tuple3!404 0))(
  ( (tuple3!405 (_1!3896 Unit!5720) (_2!3896 BitStream!3266) (_3!226 (_ BitVec 32))) )
))
(declare-fun lt!135144 () tuple3!404)

(assert (=> b!86471 (= res!71026 (or (bvsgt (_3!226 lt!135144) nBits!336) (not (= (size!1852 (buf!2242 (_2!3896 lt!135144))) (size!1852 (buf!2242 thiss!1151))))))))

(declare-fun b!86472 () Bool)

(declare-fun res!71031 () Bool)

(assert (=> b!86472 (=> (not res!71031) (not e!57485))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86472 (= res!71031 (invariant!0 (currentBit!4443 thiss!1151) (currentByte!4448 thiss!1151) (size!1852 (buf!2242 thiss!1151))))))

(declare-fun b!86473 () Bool)

(declare-fun e!57486 () Bool)

(declare-datatypes ((tuple2!7340 0))(
  ( (tuple2!7341 (_1!3897 BitStream!3266) (_2!3897 Bool)) )
))
(declare-fun lt!135150 () tuple2!7340)

(assert (=> b!86473 (= e!57486 (= (bitIndex!0 (size!1852 (buf!2242 (_1!3897 lt!135150))) (currentByte!4448 (_1!3897 lt!135150)) (currentBit!4443 (_1!3897 lt!135150))) lt!135148))))

(declare-fun b!86474 () Bool)

(assert (=> b!86474 (= e!57494 e!57486)))

(declare-fun res!71042 () Bool)

(assert (=> b!86474 (=> (not res!71042) (not e!57486))))

(declare-fun lt!135146 () Bool)

(assert (=> b!86474 (= res!71042 (and (= (_2!3897 lt!135150) lt!135146) (= (_1!3897 lt!135150) (_2!3895 lt!135145))))))

(declare-fun readBitPure!0 (BitStream!3266) tuple2!7340)

(declare-fun readerFrom!0 (BitStream!3266 (_ BitVec 32) (_ BitVec 32)) BitStream!3266)

(assert (=> b!86474 (= lt!135150 (readBitPure!0 (readerFrom!0 (_2!3895 lt!135145) (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152))))))

(declare-fun b!86475 () Bool)

(declare-fun res!71041 () Bool)

(declare-fun e!57489 () Bool)

(assert (=> b!86475 (=> (not res!71041) (not e!57489))))

(assert (=> b!86475 (= res!71041 (validate_offset_bits!1 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1152))) ((_ sign_extend 32) (currentByte!4448 thiss!1152)) ((_ sign_extend 32) (currentBit!4443 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86476 () Bool)

(declare-fun res!71032 () Bool)

(assert (=> b!86476 (=> res!71032 e!57495)))

(declare-fun lt!135149 () (_ BitVec 64))

(assert (=> b!86476 (= res!71032 (not (= (bitIndex!0 (size!1852 (buf!2242 (_2!3896 lt!135144))) (currentByte!4448 (_2!3896 lt!135144)) (currentBit!4443 (_2!3896 lt!135144))) (bvadd lt!135149 ((_ sign_extend 32) (_3!226 lt!135144))))))))

(declare-fun b!86477 () Bool)

(declare-fun res!71039 () Bool)

(assert (=> b!86477 (=> (not res!71039) (not e!57489))))

(assert (=> b!86477 (= res!71039 (bvslt i!576 nBits!336))))

(declare-fun b!86478 () Bool)

(assert (=> b!86478 (= e!57485 e!57489)))

(declare-fun res!71036 () Bool)

(assert (=> b!86478 (=> (not res!71036) (not e!57489))))

(assert (=> b!86478 (= res!71036 (= lt!135147 (bvadd lt!135149 ((_ sign_extend 32) i!576))))))

(assert (=> b!86478 (= lt!135147 (bitIndex!0 (size!1852 (buf!2242 thiss!1152)) (currentByte!4448 thiss!1152) (currentBit!4443 thiss!1152)))))

(assert (=> b!86478 (= lt!135149 (bitIndex!0 (size!1852 (buf!2242 thiss!1151)) (currentByte!4448 thiss!1151) (currentBit!4443 thiss!1151)))))

(declare-fun b!86479 () Bool)

(declare-fun res!71029 () Bool)

(assert (=> b!86479 (=> (not res!71029) (not e!57485))))

(assert (=> b!86479 (= res!71029 (and (bvsle i!576 nBits!336) (= (size!1852 (buf!2242 thiss!1152)) (size!1852 (buf!2242 thiss!1151)))))))

(declare-fun b!86480 () Bool)

(declare-fun res!71028 () Bool)

(assert (=> b!86480 (=> res!71028 e!57495)))

(assert (=> b!86480 (= res!71028 (not (invariant!0 (currentBit!4443 (_2!3896 lt!135144)) (currentByte!4448 (_2!3896 lt!135144)) (size!1852 (buf!2242 (_2!3896 lt!135144))))))))

(declare-fun b!86481 () Bool)

(assert (=> b!86481 (= e!57495 (or (bvsgt ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3896 lt!135144)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4448 (_2!3896 lt!135144))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4443 (_2!3896 lt!135144))) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3896 lt!135144)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4448 (_2!3896 lt!135144))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4443 (_2!3896 lt!135144))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!86482 () Bool)

(assert (=> b!86482 (= e!57493 (array_inv!1698 (buf!2242 thiss!1151)))))

(declare-fun b!86483 () Bool)

(assert (=> b!86483 (= e!57490 e!57495)))

(declare-fun res!71044 () Bool)

(assert (=> b!86483 (=> res!71044 e!57495)))

(assert (=> b!86483 (= res!71044 (bvslt (_3!226 lt!135144) #b00000000000000000000000000000000))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3266 (_ BitVec 64) BitStream!3266 (_ BitVec 32)) tuple3!404)

(assert (=> b!86483 (= lt!135144 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3895 lt!135145) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86484 () Bool)

(assert (=> b!86484 (= e!57489 (not e!57490))))

(declare-fun res!71043 () Bool)

(assert (=> b!86484 (=> res!71043 e!57490)))

(assert (=> b!86484 (= res!71043 (not (invariant!0 (currentBit!4443 (_2!3895 lt!135145)) (currentByte!4448 (_2!3895 lt!135145)) (size!1852 (buf!2242 (_2!3895 lt!135145))))))))

(assert (=> b!86484 e!57491))

(declare-fun res!71030 () Bool)

(assert (=> b!86484 (=> (not res!71030) (not e!57491))))

(assert (=> b!86484 (= res!71030 (= (size!1852 (buf!2242 thiss!1152)) (size!1852 (buf!2242 (_2!3895 lt!135145)))))))

(declare-fun appendBit!0 (BitStream!3266 Bool) tuple2!7338)

(assert (=> b!86484 (= lt!135145 (appendBit!0 thiss!1152 lt!135146))))

(assert (=> b!86484 (= lt!135146 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86485 () Bool)

(declare-fun res!71034 () Bool)

(assert (=> b!86485 (=> (not res!71034) (not e!57485))))

(assert (=> b!86485 (= res!71034 (invariant!0 (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152) (size!1852 (buf!2242 thiss!1152))))))

(assert (= (and start!17774 res!71040) b!86470))

(assert (= (and b!86470 res!71027) b!86472))

(assert (= (and b!86472 res!71031) b!86468))

(assert (= (and b!86468 res!71033) b!86485))

(assert (= (and b!86485 res!71034) b!86479))

(assert (= (and b!86479 res!71029) b!86478))

(assert (= (and b!86478 res!71036) b!86475))

(assert (= (and b!86475 res!71041) b!86477))

(assert (= (and b!86477 res!71039) b!86484))

(assert (= (and b!86484 res!71030) b!86469))

(assert (= (and b!86469 res!71038) b!86467))

(assert (= (and b!86467 res!71037) b!86474))

(assert (= (and b!86474 res!71042) b!86473))

(assert (= (and b!86484 (not res!71043)) b!86465))

(assert (= (and b!86465 (not res!71035)) b!86483))

(assert (= (and b!86483 (not res!71044)) b!86480))

(assert (= (and b!86480 (not res!71028)) b!86471))

(assert (= (and b!86471 (not res!71026)) b!86476))

(assert (= (and b!86476 (not res!71032)) b!86481))

(assert (= start!17774 b!86466))

(assert (= start!17774 b!86482))

(declare-fun m!132289 () Bool)

(assert (=> b!86476 m!132289))

(declare-fun m!132291 () Bool)

(assert (=> b!86482 m!132291))

(declare-fun m!132293 () Bool)

(assert (=> b!86470 m!132293))

(declare-fun m!132295 () Bool)

(assert (=> b!86467 m!132295))

(declare-fun m!132297 () Bool)

(assert (=> b!86466 m!132297))

(declare-fun m!132299 () Bool)

(assert (=> b!86485 m!132299))

(declare-fun m!132301 () Bool)

(assert (=> b!86473 m!132301))

(declare-fun m!132303 () Bool)

(assert (=> b!86469 m!132303))

(declare-fun m!132305 () Bool)

(assert (=> b!86474 m!132305))

(assert (=> b!86474 m!132305))

(declare-fun m!132307 () Bool)

(assert (=> b!86474 m!132307))

(declare-fun m!132309 () Bool)

(assert (=> b!86483 m!132309))

(declare-fun m!132311 () Bool)

(assert (=> b!86475 m!132311))

(declare-fun m!132313 () Bool)

(assert (=> b!86480 m!132313))

(declare-fun m!132315 () Bool)

(assert (=> b!86484 m!132315))

(declare-fun m!132317 () Bool)

(assert (=> b!86484 m!132317))

(declare-fun m!132319 () Bool)

(assert (=> b!86472 m!132319))

(declare-fun m!132321 () Bool)

(assert (=> b!86478 m!132321))

(declare-fun m!132323 () Bool)

(assert (=> b!86478 m!132323))

(declare-fun m!132325 () Bool)

(assert (=> start!17774 m!132325))

(declare-fun m!132327 () Bool)

(assert (=> start!17774 m!132327))

(push 1)

(assert (not b!86476))

(assert (not b!86480))

(assert (not b!86485))

(assert (not b!86472))

(assert (not b!86467))

(assert (not b!86466))

(assert (not b!86478))

(assert (not b!86483))

(assert (not b!86473))

(assert (not b!86470))

(assert (not b!86474))

(assert (not start!17774))

(assert (not b!86482))

(assert (not b!86469))

(assert (not b!86484))

(assert (not b!86475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27480 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27480 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1151))) ((_ sign_extend 32) (currentByte!4448 thiss!1151)) ((_ sign_extend 32) (currentBit!4443 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1151))) ((_ sign_extend 32) (currentByte!4448 thiss!1151)) ((_ sign_extend 32) (currentBit!4443 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6809 () Bool)

(assert (= bs!6809 d!27480))

(declare-fun m!132373 () Bool)

(assert (=> bs!6809 m!132373))

(assert (=> b!86470 d!27480))

(declare-fun d!27482 () Bool)

(assert (=> d!27482 (= (invariant!0 (currentBit!4443 (_2!3896 lt!135144)) (currentByte!4448 (_2!3896 lt!135144)) (size!1852 (buf!2242 (_2!3896 lt!135144)))) (and (bvsge (currentBit!4443 (_2!3896 lt!135144)) #b00000000000000000000000000000000) (bvslt (currentBit!4443 (_2!3896 lt!135144)) #b00000000000000000000000000001000) (bvsge (currentByte!4448 (_2!3896 lt!135144)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4448 (_2!3896 lt!135144)) (size!1852 (buf!2242 (_2!3896 lt!135144)))) (and (= (currentBit!4443 (_2!3896 lt!135144)) #b00000000000000000000000000000000) (= (currentByte!4448 (_2!3896 lt!135144)) (size!1852 (buf!2242 (_2!3896 lt!135144))))))))))

(assert (=> b!86480 d!27482))

(declare-fun d!27484 () Bool)

(assert (=> d!27484 (= (array_inv!1698 (buf!2242 thiss!1151)) (bvsge (size!1852 (buf!2242 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!86482 d!27484))

(declare-fun d!27486 () Bool)

(assert (=> d!27486 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152) (size!1852 (buf!2242 thiss!1152))))))

(declare-fun bs!6810 () Bool)

(assert (= bs!6810 d!27486))

(assert (=> bs!6810 m!132299))

(assert (=> start!17774 d!27486))

(declare-fun d!27488 () Bool)

(assert (=> d!27488 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4443 thiss!1151) (currentByte!4448 thiss!1151) (size!1852 (buf!2242 thiss!1151))))))

(declare-fun bs!6811 () Bool)

(assert (= bs!6811 d!27488))

(assert (=> bs!6811 m!132319))

(assert (=> start!17774 d!27488))

(declare-fun d!27490 () Bool)

(declare-fun e!57538 () Bool)

(assert (=> d!27490 e!57538))

(declare-fun res!71134 () Bool)

(assert (=> d!27490 (=> (not res!71134) (not e!57538))))

(declare-fun lt!135252 () (_ BitVec 64))

(declare-fun lt!135249 () (_ BitVec 64))

(declare-fun lt!135247 () (_ BitVec 64))

(assert (=> d!27490 (= res!71134 (= lt!135249 (bvsub lt!135252 lt!135247)))))

(assert (=> d!27490 (or (= (bvand lt!135252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135247 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135252 lt!135247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27490 (= lt!135247 (remainingBits!0 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1152))) ((_ sign_extend 32) (currentByte!4448 thiss!1152)) ((_ sign_extend 32) (currentBit!4443 thiss!1152))))))

(declare-fun lt!135250 () (_ BitVec 64))

(declare-fun lt!135251 () (_ BitVec 64))

(assert (=> d!27490 (= lt!135252 (bvmul lt!135250 lt!135251))))

(assert (=> d!27490 (or (= lt!135250 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135251 (bvsdiv (bvmul lt!135250 lt!135251) lt!135250)))))

(assert (=> d!27490 (= lt!135251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27490 (= lt!135250 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1152))))))

(assert (=> d!27490 (= lt!135249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4448 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4443 thiss!1152))))))

(assert (=> d!27490 (invariant!0 (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152) (size!1852 (buf!2242 thiss!1152)))))

(assert (=> d!27490 (= (bitIndex!0 (size!1852 (buf!2242 thiss!1152)) (currentByte!4448 thiss!1152) (currentBit!4443 thiss!1152)) lt!135249)))

(declare-fun b!86580 () Bool)

(declare-fun res!71135 () Bool)

(assert (=> b!86580 (=> (not res!71135) (not e!57538))))

(assert (=> b!86580 (= res!71135 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135249))))

(declare-fun b!86581 () Bool)

(declare-fun lt!135248 () (_ BitVec 64))

(assert (=> b!86581 (= e!57538 (bvsle lt!135249 (bvmul lt!135248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86581 (or (= lt!135248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135248)))))

(assert (=> b!86581 (= lt!135248 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1152))))))

(assert (= (and d!27490 res!71134) b!86580))

(assert (= (and b!86580 res!71135) b!86581))

(declare-fun m!132375 () Bool)

(assert (=> d!27490 m!132375))

(assert (=> d!27490 m!132299))

(assert (=> b!86478 d!27490))

(declare-fun d!27492 () Bool)

(declare-fun e!57539 () Bool)

(assert (=> d!27492 e!57539))

(declare-fun res!71136 () Bool)

(assert (=> d!27492 (=> (not res!71136) (not e!57539))))

(declare-fun lt!135255 () (_ BitVec 64))

(declare-fun lt!135253 () (_ BitVec 64))

(declare-fun lt!135258 () (_ BitVec 64))

(assert (=> d!27492 (= res!71136 (= lt!135255 (bvsub lt!135258 lt!135253)))))

(assert (=> d!27492 (or (= (bvand lt!135258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135258 lt!135253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27492 (= lt!135253 (remainingBits!0 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1151))) ((_ sign_extend 32) (currentByte!4448 thiss!1151)) ((_ sign_extend 32) (currentBit!4443 thiss!1151))))))

(declare-fun lt!135256 () (_ BitVec 64))

(declare-fun lt!135257 () (_ BitVec 64))

(assert (=> d!27492 (= lt!135258 (bvmul lt!135256 lt!135257))))

(assert (=> d!27492 (or (= lt!135256 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135257 (bvsdiv (bvmul lt!135256 lt!135257) lt!135256)))))

(assert (=> d!27492 (= lt!135257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27492 (= lt!135256 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1151))))))

(assert (=> d!27492 (= lt!135255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4448 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4443 thiss!1151))))))

(assert (=> d!27492 (invariant!0 (currentBit!4443 thiss!1151) (currentByte!4448 thiss!1151) (size!1852 (buf!2242 thiss!1151)))))

(assert (=> d!27492 (= (bitIndex!0 (size!1852 (buf!2242 thiss!1151)) (currentByte!4448 thiss!1151) (currentBit!4443 thiss!1151)) lt!135255)))

(declare-fun b!86582 () Bool)

(declare-fun res!71137 () Bool)

(assert (=> b!86582 (=> (not res!71137) (not e!57539))))

(assert (=> b!86582 (= res!71137 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135255))))

(declare-fun b!86583 () Bool)

(declare-fun lt!135254 () (_ BitVec 64))

(assert (=> b!86583 (= e!57539 (bvsle lt!135255 (bvmul lt!135254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86583 (or (= lt!135254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135254)))))

(assert (=> b!86583 (= lt!135254 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1151))))))

(assert (= (and d!27492 res!71136) b!86582))

(assert (= (and b!86582 res!71137) b!86583))

(assert (=> d!27492 m!132373))

(assert (=> d!27492 m!132319))

(assert (=> b!86478 d!27492))

(declare-fun d!27494 () Bool)

(declare-fun res!71144 () Bool)

(declare-fun e!57544 () Bool)

(assert (=> d!27494 (=> (not res!71144) (not e!57544))))

(assert (=> d!27494 (= res!71144 (= (size!1852 (buf!2242 thiss!1152)) (size!1852 (buf!2242 (_2!3895 lt!135145)))))))

(assert (=> d!27494 (= (isPrefixOf!0 thiss!1152 (_2!3895 lt!135145)) e!57544)))

(declare-fun b!86590 () Bool)

(declare-fun res!71146 () Bool)

(assert (=> b!86590 (=> (not res!71146) (not e!57544))))

(assert (=> b!86590 (= res!71146 (bvsle (bitIndex!0 (size!1852 (buf!2242 thiss!1152)) (currentByte!4448 thiss!1152) (currentBit!4443 thiss!1152)) (bitIndex!0 (size!1852 (buf!2242 (_2!3895 lt!135145))) (currentByte!4448 (_2!3895 lt!135145)) (currentBit!4443 (_2!3895 lt!135145)))))))

(declare-fun b!86591 () Bool)

(declare-fun e!57545 () Bool)

(assert (=> b!86591 (= e!57544 e!57545)))

(declare-fun res!71145 () Bool)

(assert (=> b!86591 (=> res!71145 e!57545)))

(assert (=> b!86591 (= res!71145 (= (size!1852 (buf!2242 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!86592 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4099 array!4099 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86592 (= e!57545 (arrayBitRangesEq!0 (buf!2242 thiss!1152) (buf!2242 (_2!3895 lt!135145)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1852 (buf!2242 thiss!1152)) (currentByte!4448 thiss!1152) (currentBit!4443 thiss!1152))))))

(assert (= (and d!27494 res!71144) b!86590))

(assert (= (and b!86590 res!71146) b!86591))

(assert (= (and b!86591 (not res!71145)) b!86592))

(assert (=> b!86590 m!132321))

(assert (=> b!86590 m!132303))

(assert (=> b!86592 m!132321))

(assert (=> b!86592 m!132321))

(declare-fun m!132391 () Bool)

(assert (=> b!86592 m!132391))

(assert (=> b!86467 d!27494))

(declare-fun d!27496 () Bool)

(declare-fun e!57546 () Bool)

(assert (=> d!27496 e!57546))

(declare-fun res!71147 () Bool)

(assert (=> d!27496 (=> (not res!71147) (not e!57546))))

(declare-fun lt!135261 () (_ BitVec 64))

(declare-fun lt!135259 () (_ BitVec 64))

(declare-fun lt!135264 () (_ BitVec 64))

(assert (=> d!27496 (= res!71147 (= lt!135261 (bvsub lt!135264 lt!135259)))))

(assert (=> d!27496 (or (= (bvand lt!135264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135259 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135264 lt!135259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27496 (= lt!135259 (remainingBits!0 ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3895 lt!135145)))) ((_ sign_extend 32) (currentByte!4448 (_2!3895 lt!135145))) ((_ sign_extend 32) (currentBit!4443 (_2!3895 lt!135145)))))))

(declare-fun lt!135262 () (_ BitVec 64))

(declare-fun lt!135263 () (_ BitVec 64))

(assert (=> d!27496 (= lt!135264 (bvmul lt!135262 lt!135263))))

(assert (=> d!27496 (or (= lt!135262 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135263 (bvsdiv (bvmul lt!135262 lt!135263) lt!135262)))))

(assert (=> d!27496 (= lt!135263 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27496 (= lt!135262 ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3895 lt!135145)))))))

(assert (=> d!27496 (= lt!135261 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4448 (_2!3895 lt!135145))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4443 (_2!3895 lt!135145)))))))

(assert (=> d!27496 (invariant!0 (currentBit!4443 (_2!3895 lt!135145)) (currentByte!4448 (_2!3895 lt!135145)) (size!1852 (buf!2242 (_2!3895 lt!135145))))))

(assert (=> d!27496 (= (bitIndex!0 (size!1852 (buf!2242 (_2!3895 lt!135145))) (currentByte!4448 (_2!3895 lt!135145)) (currentBit!4443 (_2!3895 lt!135145))) lt!135261)))

(declare-fun b!86593 () Bool)

(declare-fun res!71148 () Bool)

(assert (=> b!86593 (=> (not res!71148) (not e!57546))))

(assert (=> b!86593 (= res!71148 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135261))))

(declare-fun b!86594 () Bool)

(declare-fun lt!135260 () (_ BitVec 64))

(assert (=> b!86594 (= e!57546 (bvsle lt!135261 (bvmul lt!135260 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86594 (or (= lt!135260 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135260 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135260)))))

(assert (=> b!86594 (= lt!135260 ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3895 lt!135145)))))))

(assert (= (and d!27496 res!71147) b!86593))

(assert (= (and b!86593 res!71148) b!86594))

(declare-fun m!132393 () Bool)

(assert (=> d!27496 m!132393))

(assert (=> d!27496 m!132315))

(assert (=> b!86469 d!27496))

(declare-fun d!27498 () Bool)

(assert (=> d!27498 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1152))) ((_ sign_extend 32) (currentByte!4448 thiss!1152)) ((_ sign_extend 32) (currentBit!4443 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1152))) ((_ sign_extend 32) (currentByte!4448 thiss!1152)) ((_ sign_extend 32) (currentBit!4443 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6812 () Bool)

(assert (= bs!6812 d!27498))

(assert (=> bs!6812 m!132375))

(assert (=> b!86475 d!27498))

(declare-fun d!27500 () Bool)

(assert (=> d!27500 (= (array_inv!1698 (buf!2242 thiss!1152)) (bvsge (size!1852 (buf!2242 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!86466 d!27500))

(declare-fun d!27502 () Bool)

(declare-fun e!57547 () Bool)

(assert (=> d!27502 e!57547))

(declare-fun res!71149 () Bool)

(assert (=> d!27502 (=> (not res!71149) (not e!57547))))

(declare-fun lt!135267 () (_ BitVec 64))

(declare-fun lt!135270 () (_ BitVec 64))

(declare-fun lt!135265 () (_ BitVec 64))

(assert (=> d!27502 (= res!71149 (= lt!135267 (bvsub lt!135270 lt!135265)))))

(assert (=> d!27502 (or (= (bvand lt!135270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135270 lt!135265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27502 (= lt!135265 (remainingBits!0 ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3896 lt!135144)))) ((_ sign_extend 32) (currentByte!4448 (_2!3896 lt!135144))) ((_ sign_extend 32) (currentBit!4443 (_2!3896 lt!135144)))))))

(declare-fun lt!135268 () (_ BitVec 64))

(declare-fun lt!135269 () (_ BitVec 64))

(assert (=> d!27502 (= lt!135270 (bvmul lt!135268 lt!135269))))

(assert (=> d!27502 (or (= lt!135268 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135269 (bvsdiv (bvmul lt!135268 lt!135269) lt!135268)))))

(assert (=> d!27502 (= lt!135269 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27502 (= lt!135268 ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3896 lt!135144)))))))

(assert (=> d!27502 (= lt!135267 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4448 (_2!3896 lt!135144))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4443 (_2!3896 lt!135144)))))))

(assert (=> d!27502 (invariant!0 (currentBit!4443 (_2!3896 lt!135144)) (currentByte!4448 (_2!3896 lt!135144)) (size!1852 (buf!2242 (_2!3896 lt!135144))))))

(assert (=> d!27502 (= (bitIndex!0 (size!1852 (buf!2242 (_2!3896 lt!135144))) (currentByte!4448 (_2!3896 lt!135144)) (currentBit!4443 (_2!3896 lt!135144))) lt!135267)))

(declare-fun b!86595 () Bool)

(declare-fun res!71150 () Bool)

(assert (=> b!86595 (=> (not res!71150) (not e!57547))))

(assert (=> b!86595 (= res!71150 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135267))))

(declare-fun b!86596 () Bool)

(declare-fun lt!135266 () (_ BitVec 64))

(assert (=> b!86596 (= e!57547 (bvsle lt!135267 (bvmul lt!135266 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86596 (or (= lt!135266 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135266 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135266)))))

(assert (=> b!86596 (= lt!135266 ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3896 lt!135144)))))))

(assert (= (and d!27502 res!71149) b!86595))

(assert (= (and b!86595 res!71150) b!86596))

(declare-fun m!132395 () Bool)

(assert (=> d!27502 m!132395))

(assert (=> d!27502 m!132313))

(assert (=> b!86476 d!27502))

(declare-fun d!27504 () Bool)

(declare-fun e!57548 () Bool)

(assert (=> d!27504 e!57548))

(declare-fun res!71151 () Bool)

(assert (=> d!27504 (=> (not res!71151) (not e!57548))))

(declare-fun lt!135271 () (_ BitVec 64))

(declare-fun lt!135273 () (_ BitVec 64))

(declare-fun lt!135276 () (_ BitVec 64))

(assert (=> d!27504 (= res!71151 (= lt!135273 (bvsub lt!135276 lt!135271)))))

(assert (=> d!27504 (or (= (bvand lt!135276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135271 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135276 lt!135271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27504 (= lt!135271 (remainingBits!0 ((_ sign_extend 32) (size!1852 (buf!2242 (_1!3897 lt!135150)))) ((_ sign_extend 32) (currentByte!4448 (_1!3897 lt!135150))) ((_ sign_extend 32) (currentBit!4443 (_1!3897 lt!135150)))))))

(declare-fun lt!135274 () (_ BitVec 64))

(declare-fun lt!135275 () (_ BitVec 64))

(assert (=> d!27504 (= lt!135276 (bvmul lt!135274 lt!135275))))

(assert (=> d!27504 (or (= lt!135274 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135275 (bvsdiv (bvmul lt!135274 lt!135275) lt!135274)))))

(assert (=> d!27504 (= lt!135275 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27504 (= lt!135274 ((_ sign_extend 32) (size!1852 (buf!2242 (_1!3897 lt!135150)))))))

(assert (=> d!27504 (= lt!135273 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4448 (_1!3897 lt!135150))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4443 (_1!3897 lt!135150)))))))

(assert (=> d!27504 (invariant!0 (currentBit!4443 (_1!3897 lt!135150)) (currentByte!4448 (_1!3897 lt!135150)) (size!1852 (buf!2242 (_1!3897 lt!135150))))))

(assert (=> d!27504 (= (bitIndex!0 (size!1852 (buf!2242 (_1!3897 lt!135150))) (currentByte!4448 (_1!3897 lt!135150)) (currentBit!4443 (_1!3897 lt!135150))) lt!135273)))

(declare-fun b!86597 () Bool)

(declare-fun res!71152 () Bool)

(assert (=> b!86597 (=> (not res!71152) (not e!57548))))

(assert (=> b!86597 (= res!71152 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135273))))

(declare-fun b!86598 () Bool)

(declare-fun lt!135272 () (_ BitVec 64))

(assert (=> b!86598 (= e!57548 (bvsle lt!135273 (bvmul lt!135272 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86598 (or (= lt!135272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135272)))))

(assert (=> b!86598 (= lt!135272 ((_ sign_extend 32) (size!1852 (buf!2242 (_1!3897 lt!135150)))))))

(assert (= (and d!27504 res!71151) b!86597))

(assert (= (and b!86597 res!71152) b!86598))

(declare-fun m!132397 () Bool)

(assert (=> d!27504 m!132397))

(declare-fun m!132399 () Bool)

(assert (=> d!27504 m!132399))

(assert (=> b!86473 d!27504))

(declare-fun d!27506 () Bool)

(assert (=> d!27506 (= (invariant!0 (currentBit!4443 thiss!1151) (currentByte!4448 thiss!1151) (size!1852 (buf!2242 thiss!1151))) (and (bvsge (currentBit!4443 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4443 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4448 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4448 thiss!1151) (size!1852 (buf!2242 thiss!1151))) (and (= (currentBit!4443 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4448 thiss!1151) (size!1852 (buf!2242 thiss!1151)))))))))

(assert (=> b!86472 d!27506))

(declare-fun d!27508 () Bool)

(declare-fun e!57590 () Bool)

(assert (=> d!27508 e!57590))

(declare-fun res!71251 () Bool)

(assert (=> d!27508 (=> (not res!71251) (not e!57590))))

(declare-fun lt!135358 () tuple3!404)

(assert (=> d!27508 (= res!71251 (bvsge (_3!226 lt!135358) #b00000000000000000000000000000000))))

(declare-fun e!57588 () tuple3!404)

(assert (=> d!27508 (= lt!135358 e!57588)))

(declare-fun c!5858 () Bool)

(declare-fun lt!135357 () (_ BitVec 32))

(assert (=> d!27508 (= c!5858 (bvslt lt!135357 nBits!336))))

(assert (=> d!27508 (= lt!135357 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(declare-fun lt!135353 () tuple2!7338)

(declare-fun lt!135360 () tuple2!7338)

(assert (=> d!27508 (= lt!135353 lt!135360)))

(declare-fun e!57589 () Bool)

(assert (=> d!27508 e!57589))

(declare-fun res!71246 () Bool)

(assert (=> d!27508 (=> (not res!71246) (not e!57589))))

(assert (=> d!27508 (= res!71246 (= (size!1852 (buf!2242 (_2!3895 lt!135145))) (size!1852 (buf!2242 (_2!3895 lt!135360)))))))

(declare-fun lt!135359 () Bool)

(assert (=> d!27508 (= lt!135360 (appendBit!0 (_2!3895 lt!135145) lt!135359))))

(assert (=> d!27508 (= lt!135359 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!57586 () Bool)

(assert (=> d!27508 e!57586))

(declare-fun res!71256 () Bool)

(assert (=> d!27508 (=> (not res!71256) (not e!57586))))

(assert (=> d!27508 (= res!71256 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!27508 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3895 lt!135145) (bvadd #b00000000000000000000000000000001 i!576)) lt!135358)))

(declare-fun b!86700 () Bool)

(declare-fun e!57587 () Bool)

(declare-fun lt!135355 () tuple2!7340)

(assert (=> b!86700 (= e!57587 (= (bitIndex!0 (size!1852 (buf!2242 (_1!3897 lt!135355))) (currentByte!4448 (_1!3897 lt!135355)) (currentBit!4443 (_1!3897 lt!135355))) (bitIndex!0 (size!1852 (buf!2242 (_2!3895 lt!135360))) (currentByte!4448 (_2!3895 lt!135360)) (currentBit!4443 (_2!3895 lt!135360)))))))

(declare-fun b!86701 () Bool)

(declare-fun res!71254 () Bool)

(assert (=> b!86701 (=> (not res!71254) (not e!57590))))

(declare-fun lt!135356 () (_ BitVec 64))

(declare-fun lt!135354 () (_ BitVec 64))

(assert (=> b!86701 (= res!71254 (= (bitIndex!0 (size!1852 (buf!2242 (_2!3896 lt!135358))) (currentByte!4448 (_2!3896 lt!135358)) (currentBit!4443 (_2!3896 lt!135358))) (bvadd lt!135356 lt!135354)))))

(assert (=> b!86701 (or (not (= (bvand lt!135356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135354 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135356 lt!135354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!86701 (= lt!135354 ((_ sign_extend 32) (_3!226 lt!135358)))))

(assert (=> b!86701 (= lt!135356 (bitIndex!0 (size!1852 (buf!2242 thiss!1151)) (currentByte!4448 thiss!1151) (currentBit!4443 thiss!1151)))))

(declare-fun b!86702 () Bool)

(declare-fun res!71255 () Bool)

(assert (=> b!86702 (=> (not res!71255) (not e!57586))))

(assert (=> b!86702 (= res!71255 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1852 (buf!2242 (_2!3895 lt!135145))) (size!1852 (buf!2242 thiss!1151)))))))

(declare-fun b!86703 () Bool)

(declare-fun res!71249 () Bool)

(assert (=> b!86703 (=> (not res!71249) (not e!57590))))

(assert (=> b!86703 (= res!71249 (invariant!0 (currentBit!4443 (_2!3896 lt!135358)) (currentByte!4448 (_2!3896 lt!135358)) (size!1852 (buf!2242 (_2!3896 lt!135358)))))))

(declare-fun b!86704 () Bool)

(declare-fun res!71250 () Bool)

(assert (=> b!86704 (=> (not res!71250) (not e!57586))))

(assert (=> b!86704 (= res!71250 (invariant!0 (currentBit!4443 (_2!3895 lt!135145)) (currentByte!4448 (_2!3895 lt!135145)) (size!1852 (buf!2242 (_2!3895 lt!135145)))))))

(declare-fun b!86705 () Bool)

(assert (=> b!86705 (= e!57589 e!57587)))

(declare-fun res!71253 () Bool)

(assert (=> b!86705 (=> (not res!71253) (not e!57587))))

(assert (=> b!86705 (= res!71253 (and (= (_2!3897 lt!135355) lt!135359) (= (_1!3897 lt!135355) (_2!3895 lt!135360))))))

(assert (=> b!86705 (= lt!135355 (readBitPure!0 (readerFrom!0 (_2!3895 lt!135360) (currentBit!4443 (_2!3895 lt!135145)) (currentByte!4448 (_2!3895 lt!135145)))))))

(declare-fun b!86706 () Bool)

(declare-fun res!71247 () Bool)

(assert (=> b!86706 (=> (not res!71247) (not e!57590))))

(assert (=> b!86706 (= res!71247 (validate_offset_bits!1 ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3896 lt!135358)))) ((_ sign_extend 32) (currentByte!4448 (_2!3896 lt!135358))) ((_ sign_extend 32) (currentBit!4443 (_2!3896 lt!135358))) ((_ sign_extend 32) (bvsub nBits!336 (_3!226 lt!135358)))))))

(assert (=> b!86706 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!226 lt!135358) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!226 lt!135358)) #b10000000000000000000000000000000)))))

(declare-fun b!86707 () Bool)

(declare-fun res!71248 () Bool)

(assert (=> b!86707 (=> (not res!71248) (not e!57586))))

(assert (=> b!86707 (= res!71248 (validate_offset_bits!1 ((_ sign_extend 32) (size!1852 (buf!2242 (_2!3895 lt!135145)))) ((_ sign_extend 32) (currentByte!4448 (_2!3895 lt!135145))) ((_ sign_extend 32) (currentBit!4443 (_2!3895 lt!135145))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!86708 () Bool)

(declare-fun res!71257 () Bool)

(assert (=> b!86708 (=> (not res!71257) (not e!57586))))

(assert (=> b!86708 (= res!71257 (= (bitIndex!0 (size!1852 (buf!2242 (_2!3895 lt!135145))) (currentByte!4448 (_2!3895 lt!135145)) (currentBit!4443 (_2!3895 lt!135145))) (bvadd (bitIndex!0 (size!1852 (buf!2242 thiss!1151)) (currentByte!4448 thiss!1151) (currentBit!4443 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!86709 () Bool)

(assert (=> b!86709 (= e!57588 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3895 lt!135353) lt!135357))))

(declare-fun b!86710 () Bool)

(declare-fun Unit!5724 () Unit!5720)

(assert (=> b!86710 (= e!57588 (tuple3!405 Unit!5724 (_2!3895 lt!135353) lt!135357))))

(declare-fun b!86711 () Bool)

(assert (=> b!86711 (= e!57590 (bvsge (_3!226 lt!135358) nBits!336))))

(declare-fun b!86712 () Bool)

(declare-fun res!71252 () Bool)

(assert (=> b!86712 (=> (not res!71252) (not e!57589))))

(assert (=> b!86712 (= res!71252 (isPrefixOf!0 (_2!3895 lt!135145) (_2!3895 lt!135360)))))

(declare-fun b!86713 () Bool)

(assert (=> b!86713 (= e!57586 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86714 () Bool)

(declare-fun res!71245 () Bool)

(assert (=> b!86714 (=> (not res!71245) (not e!57589))))

(assert (=> b!86714 (= res!71245 (= (bitIndex!0 (size!1852 (buf!2242 (_2!3895 lt!135360))) (currentByte!4448 (_2!3895 lt!135360)) (currentBit!4443 (_2!3895 lt!135360))) (bvadd (bitIndex!0 (size!1852 (buf!2242 (_2!3895 lt!135145))) (currentByte!4448 (_2!3895 lt!135145)) (currentBit!4443 (_2!3895 lt!135145))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!86715 () Bool)

(declare-fun res!71244 () Bool)

(assert (=> b!86715 (=> (not res!71244) (not e!57590))))

(assert (=> b!86715 (= res!71244 (and (bvsle (_3!226 lt!135358) nBits!336) (= (size!1852 (buf!2242 (_2!3896 lt!135358))) (size!1852 (buf!2242 thiss!1151)))))))

(assert (= (and d!27508 res!71256) b!86704))

(assert (= (and b!86704 res!71250) b!86702))

(assert (= (and b!86702 res!71255) b!86708))

(assert (= (and b!86708 res!71257) b!86707))

(assert (= (and b!86707 res!71248) b!86713))

(assert (= (and d!27508 res!71246) b!86714))

(assert (= (and b!86714 res!71245) b!86712))

(assert (= (and b!86712 res!71252) b!86705))

(assert (= (and b!86705 res!71253) b!86700))

(assert (= (and d!27508 c!5858) b!86709))

(assert (= (and d!27508 (not c!5858)) b!86710))

(assert (= (and d!27508 res!71251) b!86703))

(assert (= (and b!86703 res!71249) b!86715))

(assert (= (and b!86715 res!71244) b!86701))

(assert (= (and b!86701 res!71254) b!86706))

(assert (= (and b!86706 res!71247) b!86711))

(declare-fun m!132435 () Bool)

(assert (=> b!86709 m!132435))

(assert (=> b!86704 m!132315))

(assert (=> b!86708 m!132303))

(assert (=> b!86708 m!132323))

(declare-fun m!132437 () Bool)

(assert (=> b!86707 m!132437))

(declare-fun m!132439 () Bool)

(assert (=> d!27508 m!132439))

(declare-fun m!132441 () Bool)

(assert (=> b!86706 m!132441))

(declare-fun m!132443 () Bool)

(assert (=> b!86714 m!132443))

(assert (=> b!86714 m!132303))

(declare-fun m!132445 () Bool)

(assert (=> b!86700 m!132445))

(assert (=> b!86700 m!132443))

(declare-fun m!132447 () Bool)

(assert (=> b!86705 m!132447))

(assert (=> b!86705 m!132447))

(declare-fun m!132449 () Bool)

(assert (=> b!86705 m!132449))

(declare-fun m!132451 () Bool)

(assert (=> b!86712 m!132451))

(declare-fun m!132453 () Bool)

(assert (=> b!86701 m!132453))

(assert (=> b!86701 m!132323))

(declare-fun m!132455 () Bool)

(assert (=> b!86703 m!132455))

(assert (=> b!86483 d!27508))

(declare-fun d!27528 () Bool)

(declare-datatypes ((tuple2!7346 0))(
  ( (tuple2!7347 (_1!3900 Bool) (_2!3900 BitStream!3266)) )
))
(declare-fun lt!135363 () tuple2!7346)

(declare-fun readBit!0 (BitStream!3266) tuple2!7346)

(assert (=> d!27528 (= lt!135363 (readBit!0 (readerFrom!0 (_2!3895 lt!135145) (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152))))))

(assert (=> d!27528 (= (readBitPure!0 (readerFrom!0 (_2!3895 lt!135145) (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152))) (tuple2!7341 (_2!3900 lt!135363) (_1!3900 lt!135363)))))

(declare-fun bs!6815 () Bool)

(assert (= bs!6815 d!27528))

(assert (=> bs!6815 m!132305))

(declare-fun m!132457 () Bool)

(assert (=> bs!6815 m!132457))

(assert (=> b!86474 d!27528))

(declare-fun d!27530 () Bool)

(declare-fun e!57593 () Bool)

(assert (=> d!27530 e!57593))

(declare-fun res!71261 () Bool)

(assert (=> d!27530 (=> (not res!71261) (not e!57593))))

(assert (=> d!27530 (= res!71261 (invariant!0 (currentBit!4443 (_2!3895 lt!135145)) (currentByte!4448 (_2!3895 lt!135145)) (size!1852 (buf!2242 (_2!3895 lt!135145)))))))

(assert (=> d!27530 (= (readerFrom!0 (_2!3895 lt!135145) (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152)) (BitStream!3267 (buf!2242 (_2!3895 lt!135145)) (currentByte!4448 thiss!1152) (currentBit!4443 thiss!1152)))))

(declare-fun b!86718 () Bool)

(assert (=> b!86718 (= e!57593 (invariant!0 (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152) (size!1852 (buf!2242 (_2!3895 lt!135145)))))))

(assert (= (and d!27530 res!71261) b!86718))

(assert (=> d!27530 m!132315))

(declare-fun m!132459 () Bool)

(assert (=> b!86718 m!132459))

(assert (=> b!86474 d!27530))

(declare-fun d!27532 () Bool)

(assert (=> d!27532 (= (invariant!0 (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152) (size!1852 (buf!2242 thiss!1152))) (and (bvsge (currentBit!4443 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4443 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4448 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4448 thiss!1152) (size!1852 (buf!2242 thiss!1152))) (and (= (currentBit!4443 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4448 thiss!1152) (size!1852 (buf!2242 thiss!1152)))))))))

(assert (=> b!86485 d!27532))

(declare-fun d!27534 () Bool)

(assert (=> d!27534 (= (invariant!0 (currentBit!4443 (_2!3895 lt!135145)) (currentByte!4448 (_2!3895 lt!135145)) (size!1852 (buf!2242 (_2!3895 lt!135145)))) (and (bvsge (currentBit!4443 (_2!3895 lt!135145)) #b00000000000000000000000000000000) (bvslt (currentBit!4443 (_2!3895 lt!135145)) #b00000000000000000000000000001000) (bvsge (currentByte!4448 (_2!3895 lt!135145)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4448 (_2!3895 lt!135145)) (size!1852 (buf!2242 (_2!3895 lt!135145)))) (and (= (currentBit!4443 (_2!3895 lt!135145)) #b00000000000000000000000000000000) (= (currentByte!4448 (_2!3895 lt!135145)) (size!1852 (buf!2242 (_2!3895 lt!135145))))))))))

(assert (=> b!86484 d!27534))

(declare-fun d!27536 () Bool)

(declare-fun e!57606 () Bool)

(assert (=> d!27536 e!57606))

(declare-fun res!71284 () Bool)

(assert (=> d!27536 (=> (not res!71284) (not e!57606))))

(declare-fun lt!135393 () tuple2!7338)

(assert (=> d!27536 (= res!71284 (= (size!1852 (buf!2242 thiss!1152)) (size!1852 (buf!2242 (_2!3895 lt!135393)))))))

(declare-fun choose!16 (BitStream!3266 Bool) tuple2!7338)

(assert (=> d!27536 (= lt!135393 (choose!16 thiss!1152 lt!135146))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27536 (validate_offset_bit!0 ((_ sign_extend 32) (size!1852 (buf!2242 thiss!1152))) ((_ sign_extend 32) (currentByte!4448 thiss!1152)) ((_ sign_extend 32) (currentBit!4443 thiss!1152)))))

(assert (=> d!27536 (= (appendBit!0 thiss!1152 lt!135146) lt!135393)))

(declare-fun b!86743 () Bool)

(declare-fun res!71286 () Bool)

(assert (=> b!86743 (=> (not res!71286) (not e!57606))))

(declare-fun lt!135392 () (_ BitVec 64))

(declare-fun lt!135391 () (_ BitVec 64))

(assert (=> b!86743 (= res!71286 (= (bitIndex!0 (size!1852 (buf!2242 (_2!3895 lt!135393))) (currentByte!4448 (_2!3895 lt!135393)) (currentBit!4443 (_2!3895 lt!135393))) (bvadd lt!135391 lt!135392)))))

(assert (=> b!86743 (or (not (= (bvand lt!135391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135392 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135391 lt!135392) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!86743 (= lt!135392 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!86743 (= lt!135391 (bitIndex!0 (size!1852 (buf!2242 thiss!1152)) (currentByte!4448 thiss!1152) (currentBit!4443 thiss!1152)))))

(declare-fun b!86745 () Bool)

(declare-fun e!57605 () Bool)

(assert (=> b!86745 (= e!57606 e!57605)))

(declare-fun res!71287 () Bool)

(assert (=> b!86745 (=> (not res!71287) (not e!57605))))

(declare-fun lt!135390 () tuple2!7340)

(assert (=> b!86745 (= res!71287 (and (= (_2!3897 lt!135390) lt!135146) (= (_1!3897 lt!135390) (_2!3895 lt!135393))))))

(assert (=> b!86745 (= lt!135390 (readBitPure!0 (readerFrom!0 (_2!3895 lt!135393) (currentBit!4443 thiss!1152) (currentByte!4448 thiss!1152))))))

(declare-fun b!86744 () Bool)

(declare-fun res!71285 () Bool)

(assert (=> b!86744 (=> (not res!71285) (not e!57606))))

(assert (=> b!86744 (= res!71285 (isPrefixOf!0 thiss!1152 (_2!3895 lt!135393)))))

(declare-fun b!86746 () Bool)

(assert (=> b!86746 (= e!57605 (= (bitIndex!0 (size!1852 (buf!2242 (_1!3897 lt!135390))) (currentByte!4448 (_1!3897 lt!135390)) (currentBit!4443 (_1!3897 lt!135390))) (bitIndex!0 (size!1852 (buf!2242 (_2!3895 lt!135393))) (currentByte!4448 (_2!3895 lt!135393)) (currentBit!4443 (_2!3895 lt!135393)))))))

(assert (= (and d!27536 res!71284) b!86743))

(assert (= (and b!86743 res!71286) b!86744))

(assert (= (and b!86744 res!71285) b!86745))

(assert (= (and b!86745 res!71287) b!86746))

(declare-fun m!132477 () Bool)

(assert (=> b!86743 m!132477))

(assert (=> b!86743 m!132321))

(declare-fun m!132479 () Bool)

(assert (=> b!86745 m!132479))

(assert (=> b!86745 m!132479))

(declare-fun m!132481 () Bool)

(assert (=> b!86745 m!132481))

(declare-fun m!132483 () Bool)

(assert (=> b!86744 m!132483))

(declare-fun m!132485 () Bool)

(assert (=> b!86746 m!132485))

(assert (=> b!86746 m!132477))

(declare-fun m!132487 () Bool)

(assert (=> d!27536 m!132487))

(declare-fun m!132489 () Bool)

(assert (=> d!27536 m!132489))

(assert (=> b!86484 d!27536))

(push 1)

(assert (not b!86700))

(assert (not b!86743))

(assert (not d!27480))

(assert (not b!86745))

(assert (not b!86705))

(assert (not d!27530))

(assert (not d!27492))

(assert (not b!86708))

(assert (not d!27502))

(assert (not d!27496))

(assert (not b!86746))

(assert (not d!27508))

(assert (not d!27536))

(assert (not b!86706))

(assert (not b!86590))

(assert (not b!86704))

(assert (not b!86744))

(assert (not b!86709))

(assert (not b!86714))

(assert (not d!27498))

(assert (not b!86703))

(assert (not d!27490))

(assert (not b!86592))

(assert (not d!27486))

(assert (not d!27504))

(assert (not b!86718))

(assert (not d!27528))

(assert (not b!86707))

(assert (not b!86712))

(assert (not b!86701))

(assert (not d!27488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

