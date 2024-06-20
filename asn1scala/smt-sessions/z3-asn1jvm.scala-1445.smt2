; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39622 () Bool)

(assert start!39622)

(declare-fun b!179042 () Bool)

(declare-fun res!148560 () Bool)

(declare-fun e!124582 () Bool)

(assert (=> b!179042 (=> res!148560 e!124582)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9637 0))(
  ( (array!9638 (arr!5180 (Array (_ BitVec 32) (_ BitVec 8))) (size!4250 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7608 0))(
  ( (BitStream!7609 (buf!4693 array!9637) (currentByte!8891 (_ BitVec 32)) (currentBit!8886 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12880 0))(
  ( (Unit!12881) )
))
(declare-datatypes ((tuple2!15434 0))(
  ( (tuple2!15435 (_1!8362 Unit!12880) (_2!8362 BitStream!7608)) )
))
(declare-fun lt!274586 () tuple2!15434)

(declare-fun lt!274585 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!7608)

(declare-fun lt!274581 () (_ BitVec 64))

(assert (=> b!179042 (= res!148560 (or (not (= (size!4250 (buf!4693 (_2!8362 lt!274586))) (size!4250 (buf!4693 thiss!1204)))) (not (= lt!274581 (bvsub (bvadd lt!274585 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179043 () Bool)

(declare-fun e!124579 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179043 (= e!124579 (invariant!0 (currentBit!8886 thiss!1204) (currentByte!8891 thiss!1204) (size!4250 (buf!4693 (_2!8362 lt!274586)))))))

(declare-fun b!179044 () Bool)

(assert (=> b!179044 (= e!124582 true)))

(declare-datatypes ((tuple2!15436 0))(
  ( (tuple2!15437 (_1!8363 BitStream!7608) (_2!8363 BitStream!7608)) )
))
(declare-fun lt!274582 () tuple2!15436)

(declare-fun reader!0 (BitStream!7608 BitStream!7608) tuple2!15436)

(assert (=> b!179044 (= lt!274582 (reader!0 thiss!1204 (_2!8362 lt!274586)))))

(declare-fun e!124576 () Bool)

(assert (=> b!179044 e!124576))

(declare-fun res!148557 () Bool)

(assert (=> b!179044 (=> (not res!148557) (not e!124576))))

(declare-datatypes ((tuple2!15438 0))(
  ( (tuple2!15439 (_1!8364 BitStream!7608) (_2!8364 Bool)) )
))
(declare-fun lt!274572 () tuple2!15438)

(declare-fun lt!274574 () tuple2!15438)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179044 (= res!148557 (= (bitIndex!0 (size!4250 (buf!4693 (_1!8364 lt!274572))) (currentByte!8891 (_1!8364 lt!274572)) (currentBit!8886 (_1!8364 lt!274572))) (bitIndex!0 (size!4250 (buf!4693 (_1!8364 lt!274574))) (currentByte!8891 (_1!8364 lt!274574)) (currentBit!8886 (_1!8364 lt!274574)))))))

(declare-fun lt!274575 () Unit!12880)

(declare-fun lt!274584 () BitStream!7608)

(declare-fun readBitPrefixLemma!0 (BitStream!7608 BitStream!7608) Unit!12880)

(assert (=> b!179044 (= lt!274575 (readBitPrefixLemma!0 lt!274584 (_2!8362 lt!274586)))))

(declare-fun readBitPure!0 (BitStream!7608) tuple2!15438)

(assert (=> b!179044 (= lt!274574 (readBitPure!0 (BitStream!7609 (buf!4693 (_2!8362 lt!274586)) (currentByte!8891 thiss!1204) (currentBit!8886 thiss!1204))))))

(assert (=> b!179044 (= lt!274572 (readBitPure!0 lt!274584))))

(assert (=> b!179044 e!124579))

(declare-fun res!148549 () Bool)

(assert (=> b!179044 (=> (not res!148549) (not e!124579))))

(declare-fun lt!274579 () tuple2!15434)

(assert (=> b!179044 (= res!148549 (invariant!0 (currentBit!8886 thiss!1204) (currentByte!8891 thiss!1204) (size!4250 (buf!4693 (_2!8362 lt!274579)))))))

(assert (=> b!179044 (= lt!274584 (BitStream!7609 (buf!4693 (_2!8362 lt!274579)) (currentByte!8891 thiss!1204) (currentBit!8886 thiss!1204)))))

(declare-fun b!179045 () Bool)

(declare-fun res!148561 () Bool)

(assert (=> b!179045 (=> res!148561 e!124582)))

(declare-fun isPrefixOf!0 (BitStream!7608 BitStream!7608) Bool)

(assert (=> b!179045 (= res!148561 (not (isPrefixOf!0 (_2!8362 lt!274579) (_2!8362 lt!274586))))))

(declare-fun b!179046 () Bool)

(declare-fun res!148550 () Bool)

(declare-fun e!124578 () Bool)

(assert (=> b!179046 (=> (not res!148550) (not e!124578))))

(assert (=> b!179046 (= res!148550 (not (= i!590 nBits!348)))))

(declare-fun b!179047 () Bool)

(declare-fun e!124585 () Bool)

(declare-fun e!124583 () Bool)

(assert (=> b!179047 (= e!124585 e!124583)))

(declare-fun res!148559 () Bool)

(assert (=> b!179047 (=> (not res!148559) (not e!124583))))

(declare-fun lt!274578 () (_ BitVec 64))

(declare-fun lt!274583 () (_ BitVec 64))

(assert (=> b!179047 (= res!148559 (= lt!274578 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274583)))))

(assert (=> b!179047 (= lt!274578 (bitIndex!0 (size!4250 (buf!4693 (_2!8362 lt!274579))) (currentByte!8891 (_2!8362 lt!274579)) (currentBit!8886 (_2!8362 lt!274579))))))

(assert (=> b!179047 (= lt!274583 (bitIndex!0 (size!4250 (buf!4693 thiss!1204)) (currentByte!8891 thiss!1204) (currentBit!8886 thiss!1204)))))

(declare-fun res!148548 () Bool)

(assert (=> start!39622 (=> (not res!148548) (not e!124578))))

(assert (=> start!39622 (= res!148548 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39622 e!124578))

(assert (=> start!39622 true))

(declare-fun e!124584 () Bool)

(declare-fun inv!12 (BitStream!7608) Bool)

(assert (=> start!39622 (and (inv!12 thiss!1204) e!124584)))

(declare-fun b!179048 () Bool)

(declare-fun res!148558 () Bool)

(assert (=> b!179048 (=> (not res!148558) (not e!124578))))

(assert (=> b!179048 (= res!148558 (invariant!0 (currentBit!8886 thiss!1204) (currentByte!8891 thiss!1204) (size!4250 (buf!4693 thiss!1204))))))

(declare-fun b!179049 () Bool)

(declare-fun e!124581 () Bool)

(declare-fun lt!274576 () tuple2!15438)

(assert (=> b!179049 (= e!124581 (= (bitIndex!0 (size!4250 (buf!4693 (_1!8364 lt!274576))) (currentByte!8891 (_1!8364 lt!274576)) (currentBit!8886 (_1!8364 lt!274576))) lt!274578))))

(declare-fun b!179050 () Bool)

(declare-fun e!124577 () Bool)

(assert (=> b!179050 (= e!124578 (not e!124577))))

(declare-fun res!148563 () Bool)

(assert (=> b!179050 (=> res!148563 e!124577)))

(declare-fun lt!274573 () (_ BitVec 64))

(assert (=> b!179050 (= res!148563 (not (= lt!274573 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274585))))))

(assert (=> b!179050 (= lt!274573 (bitIndex!0 (size!4250 (buf!4693 (_2!8362 lt!274579))) (currentByte!8891 (_2!8362 lt!274579)) (currentBit!8886 (_2!8362 lt!274579))))))

(assert (=> b!179050 (= lt!274585 (bitIndex!0 (size!4250 (buf!4693 thiss!1204)) (currentByte!8891 thiss!1204) (currentBit!8886 thiss!1204)))))

(assert (=> b!179050 e!124585))

(declare-fun res!148552 () Bool)

(assert (=> b!179050 (=> (not res!148552) (not e!124585))))

(assert (=> b!179050 (= res!148552 (= (size!4250 (buf!4693 thiss!1204)) (size!4250 (buf!4693 (_2!8362 lt!274579)))))))

(declare-fun lt!274580 () Bool)

(declare-fun appendBit!0 (BitStream!7608 Bool) tuple2!15434)

(assert (=> b!179050 (= lt!274579 (appendBit!0 thiss!1204 lt!274580))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!179050 (= lt!274580 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179051 () Bool)

(declare-fun res!148556 () Bool)

(assert (=> b!179051 (=> (not res!148556) (not e!124578))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179051 (= res!148556 (validate_offset_bits!1 ((_ sign_extend 32) (size!4250 (buf!4693 thiss!1204))) ((_ sign_extend 32) (currentByte!8891 thiss!1204)) ((_ sign_extend 32) (currentBit!8886 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179052 () Bool)

(declare-fun res!148562 () Bool)

(assert (=> b!179052 (=> res!148562 e!124582)))

(assert (=> b!179052 (= res!148562 (not (isPrefixOf!0 thiss!1204 (_2!8362 lt!274579))))))

(declare-fun b!179053 () Bool)

(declare-fun res!148551 () Bool)

(assert (=> b!179053 (=> (not res!148551) (not e!124583))))

(assert (=> b!179053 (= res!148551 (isPrefixOf!0 thiss!1204 (_2!8362 lt!274579)))))

(declare-fun b!179054 () Bool)

(assert (=> b!179054 (= e!124576 (= (_2!8364 lt!274572) (_2!8364 lt!274574)))))

(declare-fun b!179055 () Bool)

(assert (=> b!179055 (= e!124577 e!124582)))

(declare-fun res!148554 () Bool)

(assert (=> b!179055 (=> res!148554 e!124582)))

(assert (=> b!179055 (= res!148554 (not (= lt!274581 (bvsub (bvsub (bvadd lt!274573 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!179055 (= lt!274581 (bitIndex!0 (size!4250 (buf!4693 (_2!8362 lt!274586))) (currentByte!8891 (_2!8362 lt!274586)) (currentBit!8886 (_2!8362 lt!274586))))))

(assert (=> b!179055 (isPrefixOf!0 thiss!1204 (_2!8362 lt!274586))))

(declare-fun lt!274577 () Unit!12880)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7608 BitStream!7608 BitStream!7608) Unit!12880)

(assert (=> b!179055 (= lt!274577 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8362 lt!274579) (_2!8362 lt!274586)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15434)

(assert (=> b!179055 (= lt!274586 (appendBitsLSBFirstLoopTR!0 (_2!8362 lt!274579) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179056 () Bool)

(assert (=> b!179056 (= e!124583 e!124581)))

(declare-fun res!148553 () Bool)

(assert (=> b!179056 (=> (not res!148553) (not e!124581))))

(assert (=> b!179056 (= res!148553 (and (= (_2!8364 lt!274576) lt!274580) (= (_1!8364 lt!274576) (_2!8362 lt!274579))))))

(declare-fun readerFrom!0 (BitStream!7608 (_ BitVec 32) (_ BitVec 32)) BitStream!7608)

(assert (=> b!179056 (= lt!274576 (readBitPure!0 (readerFrom!0 (_2!8362 lt!274579) (currentBit!8886 thiss!1204) (currentByte!8891 thiss!1204))))))

(declare-fun b!179057 () Bool)

(declare-fun res!148555 () Bool)

(assert (=> b!179057 (=> res!148555 e!124582)))

(assert (=> b!179057 (= res!148555 (not (invariant!0 (currentBit!8886 (_2!8362 lt!274586)) (currentByte!8891 (_2!8362 lt!274586)) (size!4250 (buf!4693 (_2!8362 lt!274586))))))))

(declare-fun b!179058 () Bool)

(declare-fun array_inv!3991 (array!9637) Bool)

(assert (=> b!179058 (= e!124584 (array_inv!3991 (buf!4693 thiss!1204)))))

(assert (= (and start!39622 res!148548) b!179051))

(assert (= (and b!179051 res!148556) b!179048))

(assert (= (and b!179048 res!148558) b!179046))

(assert (= (and b!179046 res!148550) b!179050))

(assert (= (and b!179050 res!148552) b!179047))

(assert (= (and b!179047 res!148559) b!179053))

(assert (= (and b!179053 res!148551) b!179056))

(assert (= (and b!179056 res!148553) b!179049))

(assert (= (and b!179050 (not res!148563)) b!179055))

(assert (= (and b!179055 (not res!148554)) b!179057))

(assert (= (and b!179057 (not res!148555)) b!179042))

(assert (= (and b!179042 (not res!148560)) b!179045))

(assert (= (and b!179045 (not res!148561)) b!179052))

(assert (= (and b!179052 (not res!148562)) b!179044))

(assert (= (and b!179044 res!148549) b!179043))

(assert (= (and b!179044 res!148557) b!179054))

(assert (= start!39622 b!179058))

(declare-fun m!279117 () Bool)

(assert (=> b!179053 m!279117))

(declare-fun m!279119 () Bool)

(assert (=> b!179048 m!279119))

(declare-fun m!279121 () Bool)

(assert (=> b!179055 m!279121))

(declare-fun m!279123 () Bool)

(assert (=> b!179055 m!279123))

(declare-fun m!279125 () Bool)

(assert (=> b!179055 m!279125))

(declare-fun m!279127 () Bool)

(assert (=> b!179055 m!279127))

(declare-fun m!279129 () Bool)

(assert (=> b!179043 m!279129))

(declare-fun m!279131 () Bool)

(assert (=> b!179051 m!279131))

(declare-fun m!279133 () Bool)

(assert (=> b!179049 m!279133))

(declare-fun m!279135 () Bool)

(assert (=> b!179047 m!279135))

(declare-fun m!279137 () Bool)

(assert (=> b!179047 m!279137))

(declare-fun m!279139 () Bool)

(assert (=> start!39622 m!279139))

(declare-fun m!279141 () Bool)

(assert (=> b!179058 m!279141))

(assert (=> b!179050 m!279135))

(assert (=> b!179050 m!279137))

(declare-fun m!279143 () Bool)

(assert (=> b!179050 m!279143))

(declare-fun m!279145 () Bool)

(assert (=> b!179045 m!279145))

(declare-fun m!279147 () Bool)

(assert (=> b!179056 m!279147))

(assert (=> b!179056 m!279147))

(declare-fun m!279149 () Bool)

(assert (=> b!179056 m!279149))

(declare-fun m!279151 () Bool)

(assert (=> b!179044 m!279151))

(declare-fun m!279153 () Bool)

(assert (=> b!179044 m!279153))

(declare-fun m!279155 () Bool)

(assert (=> b!179044 m!279155))

(declare-fun m!279157 () Bool)

(assert (=> b!179044 m!279157))

(declare-fun m!279159 () Bool)

(assert (=> b!179044 m!279159))

(declare-fun m!279161 () Bool)

(assert (=> b!179044 m!279161))

(declare-fun m!279163 () Bool)

(assert (=> b!179044 m!279163))

(declare-fun m!279165 () Bool)

(assert (=> b!179057 m!279165))

(assert (=> b!179052 m!279117))

(check-sat (not b!179056) (not b!179051) (not b!179045) (not b!179058) (not b!179055) (not b!179052) (not b!179050) (not b!179057) (not b!179048) (not start!39622) (not b!179049) (not b!179047) (not b!179053) (not b!179044) (not b!179043))
