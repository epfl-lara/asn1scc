; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1186 () Bool)

(assert start!1186)

(declare-fun b!5027 () Bool)

(declare-fun res!6252 () Bool)

(declare-fun e!3239 () Bool)

(assert (=> b!5027 (=> (not res!6252) (not e!3239))))

(declare-datatypes ((array!380 0))(
  ( (array!381 (arr!554 (Array (_ BitVec 32) (_ BitVec 8))) (size!161 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!300 0))(
  ( (BitStream!301 (buf!485 array!380) (currentByte!1470 (_ BitVec 32)) (currentBit!1465 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!300)

(declare-datatypes ((Unit!396 0))(
  ( (Unit!397) )
))
(declare-datatypes ((tuple2!622 0))(
  ( (tuple2!623 (_1!330 Unit!396) (_2!330 BitStream!300)) )
))
(declare-fun lt!6420 () tuple2!622)

(assert (=> b!5027 (= res!6252 (= (size!161 (buf!485 thiss!1486)) (size!161 (buf!485 (_2!330 lt!6420)))))))

(declare-fun res!6247 () Bool)

(declare-fun e!3234 () Bool)

(assert (=> start!1186 (=> (not res!6247) (not e!3234))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!380)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1186 (= res!6247 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!161 srcBuffer!6))))))))

(assert (=> start!1186 e!3234))

(assert (=> start!1186 true))

(declare-fun array_inv!156 (array!380) Bool)

(assert (=> start!1186 (array_inv!156 srcBuffer!6)))

(declare-fun e!3236 () Bool)

(declare-fun inv!12 (BitStream!300) Bool)

(assert (=> start!1186 (and (inv!12 thiss!1486) e!3236)))

(declare-fun b!5028 () Bool)

(assert (=> b!5028 (= e!3236 (array_inv!156 (buf!485 thiss!1486)))))

(declare-datatypes ((tuple2!624 0))(
  ( (tuple2!625 (_1!331 array!380) (_2!331 BitStream!300)) )
))
(declare-fun lt!6416 () tuple2!624)

(declare-fun b!5029 () Bool)

(declare-fun e!3235 () Bool)

(declare-datatypes ((List!61 0))(
  ( (Nil!58) (Cons!57 (h!176 Bool) (t!811 List!61)) )
))
(declare-fun lt!6421 () List!61)

(declare-fun lt!6417 () List!61)

(declare-fun lt!6418 () List!61)

(assert (=> b!5029 (= e!3235 (or (not (= lt!6418 lt!6417)) (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsgt nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!161 (_1!331 lt!6416))))) (= lt!6421 lt!6417)))))

(declare-fun byteArrayBitContentToList!0 (BitStream!300 array!380 (_ BitVec 64) (_ BitVec 64)) List!61)

(assert (=> b!5029 (= lt!6417 (byteArrayBitContentToList!0 (_2!330 lt!6420) srcBuffer!6 from!367 nBits!460))))

(declare-fun b!5030 () Bool)

(assert (=> b!5030 (= e!3234 e!3239)))

(declare-fun res!6253 () Bool)

(assert (=> b!5030 (=> (not res!6253) (not e!3239))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5030 (= res!6253 (invariant!0 (currentBit!1465 (_2!330 lt!6420)) (currentByte!1470 (_2!330 lt!6420)) (size!161 (buf!485 (_2!330 lt!6420)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!300 array!380 (_ BitVec 64) (_ BitVec 64)) tuple2!622)

(assert (=> b!5030 (= lt!6420 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5031 () Bool)

(declare-fun res!6250 () Bool)

(assert (=> b!5031 (=> (not res!6250) (not e!3234))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5031 (= res!6250 (validate_offset_bits!1 ((_ sign_extend 32) (size!161 (buf!485 thiss!1486))) ((_ sign_extend 32) (currentByte!1470 thiss!1486)) ((_ sign_extend 32) (currentBit!1465 thiss!1486)) nBits!460))))

(declare-fun b!5032 () Bool)

(declare-fun res!6251 () Bool)

(assert (=> b!5032 (=> (not res!6251) (not e!3239))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5032 (= res!6251 (= (bitIndex!0 (size!161 (buf!485 (_2!330 lt!6420))) (currentByte!1470 (_2!330 lt!6420)) (currentBit!1465 (_2!330 lt!6420))) (bvadd (bitIndex!0 (size!161 (buf!485 thiss!1486)) (currentByte!1470 thiss!1486) (currentBit!1465 thiss!1486)) nBits!460)))))

(declare-fun b!5033 () Bool)

(declare-fun res!6248 () Bool)

(assert (=> b!5033 (=> (not res!6248) (not e!3239))))

(declare-fun isPrefixOf!0 (BitStream!300 BitStream!300) Bool)

(assert (=> b!5033 (= res!6248 (isPrefixOf!0 thiss!1486 (_2!330 lt!6420)))))

(declare-fun b!5034 () Bool)

(assert (=> b!5034 (= e!3239 (not e!3235))))

(declare-fun res!6249 () Bool)

(assert (=> b!5034 (=> res!6249 e!3235)))

(assert (=> b!5034 (= res!6249 (not (= lt!6421 lt!6418)))))

(declare-datatypes ((tuple2!626 0))(
  ( (tuple2!627 (_1!332 BitStream!300) (_2!332 BitStream!300)) )
))
(declare-fun lt!6422 () tuple2!626)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!300 BitStream!300 (_ BitVec 64)) List!61)

(assert (=> b!5034 (= lt!6418 (bitStreamReadBitsIntoList!0 (_2!330 lt!6420) (_1!332 lt!6422) nBits!460))))

(assert (=> b!5034 (= lt!6421 (byteArrayBitContentToList!0 (_2!330 lt!6420) (_1!331 lt!6416) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun readBits!0 (BitStream!300 (_ BitVec 64)) tuple2!624)

(assert (=> b!5034 (= lt!6416 (readBits!0 (_1!332 lt!6422) nBits!460))))

(assert (=> b!5034 (validate_offset_bits!1 ((_ sign_extend 32) (size!161 (buf!485 (_2!330 lt!6420)))) ((_ sign_extend 32) (currentByte!1470 thiss!1486)) ((_ sign_extend 32) (currentBit!1465 thiss!1486)) nBits!460)))

(declare-fun lt!6419 () Unit!396)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!300 array!380 (_ BitVec 64)) Unit!396)

(assert (=> b!5034 (= lt!6419 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!485 (_2!330 lt!6420)) nBits!460))))

(declare-fun reader!0 (BitStream!300 BitStream!300) tuple2!626)

(assert (=> b!5034 (= lt!6422 (reader!0 thiss!1486 (_2!330 lt!6420)))))

(assert (= (and start!1186 res!6247) b!5031))

(assert (= (and b!5031 res!6250) b!5030))

(assert (= (and b!5030 res!6253) b!5027))

(assert (= (and b!5027 res!6252) b!5032))

(assert (= (and b!5032 res!6251) b!5033))

(assert (= (and b!5033 res!6248) b!5034))

(assert (= (and b!5034 (not res!6249)) b!5029))

(assert (= start!1186 b!5028))

(declare-fun m!6119 () Bool)

(assert (=> b!5029 m!6119))

(declare-fun m!6121 () Bool)

(assert (=> b!5031 m!6121))

(declare-fun m!6123 () Bool)

(assert (=> b!5028 m!6123))

(declare-fun m!6125 () Bool)

(assert (=> start!1186 m!6125))

(declare-fun m!6127 () Bool)

(assert (=> start!1186 m!6127))

(declare-fun m!6129 () Bool)

(assert (=> b!5033 m!6129))

(declare-fun m!6131 () Bool)

(assert (=> b!5032 m!6131))

(declare-fun m!6133 () Bool)

(assert (=> b!5032 m!6133))

(declare-fun m!6135 () Bool)

(assert (=> b!5030 m!6135))

(declare-fun m!6137 () Bool)

(assert (=> b!5030 m!6137))

(declare-fun m!6139 () Bool)

(assert (=> b!5034 m!6139))

(declare-fun m!6141 () Bool)

(assert (=> b!5034 m!6141))

(declare-fun m!6143 () Bool)

(assert (=> b!5034 m!6143))

(declare-fun m!6145 () Bool)

(assert (=> b!5034 m!6145))

(declare-fun m!6147 () Bool)

(assert (=> b!5034 m!6147))

(declare-fun m!6149 () Bool)

(assert (=> b!5034 m!6149))

(check-sat (not b!5029) (not b!5028) (not b!5033) (not start!1186) (not b!5034) (not b!5030) (not b!5031) (not b!5032))
