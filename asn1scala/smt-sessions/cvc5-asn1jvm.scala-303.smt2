; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5990 () Bool)

(assert start!5990)

(declare-fun b!27588 () Bool)

(declare-fun e!18630 () Bool)

(assert (=> b!27588 (= e!18630 true)))

(declare-fun lt!39122 () (_ BitVec 64))

(declare-datatypes ((array!1727 0))(
  ( (array!1728 (arr!1208 (Array (_ BitVec 32) (_ BitVec 8))) (size!746 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1324 0))(
  ( (BitStream!1325 (buf!1073 array!1727) (currentByte!2398 (_ BitVec 32)) (currentBit!2393 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3014 0))(
  ( (tuple2!3015 (_1!1594 BitStream!1324) (_2!1594 BitStream!1324)) )
))
(declare-fun lt!39127 () tuple2!3014)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27588 (= lt!39122 (bitIndex!0 (size!746 (buf!1073 (_1!1594 lt!39127))) (currentByte!2398 (_1!1594 lt!39127)) (currentBit!2393 (_1!1594 lt!39127))))))

(declare-fun lt!39124 () (_ BitVec 64))

(declare-fun lt!39133 () tuple2!3014)

(assert (=> b!27588 (= lt!39124 (bitIndex!0 (size!746 (buf!1073 (_1!1594 lt!39133))) (currentByte!2398 (_1!1594 lt!39133)) (currentBit!2393 (_1!1594 lt!39133))))))

(declare-fun b!27589 () Bool)

(declare-fun res!23885 () Bool)

(declare-fun e!18635 () Bool)

(assert (=> b!27589 (=> (not res!23885) (not e!18635))))

(declare-fun thiss!1379 () BitStream!1324)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27589 (= res!23885 (validate_offset_bits!1 ((_ sign_extend 32) (size!746 (buf!1073 thiss!1379))) ((_ sign_extend 32) (currentByte!2398 thiss!1379)) ((_ sign_extend 32) (currentBit!2393 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27590 () Bool)

(declare-fun e!18629 () Bool)

(declare-fun e!18638 () Bool)

(assert (=> b!27590 (= e!18629 e!18638)))

(declare-fun res!23892 () Bool)

(assert (=> b!27590 (=> res!23892 e!18638)))

(declare-datatypes ((Unit!2195 0))(
  ( (Unit!2196) )
))
(declare-datatypes ((tuple2!3016 0))(
  ( (tuple2!3017 (_1!1595 Unit!2195) (_2!1595 BitStream!1324)) )
))
(declare-fun lt!39135 () tuple2!3016)

(declare-fun lt!39119 () tuple2!3016)

(declare-fun isPrefixOf!0 (BitStream!1324 BitStream!1324) Bool)

(assert (=> b!27590 (= res!23892 (not (isPrefixOf!0 (_2!1595 lt!39135) (_2!1595 lt!39119))))))

(assert (=> b!27590 (isPrefixOf!0 thiss!1379 (_2!1595 lt!39119))))

(declare-fun lt!39132 () Unit!2195)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1324 BitStream!1324 BitStream!1324) Unit!2195)

(assert (=> b!27590 (= lt!39132 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1595 lt!39135) (_2!1595 lt!39119)))))

(declare-fun srcBuffer!2 () array!1727)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1324 array!1727 (_ BitVec 64) (_ BitVec 64)) tuple2!3016)

(assert (=> b!27590 (= lt!39119 (appendBitsMSBFirstLoop!0 (_2!1595 lt!39135) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18633 () Bool)

(assert (=> b!27590 e!18633))

(declare-fun res!23882 () Bool)

(assert (=> b!27590 (=> (not res!23882) (not e!18633))))

(assert (=> b!27590 (= res!23882 (validate_offset_bits!1 ((_ sign_extend 32) (size!746 (buf!1073 (_2!1595 lt!39135)))) ((_ sign_extend 32) (currentByte!2398 thiss!1379)) ((_ sign_extend 32) (currentBit!2393 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39123 () Unit!2195)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1324 array!1727 (_ BitVec 64)) Unit!2195)

(assert (=> b!27590 (= lt!39123 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1073 (_2!1595 lt!39135)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39131 () tuple2!3014)

(declare-fun reader!0 (BitStream!1324 BitStream!1324) tuple2!3014)

(assert (=> b!27590 (= lt!39131 (reader!0 thiss!1379 (_2!1595 lt!39135)))))

(declare-fun b!27591 () Bool)

(declare-fun res!23877 () Bool)

(assert (=> b!27591 (=> res!23877 e!18630)))

(assert (=> b!27591 (= res!23877 (not (isPrefixOf!0 (_1!1594 lt!39133) (_2!1595 lt!39119))))))

(declare-fun b!27592 () Bool)

(declare-fun res!23878 () Bool)

(assert (=> b!27592 (=> res!23878 e!18630)))

(declare-fun lt!39136 () (_ BitVec 64))

(assert (=> b!27592 (= res!23878 (or (not (= (buf!1073 (_1!1594 lt!39133)) (buf!1073 (_1!1594 lt!39127)))) (not (= (buf!1073 (_1!1594 lt!39133)) (buf!1073 (_2!1595 lt!39119)))) (bvsge lt!39136 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27593 () Bool)

(declare-fun res!23893 () Bool)

(assert (=> b!27593 (=> res!23893 e!18630)))

(assert (=> b!27593 (= res!23893 (not (isPrefixOf!0 (_1!1594 lt!39127) (_2!1595 lt!39119))))))

(declare-fun res!23881 () Bool)

(assert (=> start!5990 (=> (not res!23881) (not e!18635))))

(assert (=> start!5990 (= res!23881 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!746 srcBuffer!2))))))))

(assert (=> start!5990 e!18635))

(assert (=> start!5990 true))

(declare-fun array_inv!715 (array!1727) Bool)

(assert (=> start!5990 (array_inv!715 srcBuffer!2)))

(declare-fun e!18632 () Bool)

(declare-fun inv!12 (BitStream!1324) Bool)

(assert (=> start!5990 (and (inv!12 thiss!1379) e!18632)))

(declare-fun b!27594 () Bool)

(declare-fun e!18636 () Bool)

(assert (=> b!27594 (= e!18638 e!18636)))

(declare-fun res!23879 () Bool)

(assert (=> b!27594 (=> res!23879 e!18636)))

(declare-fun lt!39130 () (_ BitVec 64))

(assert (=> b!27594 (= res!23879 (not (= lt!39136 (bvsub (bvadd lt!39130 to!314) i!635))))))

(assert (=> b!27594 (= lt!39136 (bitIndex!0 (size!746 (buf!1073 (_2!1595 lt!39119))) (currentByte!2398 (_2!1595 lt!39119)) (currentBit!2393 (_2!1595 lt!39119))))))

(declare-fun b!27595 () Bool)

(declare-fun e!18637 () Bool)

(assert (=> b!27595 (= e!18637 e!18630)))

(declare-fun res!23886 () Bool)

(assert (=> b!27595 (=> res!23886 e!18630)))

(assert (=> b!27595 (= res!23886 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!39125 () (_ BitVec 64))

(declare-datatypes ((List!363 0))(
  ( (Nil!360) (Cons!359 (h!478 Bool) (t!1113 List!363)) )
))
(declare-fun lt!39120 () List!363)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1324 BitStream!1324 (_ BitVec 64)) List!363)

(assert (=> b!27595 (= lt!39120 (bitStreamReadBitsIntoList!0 (_2!1595 lt!39119) (_1!1594 lt!39127) lt!39125))))

(declare-fun lt!39129 () List!363)

(assert (=> b!27595 (= lt!39129 (bitStreamReadBitsIntoList!0 (_2!1595 lt!39119) (_1!1594 lt!39133) (bvsub to!314 i!635)))))

(assert (=> b!27595 (validate_offset_bits!1 ((_ sign_extend 32) (size!746 (buf!1073 (_2!1595 lt!39119)))) ((_ sign_extend 32) (currentByte!2398 (_2!1595 lt!39135))) ((_ sign_extend 32) (currentBit!2393 (_2!1595 lt!39135))) lt!39125)))

(declare-fun lt!39121 () Unit!2195)

(assert (=> b!27595 (= lt!39121 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1595 lt!39135) (buf!1073 (_2!1595 lt!39119)) lt!39125))))

(assert (=> b!27595 (= lt!39127 (reader!0 (_2!1595 lt!39135) (_2!1595 lt!39119)))))

(assert (=> b!27595 (validate_offset_bits!1 ((_ sign_extend 32) (size!746 (buf!1073 (_2!1595 lt!39119)))) ((_ sign_extend 32) (currentByte!2398 thiss!1379)) ((_ sign_extend 32) (currentBit!2393 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39134 () Unit!2195)

(assert (=> b!27595 (= lt!39134 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1073 (_2!1595 lt!39119)) (bvsub to!314 i!635)))))

(assert (=> b!27595 (= lt!39133 (reader!0 thiss!1379 (_2!1595 lt!39119)))))

(declare-fun b!27596 () Bool)

(declare-fun res!23890 () Bool)

(assert (=> b!27596 (=> res!23890 e!18636)))

(assert (=> b!27596 (= res!23890 (not (= (size!746 (buf!1073 thiss!1379)) (size!746 (buf!1073 (_2!1595 lt!39119))))))))

(declare-fun b!27597 () Bool)

(assert (=> b!27597 (= e!18636 e!18637)))

(declare-fun res!23884 () Bool)

(assert (=> b!27597 (=> res!23884 e!18637)))

(assert (=> b!27597 (= res!23884 (not (= (size!746 (buf!1073 (_2!1595 lt!39135))) (size!746 (buf!1073 (_2!1595 lt!39119))))))))

(declare-fun e!18634 () Bool)

(assert (=> b!27597 e!18634))

(declare-fun res!23887 () Bool)

(assert (=> b!27597 (=> (not res!23887) (not e!18634))))

(assert (=> b!27597 (= res!23887 (= (size!746 (buf!1073 (_2!1595 lt!39119))) (size!746 (buf!1073 thiss!1379))))))

(declare-fun b!27598 () Bool)

(assert (=> b!27598 (= e!18632 (array_inv!715 (buf!1073 thiss!1379)))))

(declare-fun b!27599 () Bool)

(declare-fun res!23880 () Bool)

(assert (=> b!27599 (=> res!23880 e!18630)))

(assert (=> b!27599 (= res!23880 (not (isPrefixOf!0 (_1!1594 lt!39133) (_1!1594 lt!39127))))))

(declare-fun b!27600 () Bool)

(declare-fun res!23894 () Bool)

(assert (=> b!27600 (=> res!23894 e!18636)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27600 (= res!23894 (not (invariant!0 (currentBit!2393 (_2!1595 lt!39119)) (currentByte!2398 (_2!1595 lt!39119)) (size!746 (buf!1073 (_2!1595 lt!39119))))))))

(declare-fun b!27601 () Bool)

(declare-fun e!18639 () Bool)

(assert (=> b!27601 (= e!18635 (not e!18639))))

(declare-fun res!23883 () Bool)

(assert (=> b!27601 (=> res!23883 e!18639)))

(assert (=> b!27601 (= res!23883 (bvsge i!635 to!314))))

(assert (=> b!27601 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39126 () Unit!2195)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1324) Unit!2195)

(assert (=> b!27601 (= lt!39126 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!27601 (= lt!39130 (bitIndex!0 (size!746 (buf!1073 thiss!1379)) (currentByte!2398 thiss!1379) (currentBit!2393 thiss!1379)))))

(declare-fun b!27602 () Bool)

(assert (=> b!27602 (= e!18634 (= lt!39136 (bvsub (bvsub (bvadd (bitIndex!0 (size!746 (buf!1073 (_2!1595 lt!39135))) (currentByte!2398 (_2!1595 lt!39135)) (currentBit!2393 (_2!1595 lt!39135))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27603 () Bool)

(declare-fun head!200 (List!363) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1324 array!1727 (_ BitVec 64) (_ BitVec 64)) List!363)

(assert (=> b!27603 (= e!18633 (= (head!200 (byteArrayBitContentToList!0 (_2!1595 lt!39135) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!200 (bitStreamReadBitsIntoList!0 (_2!1595 lt!39135) (_1!1594 lt!39131) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27604 () Bool)

(declare-fun res!23895 () Bool)

(assert (=> b!27604 (=> res!23895 e!18637)))

(assert (=> b!27604 (= res!23895 (not (invariant!0 (currentBit!2393 (_2!1595 lt!39135)) (currentByte!2398 (_2!1595 lt!39135)) (size!746 (buf!1073 (_2!1595 lt!39119))))))))

(declare-fun b!27605 () Bool)

(declare-fun res!23889 () Bool)

(assert (=> b!27605 (=> res!23889 e!18637)))

(assert (=> b!27605 (= res!23889 (not (invariant!0 (currentBit!2393 (_2!1595 lt!39135)) (currentByte!2398 (_2!1595 lt!39135)) (size!746 (buf!1073 (_2!1595 lt!39135))))))))

(declare-fun b!27606 () Bool)

(assert (=> b!27606 (= e!18639 e!18629)))

(declare-fun res!23891 () Bool)

(assert (=> b!27606 (=> res!23891 e!18629)))

(assert (=> b!27606 (= res!23891 (not (isPrefixOf!0 thiss!1379 (_2!1595 lt!39135))))))

(assert (=> b!27606 (validate_offset_bits!1 ((_ sign_extend 32) (size!746 (buf!1073 (_2!1595 lt!39135)))) ((_ sign_extend 32) (currentByte!2398 (_2!1595 lt!39135))) ((_ sign_extend 32) (currentBit!2393 (_2!1595 lt!39135))) lt!39125)))

(assert (=> b!27606 (= lt!39125 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39128 () Unit!2195)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1324 BitStream!1324 (_ BitVec 64) (_ BitVec 64)) Unit!2195)

(assert (=> b!27606 (= lt!39128 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1595 lt!39135) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1324 (_ BitVec 8) (_ BitVec 32)) tuple2!3016)

(assert (=> b!27606 (= lt!39135 (appendBitFromByte!0 thiss!1379 (select (arr!1208 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27607 () Bool)

(declare-fun res!23888 () Bool)

(assert (=> b!27607 (=> res!23888 e!18630)))

(declare-fun length!89 (List!363) Int)

(assert (=> b!27607 (= res!23888 (<= (length!89 lt!39129) 0))))

(assert (= (and start!5990 res!23881) b!27589))

(assert (= (and b!27589 res!23885) b!27601))

(assert (= (and b!27601 (not res!23883)) b!27606))

(assert (= (and b!27606 (not res!23891)) b!27590))

(assert (= (and b!27590 res!23882) b!27603))

(assert (= (and b!27590 (not res!23892)) b!27594))

(assert (= (and b!27594 (not res!23879)) b!27600))

(assert (= (and b!27600 (not res!23894)) b!27596))

(assert (= (and b!27596 (not res!23890)) b!27597))

(assert (= (and b!27597 res!23887) b!27602))

(assert (= (and b!27597 (not res!23884)) b!27605))

(assert (= (and b!27605 (not res!23889)) b!27604))

(assert (= (and b!27604 (not res!23895)) b!27595))

(assert (= (and b!27595 (not res!23886)) b!27607))

(assert (= (and b!27607 (not res!23888)) b!27591))

(assert (= (and b!27591 (not res!23877)) b!27593))

(assert (= (and b!27593 (not res!23893)) b!27599))

(assert (= (and b!27599 (not res!23880)) b!27592))

(assert (= (and b!27592 (not res!23878)) b!27588))

(assert (= start!5990 b!27598))

(declare-fun m!39525 () Bool)

(assert (=> b!27605 m!39525))

(declare-fun m!39527 () Bool)

(assert (=> b!27606 m!39527))

(declare-fun m!39529 () Bool)

(assert (=> b!27606 m!39529))

(declare-fun m!39531 () Bool)

(assert (=> b!27606 m!39531))

(declare-fun m!39533 () Bool)

(assert (=> b!27606 m!39533))

(assert (=> b!27606 m!39531))

(declare-fun m!39535 () Bool)

(assert (=> b!27606 m!39535))

(declare-fun m!39537 () Bool)

(assert (=> b!27595 m!39537))

(declare-fun m!39539 () Bool)

(assert (=> b!27595 m!39539))

(declare-fun m!39541 () Bool)

(assert (=> b!27595 m!39541))

(declare-fun m!39543 () Bool)

(assert (=> b!27595 m!39543))

(declare-fun m!39545 () Bool)

(assert (=> b!27595 m!39545))

(declare-fun m!39547 () Bool)

(assert (=> b!27595 m!39547))

(declare-fun m!39549 () Bool)

(assert (=> b!27595 m!39549))

(declare-fun m!39551 () Bool)

(assert (=> b!27595 m!39551))

(declare-fun m!39553 () Bool)

(assert (=> b!27590 m!39553))

(declare-fun m!39555 () Bool)

(assert (=> b!27590 m!39555))

(declare-fun m!39557 () Bool)

(assert (=> b!27590 m!39557))

(declare-fun m!39559 () Bool)

(assert (=> b!27590 m!39559))

(declare-fun m!39561 () Bool)

(assert (=> b!27590 m!39561))

(declare-fun m!39563 () Bool)

(assert (=> b!27590 m!39563))

(declare-fun m!39565 () Bool)

(assert (=> b!27590 m!39565))

(declare-fun m!39567 () Bool)

(assert (=> b!27591 m!39567))

(declare-fun m!39569 () Bool)

(assert (=> b!27599 m!39569))

(declare-fun m!39571 () Bool)

(assert (=> b!27593 m!39571))

(declare-fun m!39573 () Bool)

(assert (=> b!27603 m!39573))

(assert (=> b!27603 m!39573))

(declare-fun m!39575 () Bool)

(assert (=> b!27603 m!39575))

(declare-fun m!39577 () Bool)

(assert (=> b!27603 m!39577))

(assert (=> b!27603 m!39577))

(declare-fun m!39579 () Bool)

(assert (=> b!27603 m!39579))

(declare-fun m!39581 () Bool)

(assert (=> b!27600 m!39581))

(declare-fun m!39583 () Bool)

(assert (=> b!27601 m!39583))

(declare-fun m!39585 () Bool)

(assert (=> b!27601 m!39585))

(declare-fun m!39587 () Bool)

(assert (=> b!27601 m!39587))

(declare-fun m!39589 () Bool)

(assert (=> b!27598 m!39589))

(declare-fun m!39591 () Bool)

(assert (=> b!27602 m!39591))

(declare-fun m!39593 () Bool)

(assert (=> b!27588 m!39593))

(declare-fun m!39595 () Bool)

(assert (=> b!27588 m!39595))

(declare-fun m!39597 () Bool)

(assert (=> b!27604 m!39597))

(declare-fun m!39599 () Bool)

(assert (=> b!27607 m!39599))

(declare-fun m!39601 () Bool)

(assert (=> b!27589 m!39601))

(declare-fun m!39603 () Bool)

(assert (=> start!5990 m!39603))

(declare-fun m!39605 () Bool)

(assert (=> start!5990 m!39605))

(declare-fun m!39607 () Bool)

(assert (=> b!27594 m!39607))

(push 1)

