; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17856 () Bool)

(assert start!17856)

(declare-fun b!87362 () Bool)

(declare-fun e!57938 () Bool)

(declare-fun e!57936 () Bool)

(assert (=> b!87362 (= e!57938 e!57936)))

(declare-fun res!71848 () Bool)

(assert (=> b!87362 (=> (not res!71848) (not e!57936))))

(declare-datatypes ((array!4124 0))(
  ( (array!4125 (arr!2500 (Array (_ BitVec 32) (_ BitVec 8))) (size!1863 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3288 0))(
  ( (BitStream!3289 (buf!2253 array!4124) (currentByte!4468 (_ BitVec 32)) (currentBit!4463 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!7388 0))(
  ( (tuple2!7389 (_1!3927 BitStream!3288) (_2!3927 Bool)) )
))
(declare-fun lt!135609 () tuple2!7388)

(declare-fun lt!135606 () Bool)

(declare-datatypes ((Unit!5745 0))(
  ( (Unit!5746) )
))
(declare-datatypes ((tuple2!7390 0))(
  ( (tuple2!7391 (_1!3928 Unit!5745) (_2!3928 BitStream!3288)) )
))
(declare-fun lt!135608 () tuple2!7390)

(assert (=> b!87362 (= res!71848 (and (= (_2!3927 lt!135609) lt!135606) (= (_1!3927 lt!135609) (_2!3928 lt!135608))))))

(declare-fun thiss!1152 () BitStream!3288)

(declare-fun readBitPure!0 (BitStream!3288) tuple2!7388)

(declare-fun readerFrom!0 (BitStream!3288 (_ BitVec 32) (_ BitVec 32)) BitStream!3288)

(assert (=> b!87362 (= lt!135609 (readBitPure!0 (readerFrom!0 (_2!3928 lt!135608) (currentBit!4463 thiss!1152) (currentByte!4468 thiss!1152))))))

(declare-fun b!87363 () Bool)

(declare-fun res!71841 () Bool)

(assert (=> b!87363 (=> (not res!71841) (not e!57938))))

(declare-fun isPrefixOf!0 (BitStream!3288 BitStream!3288) Bool)

(assert (=> b!87363 (= res!71841 (isPrefixOf!0 thiss!1152 (_2!3928 lt!135608)))))

(declare-fun b!87364 () Bool)

(declare-fun res!71844 () Bool)

(declare-fun e!57932 () Bool)

(assert (=> b!87364 (=> (not res!71844) (not e!57932))))

(declare-fun thiss!1151 () BitStream!3288)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!87364 (= res!71844 (and (bvsle i!576 nBits!336) (= (size!1863 (buf!2253 thiss!1152)) (size!1863 (buf!2253 thiss!1151)))))))

(declare-fun b!87366 () Bool)

(declare-fun e!57933 () Bool)

(assert (=> b!87366 (= e!57933 e!57938)))

(declare-fun res!71845 () Bool)

(assert (=> b!87366 (=> (not res!71845) (not e!57938))))

(declare-fun lt!135604 () (_ BitVec 64))

(declare-fun lt!135605 () (_ BitVec 64))

(assert (=> b!87366 (= res!71845 (= lt!135604 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135605)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87366 (= lt!135604 (bitIndex!0 (size!1863 (buf!2253 (_2!3928 lt!135608))) (currentByte!4468 (_2!3928 lt!135608)) (currentBit!4463 (_2!3928 lt!135608))))))

(declare-fun b!87367 () Bool)

(declare-fun e!57935 () Bool)

(declare-fun array_inv!1709 (array!4124) Bool)

(assert (=> b!87367 (= e!57935 (array_inv!1709 (buf!2253 thiss!1152)))))

(declare-fun b!87368 () Bool)

(declare-fun res!71849 () Bool)

(declare-fun e!57937 () Bool)

(assert (=> b!87368 (=> (not res!71849) (not e!57937))))

(assert (=> b!87368 (= res!71849 (bvslt i!576 nBits!336))))

(declare-fun b!87369 () Bool)

(assert (=> b!87369 (= e!57937 (not true))))

(assert (=> b!87369 e!57933))

(declare-fun res!71842 () Bool)

(assert (=> b!87369 (=> (not res!71842) (not e!57933))))

(assert (=> b!87369 (= res!71842 (= (size!1863 (buf!2253 thiss!1152)) (size!1863 (buf!2253 (_2!3928 lt!135608)))))))

(declare-fun appendBit!0 (BitStream!3288 Bool) tuple2!7390)

(assert (=> b!87369 (= lt!135608 (appendBit!0 thiss!1152 lt!135606))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87369 (= lt!135606 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87370 () Bool)

(declare-fun res!71847 () Bool)

(assert (=> b!87370 (=> (not res!71847) (not e!57932))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87370 (= res!71847 (validate_offset_bits!1 ((_ sign_extend 32) (size!1863 (buf!2253 thiss!1151))) ((_ sign_extend 32) (currentByte!4468 thiss!1151)) ((_ sign_extend 32) (currentBit!4463 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87371 () Bool)

(declare-fun res!71851 () Bool)

(assert (=> b!87371 (=> (not res!71851) (not e!57932))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87371 (= res!71851 (invariant!0 (currentBit!4463 thiss!1152) (currentByte!4468 thiss!1152) (size!1863 (buf!2253 thiss!1152))))))

(declare-fun b!87365 () Bool)

(assert (=> b!87365 (= e!57932 e!57937)))

(declare-fun res!71839 () Bool)

(assert (=> b!87365 (=> (not res!71839) (not e!57937))))

(declare-fun lt!135607 () (_ BitVec 64))

(assert (=> b!87365 (= res!71839 (= lt!135605 (bvadd lt!135607 ((_ sign_extend 32) i!576))))))

(assert (=> b!87365 (= lt!135605 (bitIndex!0 (size!1863 (buf!2253 thiss!1152)) (currentByte!4468 thiss!1152) (currentBit!4463 thiss!1152)))))

(assert (=> b!87365 (= lt!135607 (bitIndex!0 (size!1863 (buf!2253 thiss!1151)) (currentByte!4468 thiss!1151) (currentBit!4463 thiss!1151)))))

(declare-fun res!71850 () Bool)

(assert (=> start!17856 (=> (not res!71850) (not e!57932))))

(assert (=> start!17856 (= res!71850 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17856 e!57932))

(declare-fun inv!12 (BitStream!3288) Bool)

(assert (=> start!17856 (and (inv!12 thiss!1152) e!57935)))

(declare-fun e!57934 () Bool)

(assert (=> start!17856 (and (inv!12 thiss!1151) e!57934)))

(assert (=> start!17856 true))

(declare-fun b!87372 () Bool)

(declare-fun res!71846 () Bool)

(assert (=> b!87372 (=> (not res!71846) (not e!57937))))

(assert (=> b!87372 (= res!71846 (validate_offset_bits!1 ((_ sign_extend 32) (size!1863 (buf!2253 thiss!1152))) ((_ sign_extend 32) (currentByte!4468 thiss!1152)) ((_ sign_extend 32) (currentBit!4463 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87373 () Bool)

(declare-fun res!71843 () Bool)

(assert (=> b!87373 (=> (not res!71843) (not e!57932))))

(assert (=> b!87373 (= res!71843 (invariant!0 (currentBit!4463 thiss!1151) (currentByte!4468 thiss!1151) (size!1863 (buf!2253 thiss!1151))))))

(declare-fun b!87374 () Bool)

(assert (=> b!87374 (= e!57934 (array_inv!1709 (buf!2253 thiss!1151)))))

(declare-fun b!87375 () Bool)

(declare-fun res!71840 () Bool)

(assert (=> b!87375 (=> (not res!71840) (not e!57932))))

(assert (=> b!87375 (= res!71840 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87376 () Bool)

(assert (=> b!87376 (= e!57936 (= (bitIndex!0 (size!1863 (buf!2253 (_1!3927 lt!135609))) (currentByte!4468 (_1!3927 lt!135609)) (currentBit!4463 (_1!3927 lt!135609))) lt!135604))))

(assert (= (and start!17856 res!71850) b!87370))

(assert (= (and b!87370 res!71847) b!87373))

(assert (= (and b!87373 res!71843) b!87375))

(assert (= (and b!87375 res!71840) b!87371))

(assert (= (and b!87371 res!71851) b!87364))

(assert (= (and b!87364 res!71844) b!87365))

(assert (= (and b!87365 res!71839) b!87372))

(assert (= (and b!87372 res!71846) b!87368))

(assert (= (and b!87368 res!71849) b!87369))

(assert (= (and b!87369 res!71842) b!87366))

(assert (= (and b!87366 res!71845) b!87363))

(assert (= (and b!87363 res!71841) b!87362))

(assert (= (and b!87362 res!71848) b!87376))

(assert (= start!17856 b!87367))

(assert (= start!17856 b!87374))

(declare-fun m!132871 () Bool)

(assert (=> b!87373 m!132871))

(declare-fun m!132873 () Bool)

(assert (=> b!87374 m!132873))

(declare-fun m!132875 () Bool)

(assert (=> b!87369 m!132875))

(declare-fun m!132877 () Bool)

(assert (=> b!87372 m!132877))

(declare-fun m!132879 () Bool)

(assert (=> b!87362 m!132879))

(assert (=> b!87362 m!132879))

(declare-fun m!132881 () Bool)

(assert (=> b!87362 m!132881))

(declare-fun m!132883 () Bool)

(assert (=> b!87363 m!132883))

(declare-fun m!132885 () Bool)

(assert (=> b!87376 m!132885))

(declare-fun m!132887 () Bool)

(assert (=> b!87370 m!132887))

(declare-fun m!132889 () Bool)

(assert (=> b!87366 m!132889))

(declare-fun m!132891 () Bool)

(assert (=> b!87367 m!132891))

(declare-fun m!132893 () Bool)

(assert (=> start!17856 m!132893))

(declare-fun m!132895 () Bool)

(assert (=> start!17856 m!132895))

(declare-fun m!132897 () Bool)

(assert (=> b!87371 m!132897))

(declare-fun m!132899 () Bool)

(assert (=> b!87365 m!132899))

(declare-fun m!132901 () Bool)

(assert (=> b!87365 m!132901))

(check-sat (not b!87365) (not b!87373) (not b!87370) (not b!87367) (not b!87372) (not b!87362) (not b!87371) (not b!87363) (not start!17856) (not b!87369) (not b!87366) (not b!87376) (not b!87374))
