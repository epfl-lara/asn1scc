; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31610 () Bool)

(assert start!31610)

(declare-datatypes ((array!7352 0))(
  ( (array!7353 (arr!4235 (Array (_ BitVec 32) (_ BitVec 8))) (size!3326 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5844 0))(
  ( (BitStream!5845 (buf!3796 array!7352) (currentByte!6975 (_ BitVec 32)) (currentBit!6970 (_ BitVec 32))) )
))
(declare-fun lt!249318 () BitStream!5844)

(declare-fun lt!249320 () (_ BitVec 64))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun b!158180 () Bool)

(declare-fun to!236 () (_ BitVec 32))

(declare-fun e!107433 () Bool)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158180 (= e!107433 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3326 (buf!3796 lt!249318))) lt!249320 ((_ sign_extend 32) (currentBit!6970 lt!249318)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(declare-fun b!158181 () Bool)

(declare-fun e!107436 () Bool)

(declare-fun e!107434 () Bool)

(assert (=> b!158181 (= e!107436 e!107434)))

(declare-fun res!132143 () Bool)

(assert (=> b!158181 (=> (not res!132143) (not e!107434))))

(assert (=> b!158181 (= res!132143 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun bs!65 () BitStream!5844)

(declare-datatypes ((tuple2!14412 0))(
  ( (tuple2!14413 (_1!7668 BitStream!5844) (_2!7668 array!7352)) )
))
(declare-fun lt!249319 () tuple2!14412)

(declare-fun arr!153 () array!7352)

(declare-fun readByteArrayLoopPure!0 (BitStream!5844 array!7352 (_ BitVec 32) (_ BitVec 32)) tuple2!14412)

(declare-datatypes ((tuple2!14414 0))(
  ( (tuple2!14415 (_1!7669 BitStream!5844) (_2!7669 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5844) tuple2!14414)

(assert (=> b!158181 (= lt!249319 (readByteArrayLoopPure!0 lt!249318 (array!7353 (store (arr!4235 arr!153) from!240 (_2!7669 (readBytePure!0 bs!65))) (size!3326 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5844 (_ BitVec 32)) BitStream!5844)

(assert (=> b!158181 (= lt!249318 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249316 () tuple2!14412)

(assert (=> b!158181 (= lt!249316 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!158182 () Bool)

(declare-fun res!132145 () Bool)

(assert (=> b!158182 (=> (not res!132145) (not e!107436))))

(assert (=> b!158182 (= res!132145 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3326 (buf!3796 bs!65))) ((_ sign_extend 32) (currentByte!6975 bs!65)) ((_ sign_extend 32) (currentBit!6970 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158183 () Bool)

(declare-fun e!107431 () Bool)

(declare-fun array_inv!3085 (array!7352) Bool)

(assert (=> b!158183 (= e!107431 (array_inv!3085 (buf!3796 bs!65)))))

(declare-fun res!132144 () Bool)

(assert (=> start!31610 (=> (not res!132144) (not e!107436))))

(assert (=> start!31610 (= res!132144 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3326 arr!153))))))

(assert (=> start!31610 e!107436))

(assert (=> start!31610 true))

(assert (=> start!31610 (array_inv!3085 arr!153)))

(declare-fun inv!12 (BitStream!5844) Bool)

(assert (=> start!31610 (and (inv!12 bs!65) e!107431)))

(declare-fun b!158184 () Bool)

(assert (=> b!158184 (= e!107434 (not e!107433))))

(declare-fun res!132146 () Bool)

(assert (=> b!158184 (=> res!132146 e!107433)))

(assert (=> b!158184 (= res!132146 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!158184 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3326 (buf!3796 lt!249318))) lt!249320 ((_ sign_extend 32) (currentBit!6970 lt!249318)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!158184 (= lt!249320 ((_ sign_extend 32) (currentByte!6975 lt!249318)))))

(declare-datatypes ((Unit!10570 0))(
  ( (Unit!10571) )
))
(declare-fun lt!249317 () Unit!10570)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5844 BitStream!5844 (_ BitVec 64) (_ BitVec 32)) Unit!10570)

(assert (=> b!158184 (= lt!249317 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249318 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-fun lt!249321 () tuple2!14414)

(assert (=> b!158184 (= lt!249321 (readBytePure!0 lt!249318))))

(assert (= (and start!31610 res!132144) b!158182))

(assert (= (and b!158182 res!132145) b!158181))

(assert (= (and b!158181 res!132143) b!158184))

(assert (= (and b!158184 (not res!132146)) b!158180))

(assert (= start!31610 b!158183))

(declare-fun m!248037 () Bool)

(assert (=> b!158182 m!248037))

(declare-fun m!248039 () Bool)

(assert (=> b!158181 m!248039))

(declare-fun m!248041 () Bool)

(assert (=> b!158181 m!248041))

(declare-fun m!248043 () Bool)

(assert (=> b!158181 m!248043))

(declare-fun m!248045 () Bool)

(assert (=> b!158181 m!248045))

(declare-fun m!248047 () Bool)

(assert (=> b!158181 m!248047))

(declare-fun m!248049 () Bool)

(assert (=> b!158180 m!248049))

(declare-fun m!248051 () Bool)

(assert (=> b!158184 m!248051))

(declare-fun m!248053 () Bool)

(assert (=> b!158184 m!248053))

(declare-fun m!248055 () Bool)

(assert (=> b!158184 m!248055))

(declare-fun m!248057 () Bool)

(assert (=> b!158183 m!248057))

(declare-fun m!248059 () Bool)

(assert (=> start!31610 m!248059))

(declare-fun m!248061 () Bool)

(assert (=> start!31610 m!248061))

(check-sat (not b!158181) (not b!158180) (not b!158184) (not b!158182) (not start!31610) (not b!158183))
(check-sat)
