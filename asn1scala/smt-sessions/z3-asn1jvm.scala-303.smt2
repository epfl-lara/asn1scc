; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5992 () Bool)

(assert start!5992)

(declare-fun b!27648 () Bool)

(declare-fun e!18675 () Bool)

(assert (=> b!27648 (= e!18675 true)))

(declare-fun lt!39187 () (_ BitVec 64))

(declare-datatypes ((array!1729 0))(
  ( (array!1730 (arr!1209 (Array (_ BitVec 32) (_ BitVec 8))) (size!747 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1326 0))(
  ( (BitStream!1327 (buf!1074 array!1729) (currentByte!2399 (_ BitVec 32)) (currentBit!2394 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3018 0))(
  ( (tuple2!3019 (_1!1596 BitStream!1326) (_2!1596 BitStream!1326)) )
))
(declare-fun lt!39180 () tuple2!3018)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27648 (= lt!39187 (bitIndex!0 (size!747 (buf!1074 (_1!1596 lt!39180))) (currentByte!2399 (_1!1596 lt!39180)) (currentBit!2394 (_1!1596 lt!39180))))))

(declare-fun lt!39185 () (_ BitVec 64))

(declare-fun lt!39181 () tuple2!3018)

(assert (=> b!27648 (= lt!39185 (bitIndex!0 (size!747 (buf!1074 (_1!1596 lt!39181))) (currentByte!2399 (_1!1596 lt!39181)) (currentBit!2394 (_1!1596 lt!39181))))))

(declare-fun b!27649 () Bool)

(declare-fun e!18674 () Bool)

(declare-fun thiss!1379 () BitStream!1326)

(declare-fun array_inv!716 (array!1729) Bool)

(assert (=> b!27649 (= e!18674 (array_inv!716 (buf!1074 thiss!1379)))))

(declare-fun b!27650 () Bool)

(declare-fun res!23940 () Bool)

(declare-fun e!18676 () Bool)

(assert (=> b!27650 (=> res!23940 e!18676)))

(declare-datatypes ((Unit!2197 0))(
  ( (Unit!2198) )
))
(declare-datatypes ((tuple2!3020 0))(
  ( (tuple2!3021 (_1!1597 Unit!2197) (_2!1597 BitStream!1326)) )
))
(declare-fun lt!39179 () tuple2!3020)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27650 (= res!23940 (not (invariant!0 (currentBit!2394 (_2!1597 lt!39179)) (currentByte!2399 (_2!1597 lt!39179)) (size!747 (buf!1074 (_2!1597 lt!39179))))))))

(declare-fun b!27652 () Bool)

(declare-fun res!23942 () Bool)

(assert (=> b!27652 (=> res!23942 e!18675)))

(declare-fun lt!39188 () tuple2!3020)

(declare-fun isPrefixOf!0 (BitStream!1326 BitStream!1326) Bool)

(assert (=> b!27652 (= res!23942 (not (isPrefixOf!0 (_1!1596 lt!39181) (_2!1597 lt!39188))))))

(declare-fun b!27653 () Bool)

(declare-fun res!23951 () Bool)

(assert (=> b!27653 (=> res!23951 e!18675)))

(assert (=> b!27653 (= res!23951 (not (isPrefixOf!0 (_1!1596 lt!39181) (_1!1596 lt!39180))))))

(declare-fun b!27654 () Bool)

(assert (=> b!27654 (= e!18676 e!18675)))

(declare-fun res!23941 () Bool)

(assert (=> b!27654 (=> res!23941 e!18675)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!27654 (= res!23941 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!364 0))(
  ( (Nil!361) (Cons!360 (h!479 Bool) (t!1114 List!364)) )
))
(declare-fun lt!39183 () List!364)

(declare-fun lt!39174 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1326 BitStream!1326 (_ BitVec 64)) List!364)

(assert (=> b!27654 (= lt!39183 (bitStreamReadBitsIntoList!0 (_2!1597 lt!39188) (_1!1596 lt!39180) lt!39174))))

(declare-fun lt!39173 () List!364)

(assert (=> b!27654 (= lt!39173 (bitStreamReadBitsIntoList!0 (_2!1597 lt!39188) (_1!1596 lt!39181) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27654 (validate_offset_bits!1 ((_ sign_extend 32) (size!747 (buf!1074 (_2!1597 lt!39188)))) ((_ sign_extend 32) (currentByte!2399 (_2!1597 lt!39179))) ((_ sign_extend 32) (currentBit!2394 (_2!1597 lt!39179))) lt!39174)))

(declare-fun lt!39190 () Unit!2197)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1326 array!1729 (_ BitVec 64)) Unit!2197)

(assert (=> b!27654 (= lt!39190 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1597 lt!39179) (buf!1074 (_2!1597 lt!39188)) lt!39174))))

(declare-fun reader!0 (BitStream!1326 BitStream!1326) tuple2!3018)

(assert (=> b!27654 (= lt!39180 (reader!0 (_2!1597 lt!39179) (_2!1597 lt!39188)))))

(assert (=> b!27654 (validate_offset_bits!1 ((_ sign_extend 32) (size!747 (buf!1074 (_2!1597 lt!39188)))) ((_ sign_extend 32) (currentByte!2399 thiss!1379)) ((_ sign_extend 32) (currentBit!2394 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39176 () Unit!2197)

(assert (=> b!27654 (= lt!39176 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1074 (_2!1597 lt!39188)) (bvsub to!314 i!635)))))

(assert (=> b!27654 (= lt!39181 (reader!0 thiss!1379 (_2!1597 lt!39188)))))

(declare-fun b!27655 () Bool)

(declare-fun res!23947 () Bool)

(declare-fun e!18669 () Bool)

(assert (=> b!27655 (=> res!23947 e!18669)))

(assert (=> b!27655 (= res!23947 (not (= (size!747 (buf!1074 thiss!1379)) (size!747 (buf!1074 (_2!1597 lt!39188))))))))

(declare-fun b!27656 () Bool)

(declare-fun res!23939 () Bool)

(assert (=> b!27656 (=> res!23939 e!18675)))

(declare-fun length!90 (List!364) Int)

(assert (=> b!27656 (= res!23939 (<= (length!90 lt!39173) 0))))

(declare-fun srcBuffer!2 () array!1729)

(declare-fun e!18672 () Bool)

(declare-fun lt!39189 () tuple2!3018)

(declare-fun b!27657 () Bool)

(declare-fun head!201 (List!364) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1326 array!1729 (_ BitVec 64) (_ BitVec 64)) List!364)

(assert (=> b!27657 (= e!18672 (= (head!201 (byteArrayBitContentToList!0 (_2!1597 lt!39179) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!201 (bitStreamReadBitsIntoList!0 (_2!1597 lt!39179) (_1!1596 lt!39189) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27658 () Bool)

(declare-fun res!23945 () Bool)

(declare-fun e!18666 () Bool)

(assert (=> b!27658 (=> (not res!23945) (not e!18666))))

(assert (=> b!27658 (= res!23945 (validate_offset_bits!1 ((_ sign_extend 32) (size!747 (buf!1074 thiss!1379))) ((_ sign_extend 32) (currentByte!2399 thiss!1379)) ((_ sign_extend 32) (currentBit!2394 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27659 () Bool)

(declare-fun e!18665 () Bool)

(assert (=> b!27659 (= e!18666 (not e!18665))))

(declare-fun res!23952 () Bool)

(assert (=> b!27659 (=> res!23952 e!18665)))

(assert (=> b!27659 (= res!23952 (bvsge i!635 to!314))))

(assert (=> b!27659 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39186 () Unit!2197)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1326) Unit!2197)

(assert (=> b!27659 (= lt!39186 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!39177 () (_ BitVec 64))

(assert (=> b!27659 (= lt!39177 (bitIndex!0 (size!747 (buf!1074 thiss!1379)) (currentByte!2399 thiss!1379) (currentBit!2394 thiss!1379)))))

(declare-fun b!27660 () Bool)

(declare-fun res!23943 () Bool)

(assert (=> b!27660 (=> res!23943 e!18675)))

(assert (=> b!27660 (= res!23943 (not (isPrefixOf!0 (_1!1596 lt!39180) (_2!1597 lt!39188))))))

(declare-fun b!27661 () Bool)

(declare-fun res!23950 () Bool)

(assert (=> b!27661 (=> res!23950 e!18669)))

(assert (=> b!27661 (= res!23950 (not (invariant!0 (currentBit!2394 (_2!1597 lt!39188)) (currentByte!2399 (_2!1597 lt!39188)) (size!747 (buf!1074 (_2!1597 lt!39188))))))))

(declare-fun b!27651 () Bool)

(declare-fun res!23948 () Bool)

(assert (=> b!27651 (=> res!23948 e!18676)))

(assert (=> b!27651 (= res!23948 (not (invariant!0 (currentBit!2394 (_2!1597 lt!39179)) (currentByte!2399 (_2!1597 lt!39179)) (size!747 (buf!1074 (_2!1597 lt!39188))))))))

(declare-fun res!23934 () Bool)

(assert (=> start!5992 (=> (not res!23934) (not e!18666))))

(assert (=> start!5992 (= res!23934 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!747 srcBuffer!2))))))))

(assert (=> start!5992 e!18666))

(assert (=> start!5992 true))

(assert (=> start!5992 (array_inv!716 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1326) Bool)

(assert (=> start!5992 (and (inv!12 thiss!1379) e!18674)))

(declare-fun b!27662 () Bool)

(declare-fun e!18670 () Bool)

(assert (=> b!27662 (= e!18670 e!18669)))

(declare-fun res!23935 () Bool)

(assert (=> b!27662 (=> res!23935 e!18669)))

(declare-fun lt!39175 () (_ BitVec 64))

(assert (=> b!27662 (= res!23935 (not (= lt!39175 (bvsub (bvadd lt!39177 to!314) i!635))))))

(assert (=> b!27662 (= lt!39175 (bitIndex!0 (size!747 (buf!1074 (_2!1597 lt!39188))) (currentByte!2399 (_2!1597 lt!39188)) (currentBit!2394 (_2!1597 lt!39188))))))

(declare-fun b!27663 () Bool)

(declare-fun e!18667 () Bool)

(assert (=> b!27663 (= e!18667 (= lt!39175 (bvsub (bvsub (bvadd (bitIndex!0 (size!747 (buf!1074 (_2!1597 lt!39179))) (currentByte!2399 (_2!1597 lt!39179)) (currentBit!2394 (_2!1597 lt!39179))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27664 () Bool)

(declare-fun e!18668 () Bool)

(assert (=> b!27664 (= e!18668 e!18670)))

(declare-fun res!23937 () Bool)

(assert (=> b!27664 (=> res!23937 e!18670)))

(assert (=> b!27664 (= res!23937 (not (isPrefixOf!0 (_2!1597 lt!39179) (_2!1597 lt!39188))))))

(assert (=> b!27664 (isPrefixOf!0 thiss!1379 (_2!1597 lt!39188))))

(declare-fun lt!39182 () Unit!2197)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1326 BitStream!1326 BitStream!1326) Unit!2197)

(assert (=> b!27664 (= lt!39182 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1597 lt!39179) (_2!1597 lt!39188)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1326 array!1729 (_ BitVec 64) (_ BitVec 64)) tuple2!3020)

(assert (=> b!27664 (= lt!39188 (appendBitsMSBFirstLoop!0 (_2!1597 lt!39179) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!27664 e!18672))

(declare-fun res!23946 () Bool)

(assert (=> b!27664 (=> (not res!23946) (not e!18672))))

(assert (=> b!27664 (= res!23946 (validate_offset_bits!1 ((_ sign_extend 32) (size!747 (buf!1074 (_2!1597 lt!39179)))) ((_ sign_extend 32) (currentByte!2399 thiss!1379)) ((_ sign_extend 32) (currentBit!2394 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39178 () Unit!2197)

(assert (=> b!27664 (= lt!39178 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1074 (_2!1597 lt!39179)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!27664 (= lt!39189 (reader!0 thiss!1379 (_2!1597 lt!39179)))))

(declare-fun b!27665 () Bool)

(declare-fun res!23944 () Bool)

(assert (=> b!27665 (=> res!23944 e!18675)))

(assert (=> b!27665 (= res!23944 (or (not (= (buf!1074 (_1!1596 lt!39181)) (buf!1074 (_1!1596 lt!39180)))) (not (= (buf!1074 (_1!1596 lt!39181)) (buf!1074 (_2!1597 lt!39188)))) (bvsge lt!39175 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27666 () Bool)

(assert (=> b!27666 (= e!18669 e!18676)))

(declare-fun res!23949 () Bool)

(assert (=> b!27666 (=> res!23949 e!18676)))

(assert (=> b!27666 (= res!23949 (not (= (size!747 (buf!1074 (_2!1597 lt!39179))) (size!747 (buf!1074 (_2!1597 lt!39188))))))))

(assert (=> b!27666 e!18667))

(declare-fun res!23938 () Bool)

(assert (=> b!27666 (=> (not res!23938) (not e!18667))))

(assert (=> b!27666 (= res!23938 (= (size!747 (buf!1074 (_2!1597 lt!39188))) (size!747 (buf!1074 thiss!1379))))))

(declare-fun b!27667 () Bool)

(assert (=> b!27667 (= e!18665 e!18668)))

(declare-fun res!23936 () Bool)

(assert (=> b!27667 (=> res!23936 e!18668)))

(assert (=> b!27667 (= res!23936 (not (isPrefixOf!0 thiss!1379 (_2!1597 lt!39179))))))

(assert (=> b!27667 (validate_offset_bits!1 ((_ sign_extend 32) (size!747 (buf!1074 (_2!1597 lt!39179)))) ((_ sign_extend 32) (currentByte!2399 (_2!1597 lt!39179))) ((_ sign_extend 32) (currentBit!2394 (_2!1597 lt!39179))) lt!39174)))

(assert (=> b!27667 (= lt!39174 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39184 () Unit!2197)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1326 BitStream!1326 (_ BitVec 64) (_ BitVec 64)) Unit!2197)

(assert (=> b!27667 (= lt!39184 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1597 lt!39179) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1326 (_ BitVec 8) (_ BitVec 32)) tuple2!3020)

(assert (=> b!27667 (= lt!39179 (appendBitFromByte!0 thiss!1379 (select (arr!1209 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5992 res!23934) b!27658))

(assert (= (and b!27658 res!23945) b!27659))

(assert (= (and b!27659 (not res!23952)) b!27667))

(assert (= (and b!27667 (not res!23936)) b!27664))

(assert (= (and b!27664 res!23946) b!27657))

(assert (= (and b!27664 (not res!23937)) b!27662))

(assert (= (and b!27662 (not res!23935)) b!27661))

(assert (= (and b!27661 (not res!23950)) b!27655))

(assert (= (and b!27655 (not res!23947)) b!27666))

(assert (= (and b!27666 res!23938) b!27663))

(assert (= (and b!27666 (not res!23949)) b!27650))

(assert (= (and b!27650 (not res!23940)) b!27651))

(assert (= (and b!27651 (not res!23948)) b!27654))

(assert (= (and b!27654 (not res!23941)) b!27656))

(assert (= (and b!27656 (not res!23939)) b!27652))

(assert (= (and b!27652 (not res!23942)) b!27660))

(assert (= (and b!27660 (not res!23943)) b!27653))

(assert (= (and b!27653 (not res!23951)) b!27665))

(assert (= (and b!27665 (not res!23944)) b!27648))

(assert (= start!5992 b!27649))

(declare-fun m!39609 () Bool)

(assert (=> b!27652 m!39609))

(declare-fun m!39611 () Bool)

(assert (=> b!27649 m!39611))

(declare-fun m!39613 () Bool)

(assert (=> b!27659 m!39613))

(declare-fun m!39615 () Bool)

(assert (=> b!27659 m!39615))

(declare-fun m!39617 () Bool)

(assert (=> b!27659 m!39617))

(declare-fun m!39619 () Bool)

(assert (=> b!27656 m!39619))

(declare-fun m!39621 () Bool)

(assert (=> b!27663 m!39621))

(declare-fun m!39623 () Bool)

(assert (=> b!27657 m!39623))

(assert (=> b!27657 m!39623))

(declare-fun m!39625 () Bool)

(assert (=> b!27657 m!39625))

(declare-fun m!39627 () Bool)

(assert (=> b!27657 m!39627))

(assert (=> b!27657 m!39627))

(declare-fun m!39629 () Bool)

(assert (=> b!27657 m!39629))

(declare-fun m!39631 () Bool)

(assert (=> b!27653 m!39631))

(declare-fun m!39633 () Bool)

(assert (=> b!27648 m!39633))

(declare-fun m!39635 () Bool)

(assert (=> b!27648 m!39635))

(declare-fun m!39637 () Bool)

(assert (=> b!27664 m!39637))

(declare-fun m!39639 () Bool)

(assert (=> b!27664 m!39639))

(declare-fun m!39641 () Bool)

(assert (=> b!27664 m!39641))

(declare-fun m!39643 () Bool)

(assert (=> b!27664 m!39643))

(declare-fun m!39645 () Bool)

(assert (=> b!27664 m!39645))

(declare-fun m!39647 () Bool)

(assert (=> b!27664 m!39647))

(declare-fun m!39649 () Bool)

(assert (=> b!27664 m!39649))

(declare-fun m!39651 () Bool)

(assert (=> b!27662 m!39651))

(declare-fun m!39653 () Bool)

(assert (=> b!27650 m!39653))

(declare-fun m!39655 () Bool)

(assert (=> b!27654 m!39655))

(declare-fun m!39657 () Bool)

(assert (=> b!27654 m!39657))

(declare-fun m!39659 () Bool)

(assert (=> b!27654 m!39659))

(declare-fun m!39661 () Bool)

(assert (=> b!27654 m!39661))

(declare-fun m!39663 () Bool)

(assert (=> b!27654 m!39663))

(declare-fun m!39665 () Bool)

(assert (=> b!27654 m!39665))

(declare-fun m!39667 () Bool)

(assert (=> b!27654 m!39667))

(declare-fun m!39669 () Bool)

(assert (=> b!27654 m!39669))

(declare-fun m!39671 () Bool)

(assert (=> b!27661 m!39671))

(declare-fun m!39673 () Bool)

(assert (=> b!27651 m!39673))

(declare-fun m!39675 () Bool)

(assert (=> b!27660 m!39675))

(declare-fun m!39677 () Bool)

(assert (=> b!27667 m!39677))

(declare-fun m!39679 () Bool)

(assert (=> b!27667 m!39679))

(declare-fun m!39681 () Bool)

(assert (=> b!27667 m!39681))

(declare-fun m!39683 () Bool)

(assert (=> b!27667 m!39683))

(declare-fun m!39685 () Bool)

(assert (=> b!27667 m!39685))

(assert (=> b!27667 m!39681))

(declare-fun m!39687 () Bool)

(assert (=> b!27658 m!39687))

(declare-fun m!39689 () Bool)

(assert (=> start!5992 m!39689))

(declare-fun m!39691 () Bool)

(assert (=> start!5992 m!39691))

(check-sat (not b!27662) (not b!27654) (not b!27649) (not b!27659) (not b!27667) (not b!27652) (not start!5992) (not b!27661) (not b!27656) (not b!27650) (not b!27653) (not b!27664) (not b!27660) (not b!27663) (not b!27658) (not b!27648) (not b!27657) (not b!27651))
