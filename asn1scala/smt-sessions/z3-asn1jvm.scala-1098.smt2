; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31598 () Bool)

(assert start!31598)

(declare-fun b!158106 () Bool)

(declare-fun e!107338 () Bool)

(declare-datatypes ((array!7340 0))(
  ( (array!7341 (arr!4229 (Array (_ BitVec 32) (_ BitVec 8))) (size!3320 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5832 0))(
  ( (BitStream!5833 (buf!3790 array!7340) (currentByte!6969 (_ BitVec 32)) (currentBit!6964 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5832)

(declare-fun array_inv!3079 (array!7340) Bool)

(assert (=> b!158106 (= e!107338 (array_inv!3079 (buf!3790 bs!65)))))

(declare-fun res!132085 () Bool)

(declare-fun e!107337 () Bool)

(assert (=> start!31598 (=> (not res!132085) (not e!107337))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7340)

(assert (=> start!31598 (= res!132085 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3320 arr!153))))))

(assert (=> start!31598 e!107337))

(assert (=> start!31598 true))

(assert (=> start!31598 (array_inv!3079 arr!153)))

(declare-fun inv!12 (BitStream!5832) Bool)

(assert (=> start!31598 (and (inv!12 bs!65) e!107338)))

(declare-fun b!158105 () Bool)

(declare-fun e!107339 () Bool)

(assert (=> b!158105 (= e!107339 (not (or (not (= (bvand from!240 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand from!240 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)))))))

(declare-fun lt!249223 () BitStream!5832)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158105 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3320 (buf!3790 lt!249223))) ((_ sign_extend 32) (currentByte!6969 lt!249223)) ((_ sign_extend 32) (currentBit!6964 lt!249223)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!10558 0))(
  ( (Unit!10559) )
))
(declare-fun lt!249221 () Unit!10558)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5832 BitStream!5832 (_ BitVec 64) (_ BitVec 32)) Unit!10558)

(assert (=> b!158105 (= lt!249221 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249223 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14388 0))(
  ( (tuple2!14389 (_1!7656 BitStream!5832) (_2!7656 (_ BitVec 8))) )
))
(declare-fun lt!249222 () tuple2!14388)

(declare-fun readBytePure!0 (BitStream!5832) tuple2!14388)

(assert (=> b!158105 (= lt!249222 (readBytePure!0 lt!249223))))

(declare-fun b!158103 () Bool)

(declare-fun res!132086 () Bool)

(assert (=> b!158103 (=> (not res!132086) (not e!107337))))

(assert (=> b!158103 (= res!132086 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3320 (buf!3790 bs!65))) ((_ sign_extend 32) (currentByte!6969 bs!65)) ((_ sign_extend 32) (currentBit!6964 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158104 () Bool)

(assert (=> b!158104 (= e!107337 e!107339)))

(declare-fun res!132084 () Bool)

(assert (=> b!158104 (=> (not res!132084) (not e!107339))))

(assert (=> b!158104 (= res!132084 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14390 0))(
  ( (tuple2!14391 (_1!7657 BitStream!5832) (_2!7657 array!7340)) )
))
(declare-fun lt!249224 () tuple2!14390)

(declare-fun readByteArrayLoopPure!0 (BitStream!5832 array!7340 (_ BitVec 32) (_ BitVec 32)) tuple2!14390)

(assert (=> b!158104 (= lt!249224 (readByteArrayLoopPure!0 lt!249223 (array!7341 (store (arr!4229 arr!153) from!240 (_2!7656 (readBytePure!0 bs!65))) (size!3320 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5832 (_ BitVec 32)) BitStream!5832)

(assert (=> b!158104 (= lt!249223 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249225 () tuple2!14390)

(assert (=> b!158104 (= lt!249225 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31598 res!132085) b!158103))

(assert (= (and b!158103 res!132086) b!158104))

(assert (= (and b!158104 res!132084) b!158105))

(assert (= start!31598 b!158106))

(declare-fun m!247891 () Bool)

(assert (=> b!158104 m!247891))

(declare-fun m!247893 () Bool)

(assert (=> b!158104 m!247893))

(declare-fun m!247895 () Bool)

(assert (=> b!158104 m!247895))

(declare-fun m!247897 () Bool)

(assert (=> b!158104 m!247897))

(declare-fun m!247899 () Bool)

(assert (=> b!158104 m!247899))

(declare-fun m!247901 () Bool)

(assert (=> b!158103 m!247901))

(declare-fun m!247903 () Bool)

(assert (=> b!158105 m!247903))

(declare-fun m!247905 () Bool)

(assert (=> b!158105 m!247905))

(declare-fun m!247907 () Bool)

(assert (=> b!158105 m!247907))

(declare-fun m!247909 () Bool)

(assert (=> start!31598 m!247909))

(declare-fun m!247911 () Bool)

(assert (=> start!31598 m!247911))

(declare-fun m!247913 () Bool)

(assert (=> b!158106 m!247913))

(check-sat (not b!158104) (not b!158103) (not b!158106) (not b!158105) (not start!31598))
