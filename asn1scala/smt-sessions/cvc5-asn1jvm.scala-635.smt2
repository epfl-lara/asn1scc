; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17854 () Bool)

(assert start!17854)

(declare-fun b!87317 () Bool)

(declare-fun e!57912 () Bool)

(assert (=> b!87317 (= e!57912 (not true))))

(declare-fun e!57904 () Bool)

(assert (=> b!87317 e!57904))

(declare-fun res!71807 () Bool)

(assert (=> b!87317 (=> (not res!71807) (not e!57904))))

(declare-datatypes ((array!4122 0))(
  ( (array!4123 (arr!2499 (Array (_ BitVec 32) (_ BitVec 8))) (size!1862 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3286 0))(
  ( (BitStream!3287 (buf!2252 array!4122) (currentByte!4467 (_ BitVec 32)) (currentBit!4462 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3286)

(declare-datatypes ((Unit!5743 0))(
  ( (Unit!5744) )
))
(declare-datatypes ((tuple2!7384 0))(
  ( (tuple2!7385 (_1!3925 Unit!5743) (_2!3925 BitStream!3286)) )
))
(declare-fun lt!135588 () tuple2!7384)

(assert (=> b!87317 (= res!71807 (= (size!1862 (buf!2252 thiss!1152)) (size!1862 (buf!2252 (_2!3925 lt!135588)))))))

(declare-fun lt!135586 () Bool)

(declare-fun appendBit!0 (BitStream!3286 Bool) tuple2!7384)

(assert (=> b!87317 (= lt!135588 (appendBit!0 thiss!1152 lt!135586))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!87317 (= lt!135586 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87318 () Bool)

(declare-fun res!71801 () Bool)

(declare-fun e!57908 () Bool)

(assert (=> b!87318 (=> (not res!71801) (not e!57908))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87318 (= res!71801 (invariant!0 (currentBit!4462 thiss!1152) (currentByte!4467 thiss!1152) (size!1862 (buf!2252 thiss!1152))))))

(declare-fun b!87319 () Bool)

(declare-fun res!71811 () Bool)

(assert (=> b!87319 (=> (not res!71811) (not e!57908))))

(declare-fun thiss!1151 () BitStream!3286)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87319 (= res!71811 (validate_offset_bits!1 ((_ sign_extend 32) (size!1862 (buf!2252 thiss!1151))) ((_ sign_extend 32) (currentByte!4467 thiss!1151)) ((_ sign_extend 32) (currentBit!4462 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87320 () Bool)

(assert (=> b!87320 (= e!57908 e!57912)))

(declare-fun res!71809 () Bool)

(assert (=> b!87320 (=> (not res!71809) (not e!57912))))

(declare-fun lt!135587 () (_ BitVec 64))

(declare-fun lt!135590 () (_ BitVec 64))

(assert (=> b!87320 (= res!71809 (= lt!135587 (bvadd lt!135590 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87320 (= lt!135587 (bitIndex!0 (size!1862 (buf!2252 thiss!1152)) (currentByte!4467 thiss!1152) (currentBit!4462 thiss!1152)))))

(assert (=> b!87320 (= lt!135590 (bitIndex!0 (size!1862 (buf!2252 thiss!1151)) (currentByte!4467 thiss!1151) (currentBit!4462 thiss!1151)))))

(declare-fun b!87321 () Bool)

(declare-fun e!57907 () Bool)

(declare-datatypes ((tuple2!7386 0))(
  ( (tuple2!7387 (_1!3926 BitStream!3286) (_2!3926 Bool)) )
))
(declare-fun lt!135589 () tuple2!7386)

(declare-fun lt!135591 () (_ BitVec 64))

(assert (=> b!87321 (= e!57907 (= (bitIndex!0 (size!1862 (buf!2252 (_1!3926 lt!135589))) (currentByte!4467 (_1!3926 lt!135589)) (currentBit!4462 (_1!3926 lt!135589))) lt!135591))))

(declare-fun res!71810 () Bool)

(assert (=> start!17854 (=> (not res!71810) (not e!57908))))

(assert (=> start!17854 (= res!71810 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17854 e!57908))

(declare-fun e!57909 () Bool)

(declare-fun inv!12 (BitStream!3286) Bool)

(assert (=> start!17854 (and (inv!12 thiss!1152) e!57909)))

(declare-fun e!57906 () Bool)

(assert (=> start!17854 (and (inv!12 thiss!1151) e!57906)))

(assert (=> start!17854 true))

(declare-fun b!87322 () Bool)

(declare-fun array_inv!1708 (array!4122) Bool)

(assert (=> b!87322 (= e!57909 (array_inv!1708 (buf!2252 thiss!1152)))))

(declare-fun b!87323 () Bool)

(declare-fun res!71800 () Bool)

(assert (=> b!87323 (=> (not res!71800) (not e!57908))))

(assert (=> b!87323 (= res!71800 (and (bvsle i!576 nBits!336) (= (size!1862 (buf!2252 thiss!1152)) (size!1862 (buf!2252 thiss!1151)))))))

(declare-fun b!87324 () Bool)

(declare-fun res!71802 () Bool)

(declare-fun e!57910 () Bool)

(assert (=> b!87324 (=> (not res!71802) (not e!57910))))

(declare-fun isPrefixOf!0 (BitStream!3286 BitStream!3286) Bool)

(assert (=> b!87324 (= res!71802 (isPrefixOf!0 thiss!1152 (_2!3925 lt!135588)))))

(declare-fun b!87325 () Bool)

(declare-fun res!71812 () Bool)

(assert (=> b!87325 (=> (not res!71812) (not e!57908))))

(assert (=> b!87325 (= res!71812 (invariant!0 (currentBit!4462 thiss!1151) (currentByte!4467 thiss!1151) (size!1862 (buf!2252 thiss!1151))))))

(declare-fun b!87326 () Bool)

(declare-fun res!71804 () Bool)

(assert (=> b!87326 (=> (not res!71804) (not e!57912))))

(assert (=> b!87326 (= res!71804 (bvslt i!576 nBits!336))))

(declare-fun b!87327 () Bool)

(assert (=> b!87327 (= e!57910 e!57907)))

(declare-fun res!71808 () Bool)

(assert (=> b!87327 (=> (not res!71808) (not e!57907))))

(assert (=> b!87327 (= res!71808 (and (= (_2!3926 lt!135589) lt!135586) (= (_1!3926 lt!135589) (_2!3925 lt!135588))))))

(declare-fun readBitPure!0 (BitStream!3286) tuple2!7386)

(declare-fun readerFrom!0 (BitStream!3286 (_ BitVec 32) (_ BitVec 32)) BitStream!3286)

(assert (=> b!87327 (= lt!135589 (readBitPure!0 (readerFrom!0 (_2!3925 lt!135588) (currentBit!4462 thiss!1152) (currentByte!4467 thiss!1152))))))

(declare-fun b!87328 () Bool)

(declare-fun res!71805 () Bool)

(assert (=> b!87328 (=> (not res!71805) (not e!57912))))

(assert (=> b!87328 (= res!71805 (validate_offset_bits!1 ((_ sign_extend 32) (size!1862 (buf!2252 thiss!1152))) ((_ sign_extend 32) (currentByte!4467 thiss!1152)) ((_ sign_extend 32) (currentBit!4462 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87329 () Bool)

(declare-fun res!71803 () Bool)

(assert (=> b!87329 (=> (not res!71803) (not e!57908))))

(assert (=> b!87329 (= res!71803 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87330 () Bool)

(assert (=> b!87330 (= e!57904 e!57910)))

(declare-fun res!71806 () Bool)

(assert (=> b!87330 (=> (not res!71806) (not e!57910))))

(assert (=> b!87330 (= res!71806 (= lt!135591 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135587)))))

(assert (=> b!87330 (= lt!135591 (bitIndex!0 (size!1862 (buf!2252 (_2!3925 lt!135588))) (currentByte!4467 (_2!3925 lt!135588)) (currentBit!4462 (_2!3925 lt!135588))))))

(declare-fun b!87331 () Bool)

(assert (=> b!87331 (= e!57906 (array_inv!1708 (buf!2252 thiss!1151)))))

(assert (= (and start!17854 res!71810) b!87319))

(assert (= (and b!87319 res!71811) b!87325))

(assert (= (and b!87325 res!71812) b!87329))

(assert (= (and b!87329 res!71803) b!87318))

(assert (= (and b!87318 res!71801) b!87323))

(assert (= (and b!87323 res!71800) b!87320))

(assert (= (and b!87320 res!71809) b!87328))

(assert (= (and b!87328 res!71805) b!87326))

(assert (= (and b!87326 res!71804) b!87317))

(assert (= (and b!87317 res!71807) b!87330))

(assert (= (and b!87330 res!71806) b!87324))

(assert (= (and b!87324 res!71802) b!87327))

(assert (= (and b!87327 res!71808) b!87321))

(assert (= start!17854 b!87322))

(assert (= start!17854 b!87331))

(declare-fun m!132839 () Bool)

(assert (=> b!87317 m!132839))

(declare-fun m!132841 () Bool)

(assert (=> b!87322 m!132841))

(declare-fun m!132843 () Bool)

(assert (=> b!87320 m!132843))

(declare-fun m!132845 () Bool)

(assert (=> b!87320 m!132845))

(declare-fun m!132847 () Bool)

(assert (=> b!87324 m!132847))

(declare-fun m!132849 () Bool)

(assert (=> b!87321 m!132849))

(declare-fun m!132851 () Bool)

(assert (=> b!87330 m!132851))

(declare-fun m!132853 () Bool)

(assert (=> b!87325 m!132853))

(declare-fun m!132855 () Bool)

(assert (=> b!87331 m!132855))

(declare-fun m!132857 () Bool)

(assert (=> b!87328 m!132857))

(declare-fun m!132859 () Bool)

(assert (=> b!87319 m!132859))

(declare-fun m!132861 () Bool)

(assert (=> start!17854 m!132861))

(declare-fun m!132863 () Bool)

(assert (=> start!17854 m!132863))

(declare-fun m!132865 () Bool)

(assert (=> b!87318 m!132865))

(declare-fun m!132867 () Bool)

(assert (=> b!87327 m!132867))

(assert (=> b!87327 m!132867))

(declare-fun m!132869 () Bool)

(assert (=> b!87327 m!132869))

(push 1)

(assert (not b!87330))

(assert (not b!87317))

(assert (not b!87318))

(assert (not b!87320))

(assert (not b!87321))

(assert (not b!87327))

(assert (not b!87324))

(assert (not b!87331))

(assert (not b!87325))

(assert (not start!17854))

(assert (not b!87322))

(assert (not b!87328))

(assert (not b!87319))

(check-sat)

(pop 1)

