; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9638 () Bool)

(assert start!9638)

(declare-fun b!48142 () Bool)

(declare-fun e!31896 () Bool)

(declare-fun e!31890 () Bool)

(assert (=> b!48142 (= e!31896 e!31890)))

(declare-fun res!40472 () Bool)

(assert (=> b!48142 (=> res!40472 e!31890)))

(declare-datatypes ((array!2302 0))(
  ( (array!2303 (arr!1565 (Array (_ BitVec 32) (_ BitVec 8))) (size!1042 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1810 0))(
  ( (BitStream!1811 (buf!1394 array!2302) (currentByte!2905 (_ BitVec 32)) (currentBit!2900 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3378 0))(
  ( (Unit!3379) )
))
(declare-datatypes ((tuple2!4560 0))(
  ( (tuple2!4561 (_1!2379 Unit!3378) (_2!2379 BitStream!1810)) )
))
(declare-fun lt!74519 () tuple2!4560)

(declare-fun lt!74522 () tuple2!4560)

(assert (=> b!48142 (= res!40472 (not (= (size!1042 (buf!1394 (_2!2379 lt!74519))) (size!1042 (buf!1394 (_2!2379 lt!74522))))))))

(declare-fun e!31901 () Bool)

(assert (=> b!48142 e!31901))

(declare-fun res!40466 () Bool)

(assert (=> b!48142 (=> (not res!40466) (not e!31901))))

(declare-fun thiss!1379 () BitStream!1810)

(assert (=> b!48142 (= res!40466 (= (size!1042 (buf!1394 (_2!2379 lt!74522))) (size!1042 (buf!1394 thiss!1379))))))

(declare-fun res!40471 () Bool)

(declare-fun e!31894 () Bool)

(assert (=> start!9638 (=> (not res!40471) (not e!31894))))

(declare-fun srcBuffer!2 () array!2302)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!9638 (= res!40471 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1042 srcBuffer!2))))))))

(assert (=> start!9638 e!31894))

(assert (=> start!9638 true))

(declare-fun array_inv!958 (array!2302) Bool)

(assert (=> start!9638 (array_inv!958 srcBuffer!2)))

(declare-fun e!31898 () Bool)

(declare-fun inv!12 (BitStream!1810) Bool)

(assert (=> start!9638 (and (inv!12 thiss!1379) e!31898)))

(declare-fun b!48143 () Bool)

(declare-fun res!40476 () Bool)

(assert (=> b!48143 (=> res!40476 e!31890)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!48143 (= res!40476 (not (invariant!0 (currentBit!2900 (_2!2379 lt!74519)) (currentByte!2905 (_2!2379 lt!74519)) (size!1042 (buf!1394 (_2!2379 lt!74519))))))))

(declare-fun b!48144 () Bool)

(assert (=> b!48144 (= e!31898 (array_inv!958 (buf!1394 thiss!1379)))))

(declare-fun b!48145 () Bool)

(declare-fun res!40473 () Bool)

(declare-fun e!31892 () Bool)

(assert (=> b!48145 (=> res!40473 e!31892)))

(declare-datatypes ((List!546 0))(
  ( (Nil!543) (Cons!542 (h!661 Bool) (t!1296 List!546)) )
))
(declare-fun lt!74521 () List!546)

(declare-fun lt!74529 () Bool)

(declare-fun head!365 (List!546) Bool)

(assert (=> b!48145 (= res!40473 (not (= (head!365 lt!74521) lt!74529)))))

(declare-fun b!48146 () Bool)

(declare-fun res!40481 () Bool)

(assert (=> b!48146 (=> res!40481 e!31890)))

(assert (=> b!48146 (= res!40481 (not (invariant!0 (currentBit!2900 (_2!2379 lt!74519)) (currentByte!2905 (_2!2379 lt!74519)) (size!1042 (buf!1394 (_2!2379 lt!74522))))))))

(declare-fun lt!74528 () (_ BitVec 64))

(declare-fun b!48147 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!48147 (= e!31901 (= lt!74528 (bvsub (bvsub (bvadd (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48148 () Bool)

(declare-fun e!31895 () Bool)

(assert (=> b!48148 (= e!31895 e!31892)))

(declare-fun res!40465 () Bool)

(assert (=> b!48148 (=> res!40465 e!31892)))

(declare-fun lt!74514 () (_ BitVec 64))

(declare-datatypes ((tuple2!4562 0))(
  ( (tuple2!4563 (_1!2380 BitStream!1810) (_2!2380 BitStream!1810)) )
))
(declare-fun lt!74518 () tuple2!4562)

(declare-fun bitAt!0 (array!2302 (_ BitVec 64)) Bool)

(assert (=> b!48148 (= res!40465 (not (= lt!74529 (bitAt!0 (buf!1394 (_1!2380 lt!74518)) lt!74514))))))

(declare-fun lt!74523 () tuple2!4562)

(assert (=> b!48148 (= lt!74529 (bitAt!0 (buf!1394 (_1!2380 lt!74523)) lt!74514))))

(declare-fun b!48149 () Bool)

(declare-fun e!31893 () Bool)

(assert (=> b!48149 (= e!31893 e!31896)))

(declare-fun res!40474 () Bool)

(assert (=> b!48149 (=> res!40474 e!31896)))

(assert (=> b!48149 (= res!40474 (not (= lt!74528 (bvsub (bvadd lt!74514 to!314) i!635))))))

(assert (=> b!48149 (= lt!74528 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74522))) (currentByte!2905 (_2!2379 lt!74522)) (currentBit!2900 (_2!2379 lt!74522))))))

(declare-fun b!48150 () Bool)

(declare-fun res!40468 () Bool)

(assert (=> b!48150 (=> res!40468 e!31896)))

(assert (=> b!48150 (= res!40468 (not (invariant!0 (currentBit!2900 (_2!2379 lt!74522)) (currentByte!2905 (_2!2379 lt!74522)) (size!1042 (buf!1394 (_2!2379 lt!74522))))))))

(declare-fun e!31900 () Bool)

(declare-fun b!48151 () Bool)

(declare-fun lt!74516 () tuple2!4562)

(declare-fun byteArrayBitContentToList!0 (BitStream!1810 array!2302 (_ BitVec 64) (_ BitVec 64)) List!546)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1810 BitStream!1810 (_ BitVec 64)) List!546)

(assert (=> b!48151 (= e!31900 (= (head!365 (byteArrayBitContentToList!0 (_2!2379 lt!74519) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!365 (bitStreamReadBitsIntoList!0 (_2!2379 lt!74519) (_1!2380 lt!74516) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!48152 () Bool)

(declare-fun e!31899 () Bool)

(assert (=> b!48152 (= e!31890 e!31899)))

(declare-fun res!40470 () Bool)

(assert (=> b!48152 (=> res!40470 e!31899)))

(assert (=> b!48152 (= res!40470 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!74515 () List!546)

(declare-fun lt!74527 () (_ BitVec 64))

(assert (=> b!48152 (= lt!74515 (bitStreamReadBitsIntoList!0 (_2!2379 lt!74522) (_1!2380 lt!74518) lt!74527))))

(assert (=> b!48152 (= lt!74521 (bitStreamReadBitsIntoList!0 (_2!2379 lt!74522) (_1!2380 lt!74523) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48152 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) lt!74527)))

(declare-fun lt!74530 () Unit!3378)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1810 array!2302 (_ BitVec 64)) Unit!3378)

(assert (=> b!48152 (= lt!74530 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2379 lt!74519) (buf!1394 (_2!2379 lt!74522)) lt!74527))))

(declare-fun reader!0 (BitStream!1810 BitStream!1810) tuple2!4562)

(assert (=> b!48152 (= lt!74518 (reader!0 (_2!2379 lt!74519) (_2!2379 lt!74522)))))

(assert (=> b!48152 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!74524 () Unit!3378)

(assert (=> b!48152 (= lt!74524 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1394 (_2!2379 lt!74522)) (bvsub to!314 i!635)))))

(assert (=> b!48152 (= lt!74523 (reader!0 thiss!1379 (_2!2379 lt!74522)))))

(declare-fun b!48153 () Bool)

(declare-fun e!31897 () Bool)

(assert (=> b!48153 (= e!31897 e!31893)))

(declare-fun res!40475 () Bool)

(assert (=> b!48153 (=> res!40475 e!31893)))

(declare-fun isPrefixOf!0 (BitStream!1810 BitStream!1810) Bool)

(assert (=> b!48153 (= res!40475 (not (isPrefixOf!0 (_2!2379 lt!74519) (_2!2379 lt!74522))))))

(assert (=> b!48153 (isPrefixOf!0 thiss!1379 (_2!2379 lt!74522))))

(declare-fun lt!74526 () Unit!3378)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1810 BitStream!1810 BitStream!1810) Unit!3378)

(assert (=> b!48153 (= lt!74526 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2379 lt!74519) (_2!2379 lt!74522)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1810 array!2302 (_ BitVec 64) (_ BitVec 64)) tuple2!4560)

(assert (=> b!48153 (= lt!74522 (appendBitsMSBFirstLoop!0 (_2!2379 lt!74519) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!48153 e!31900))

(declare-fun res!40482 () Bool)

(assert (=> b!48153 (=> (not res!40482) (not e!31900))))

(assert (=> b!48153 (= res!40482 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!74512 () Unit!3378)

(assert (=> b!48153 (= lt!74512 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1394 (_2!2379 lt!74519)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!48153 (= lt!74516 (reader!0 thiss!1379 (_2!2379 lt!74519)))))

(declare-fun b!48154 () Bool)

(declare-fun e!31888 () Bool)

(assert (=> b!48154 (= e!31888 e!31897)))

(declare-fun res!40467 () Bool)

(assert (=> b!48154 (=> res!40467 e!31897)))

(assert (=> b!48154 (= res!40467 (not (isPrefixOf!0 thiss!1379 (_2!2379 lt!74519))))))

(assert (=> b!48154 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) lt!74527)))

(assert (=> b!48154 (= lt!74527 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!74525 () Unit!3378)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1810 BitStream!1810 (_ BitVec 64) (_ BitVec 64)) Unit!3378)

(assert (=> b!48154 (= lt!74525 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2379 lt!74519) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1810 (_ BitVec 8) (_ BitVec 32)) tuple2!4560)

(assert (=> b!48154 (= lt!74519 (appendBitFromByte!0 thiss!1379 (select (arr!1565 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!48155 () Bool)

(declare-fun res!40469 () Bool)

(assert (=> b!48155 (=> res!40469 e!31899)))

(declare-fun length!241 (List!546) Int)

(assert (=> b!48155 (= res!40469 (<= (length!241 lt!74521) 0))))

(declare-fun b!48156 () Bool)

(declare-fun res!40478 () Bool)

(assert (=> b!48156 (=> (not res!40478) (not e!31894))))

(assert (=> b!48156 (= res!40478 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 thiss!1379))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!48157 () Bool)

(assert (=> b!48157 (= e!31899 e!31895)))

(declare-fun res!40479 () Bool)

(assert (=> b!48157 (=> res!40479 e!31895)))

(declare-fun lt!74513 () List!546)

(assert (=> b!48157 (= res!40479 (not (= lt!74513 lt!74515)))))

(assert (=> b!48157 (= lt!74515 lt!74513)))

(declare-fun tail!232 (List!546) List!546)

(assert (=> b!48157 (= lt!74513 (tail!232 lt!74521))))

(declare-fun lt!74520 () Unit!3378)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1810 BitStream!1810 BitStream!1810 BitStream!1810 (_ BitVec 64) List!546) Unit!3378)

(assert (=> b!48157 (= lt!74520 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2379 lt!74522) (_2!2379 lt!74522) (_1!2380 lt!74523) (_1!2380 lt!74518) (bvsub to!314 i!635) lt!74521))))

(declare-fun b!48158 () Bool)

(assert (=> b!48158 (= e!31892 (= (head!365 (byteArrayBitContentToList!0 (_2!2379 lt!74522) srcBuffer!2 i!635 (bvsub to!314 i!635))) (bitAt!0 srcBuffer!2 i!635)))))

(declare-fun b!48159 () Bool)

(assert (=> b!48159 (= e!31894 (not e!31888))))

(declare-fun res!40480 () Bool)

(assert (=> b!48159 (=> res!40480 e!31888)))

(assert (=> b!48159 (= res!40480 (bvsge i!635 to!314))))

(assert (=> b!48159 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!74517 () Unit!3378)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1810) Unit!3378)

(assert (=> b!48159 (= lt!74517 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!48159 (= lt!74514 (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)))))

(declare-fun b!48160 () Bool)

(declare-fun res!40477 () Bool)

(assert (=> b!48160 (=> res!40477 e!31896)))

(assert (=> b!48160 (= res!40477 (not (= (size!1042 (buf!1394 thiss!1379)) (size!1042 (buf!1394 (_2!2379 lt!74522))))))))

(assert (= (and start!9638 res!40471) b!48156))

(assert (= (and b!48156 res!40478) b!48159))

(assert (= (and b!48159 (not res!40480)) b!48154))

(assert (= (and b!48154 (not res!40467)) b!48153))

(assert (= (and b!48153 res!40482) b!48151))

(assert (= (and b!48153 (not res!40475)) b!48149))

(assert (= (and b!48149 (not res!40474)) b!48150))

(assert (= (and b!48150 (not res!40468)) b!48160))

(assert (= (and b!48160 (not res!40477)) b!48142))

(assert (= (and b!48142 res!40466) b!48147))

(assert (= (and b!48142 (not res!40472)) b!48143))

(assert (= (and b!48143 (not res!40476)) b!48146))

(assert (= (and b!48146 (not res!40481)) b!48152))

(assert (= (and b!48152 (not res!40470)) b!48155))

(assert (= (and b!48155 (not res!40469)) b!48157))

(assert (= (and b!48157 (not res!40479)) b!48148))

(assert (= (and b!48148 (not res!40465)) b!48145))

(assert (= (and b!48145 (not res!40473)) b!48158))

(assert (= start!9638 b!48144))

(declare-fun m!74729 () Bool)

(assert (=> b!48151 m!74729))

(assert (=> b!48151 m!74729))

(declare-fun m!74731 () Bool)

(assert (=> b!48151 m!74731))

(declare-fun m!74733 () Bool)

(assert (=> b!48151 m!74733))

(assert (=> b!48151 m!74733))

(declare-fun m!74735 () Bool)

(assert (=> b!48151 m!74735))

(declare-fun m!74737 () Bool)

(assert (=> b!48152 m!74737))

(declare-fun m!74739 () Bool)

(assert (=> b!48152 m!74739))

(declare-fun m!74741 () Bool)

(assert (=> b!48152 m!74741))

(declare-fun m!74743 () Bool)

(assert (=> b!48152 m!74743))

(declare-fun m!74745 () Bool)

(assert (=> b!48152 m!74745))

(declare-fun m!74747 () Bool)

(assert (=> b!48152 m!74747))

(declare-fun m!74749 () Bool)

(assert (=> b!48152 m!74749))

(declare-fun m!74751 () Bool)

(assert (=> b!48152 m!74751))

(declare-fun m!74753 () Bool)

(assert (=> b!48154 m!74753))

(declare-fun m!74755 () Bool)

(assert (=> b!48154 m!74755))

(declare-fun m!74757 () Bool)

(assert (=> b!48154 m!74757))

(declare-fun m!74759 () Bool)

(assert (=> b!48154 m!74759))

(assert (=> b!48154 m!74753))

(declare-fun m!74761 () Bool)

(assert (=> b!48154 m!74761))

(declare-fun m!74763 () Bool)

(assert (=> b!48157 m!74763))

(declare-fun m!74765 () Bool)

(assert (=> b!48157 m!74765))

(declare-fun m!74767 () Bool)

(assert (=> b!48148 m!74767))

(declare-fun m!74769 () Bool)

(assert (=> b!48148 m!74769))

(declare-fun m!74771 () Bool)

(assert (=> b!48145 m!74771))

(declare-fun m!74773 () Bool)

(assert (=> b!48146 m!74773))

(declare-fun m!74775 () Bool)

(assert (=> b!48144 m!74775))

(declare-fun m!74777 () Bool)

(assert (=> b!48155 m!74777))

(declare-fun m!74779 () Bool)

(assert (=> b!48159 m!74779))

(declare-fun m!74781 () Bool)

(assert (=> b!48159 m!74781))

(declare-fun m!74783 () Bool)

(assert (=> b!48159 m!74783))

(declare-fun m!74785 () Bool)

(assert (=> start!9638 m!74785))

(declare-fun m!74787 () Bool)

(assert (=> start!9638 m!74787))

(declare-fun m!74789 () Bool)

(assert (=> b!48143 m!74789))

(declare-fun m!74791 () Bool)

(assert (=> b!48158 m!74791))

(assert (=> b!48158 m!74791))

(declare-fun m!74793 () Bool)

(assert (=> b!48158 m!74793))

(declare-fun m!74795 () Bool)

(assert (=> b!48158 m!74795))

(declare-fun m!74797 () Bool)

(assert (=> b!48147 m!74797))

(declare-fun m!74799 () Bool)

(assert (=> b!48156 m!74799))

(declare-fun m!74801 () Bool)

(assert (=> b!48153 m!74801))

(declare-fun m!74803 () Bool)

(assert (=> b!48153 m!74803))

(declare-fun m!74805 () Bool)

(assert (=> b!48153 m!74805))

(declare-fun m!74807 () Bool)

(assert (=> b!48153 m!74807))

(declare-fun m!74809 () Bool)

(assert (=> b!48153 m!74809))

(declare-fun m!74811 () Bool)

(assert (=> b!48153 m!74811))

(declare-fun m!74813 () Bool)

(assert (=> b!48153 m!74813))

(declare-fun m!74815 () Bool)

(assert (=> b!48150 m!74815))

(declare-fun m!74817 () Bool)

(assert (=> b!48149 m!74817))

(push 1)

(assert (not b!48149))

(assert (not b!48143))

(assert (not b!48147))

(assert (not b!48158))

(assert (not b!48144))

(assert (not b!48145))

(assert (not b!48154))

(assert (not b!48150))

(assert (not b!48157))

(assert (not start!9638))

(assert (not b!48151))

(assert (not b!48152))

(assert (not b!48155))

(assert (not b!48146))

(assert (not b!48159))

(assert (not b!48153))

(assert (not b!48148))

(assert (not b!48156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!14848 () Bool)

(declare-fun res!40780 () Bool)

(declare-fun e!32127 () Bool)

(assert (=> d!14848 (=> (not res!40780) (not e!32127))))

(assert (=> d!14848 (= res!40780 (= (size!1042 (buf!1394 thiss!1379)) (size!1042 (buf!1394 (_2!2379 lt!74519)))))))

(assert (=> d!14848 (= (isPrefixOf!0 thiss!1379 (_2!2379 lt!74519)) e!32127)))

(declare-fun b!48553 () Bool)

(declare-fun res!40781 () Bool)

(assert (=> b!48553 (=> (not res!40781) (not e!32127))))

(assert (=> b!48553 (= res!40781 (bvsle (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)) (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519)))))))

(declare-fun b!48554 () Bool)

(declare-fun e!32126 () Bool)

(assert (=> b!48554 (= e!32127 e!32126)))

(declare-fun res!40779 () Bool)

(assert (=> b!48554 (=> res!40779 e!32126)))

(assert (=> b!48554 (= res!40779 (= (size!1042 (buf!1394 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48555 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2302 array!2302 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48555 (= e!32126 (arrayBitRangesEq!0 (buf!1394 thiss!1379) (buf!1394 (_2!2379 lt!74519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379))))))

(assert (= (and d!14848 res!40780) b!48553))

(assert (= (and b!48553 res!40781) b!48554))

(assert (= (and b!48554 (not res!40779)) b!48555))

(assert (=> b!48553 m!74783))

(assert (=> b!48553 m!74797))

(assert (=> b!48555 m!74783))

(assert (=> b!48555 m!74783))

(declare-fun m!75527 () Bool)

(assert (=> b!48555 m!75527))

(assert (=> b!48154 d!14848))

(declare-fun d!14850 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!14850 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) lt!74527) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519)))) lt!74527))))

(declare-fun bs!3804 () Bool)

(assert (= bs!3804 d!14850))

(declare-fun m!75529 () Bool)

(assert (=> bs!3804 m!75529))

(assert (=> b!48154 d!14850))

(declare-fun d!14852 () Bool)

(declare-fun e!32130 () Bool)

(assert (=> d!14852 e!32130))

(declare-fun res!40784 () Bool)

(assert (=> d!14852 (=> (not res!40784) (not e!32130))))

(assert (=> d!14852 (= res!40784 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!75313 () Unit!3378)

(declare-fun choose!27 (BitStream!1810 BitStream!1810 (_ BitVec 64) (_ BitVec 64)) Unit!3378)

(assert (=> d!14852 (= lt!75313 (choose!27 thiss!1379 (_2!2379 lt!74519) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!14852 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!14852 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2379 lt!74519) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!75313)))

(declare-fun b!48558 () Bool)

(assert (=> b!48558 (= e!32130 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!14852 res!40784) b!48558))

(declare-fun m!75531 () Bool)

(assert (=> d!14852 m!75531))

(declare-fun m!75533 () Bool)

(assert (=> b!48558 m!75533))

(assert (=> b!48154 d!14852))

(declare-fun b!48576 () Bool)

(declare-fun res!40807 () Bool)

(declare-fun e!32142 () Bool)

(assert (=> b!48576 (=> (not res!40807) (not e!32142))))

(declare-fun lt!75344 () tuple2!4560)

(assert (=> b!48576 (= res!40807 (isPrefixOf!0 thiss!1379 (_2!2379 lt!75344)))))

(declare-fun b!48577 () Bool)

(declare-fun res!40801 () Bool)

(assert (=> b!48577 (=> (not res!40801) (not e!32142))))

(declare-fun lt!75339 () (_ BitVec 64))

(declare-fun lt!75345 () (_ BitVec 64))

(assert (=> b!48577 (= res!40801 (= (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!75344))) (currentByte!2905 (_2!2379 lt!75344)) (currentBit!2900 (_2!2379 lt!75344))) (bvadd lt!75345 lt!75339)))))

(assert (=> b!48577 (or (not (= (bvand lt!75345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75339 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!75345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!75345 lt!75339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48577 (= lt!75339 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!48577 (= lt!75345 (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)))))

(declare-fun b!48578 () Bool)

(declare-fun res!40805 () Bool)

(declare-fun e!32140 () Bool)

(assert (=> b!48578 (=> (not res!40805) (not e!32140))))

(declare-fun lt!75343 () tuple2!4560)

(assert (=> b!48578 (= res!40805 (= (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!75343))) (currentByte!2905 (_2!2379 lt!75343)) (currentBit!2900 (_2!2379 lt!75343))) (bvadd (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48579 () Bool)

(declare-fun e!32141 () Bool)

(declare-datatypes ((tuple2!4588 0))(
  ( (tuple2!4589 (_1!2393 BitStream!1810) (_2!2393 Bool)) )
))
(declare-fun lt!75342 () tuple2!4588)

(assert (=> b!48579 (= e!32141 (= (bitIndex!0 (size!1042 (buf!1394 (_1!2393 lt!75342))) (currentByte!2905 (_1!2393 lt!75342)) (currentBit!2900 (_1!2393 lt!75342))) (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!75343))) (currentByte!2905 (_2!2379 lt!75343)) (currentBit!2900 (_2!2379 lt!75343)))))))

(declare-fun d!14854 () Bool)

(assert (=> d!14854 e!32142))

(declare-fun res!40804 () Bool)

(assert (=> d!14854 (=> (not res!40804) (not e!32142))))

(assert (=> d!14854 (= res!40804 (= (size!1042 (buf!1394 (_2!2379 lt!75344))) (size!1042 (buf!1394 thiss!1379))))))

(declare-fun lt!75348 () (_ BitVec 8))

(declare-fun lt!75347 () array!2302)

(assert (=> d!14854 (= lt!75348 (select (arr!1565 lt!75347) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!14854 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1042 lt!75347)))))

(assert (=> d!14854 (= lt!75347 (array!2303 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!75349 () tuple2!4560)

(assert (=> d!14854 (= lt!75344 (tuple2!4561 (_1!2379 lt!75349) (_2!2379 lt!75349)))))

(assert (=> d!14854 (= lt!75349 lt!75343)))

(assert (=> d!14854 e!32140))

(declare-fun res!40806 () Bool)

(assert (=> d!14854 (=> (not res!40806) (not e!32140))))

(assert (=> d!14854 (= res!40806 (= (size!1042 (buf!1394 thiss!1379)) (size!1042 (buf!1394 (_2!2379 lt!75343)))))))

(declare-fun lt!75346 () Bool)

(declare-fun appendBit!0 (BitStream!1810 Bool) tuple2!4560)

(assert (=> d!14854 (= lt!75343 (appendBit!0 thiss!1379 lt!75346))))

(assert (=> d!14854 (= lt!75346 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1565 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!14854 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!14854 (= (appendBitFromByte!0 thiss!1379 (select (arr!1565 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!75344)))

(declare-fun b!48580 () Bool)

(declare-fun e!32139 () Bool)

(assert (=> b!48580 (= e!32142 e!32139)))

(declare-fun res!40802 () Bool)

(assert (=> b!48580 (=> (not res!40802) (not e!32139))))

(declare-fun lt!75338 () tuple2!4588)

(assert (=> b!48580 (= res!40802 (and (= (_2!2393 lt!75338) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1565 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!75348)) #b00000000000000000000000000000000))) (= (_1!2393 lt!75338) (_2!2379 lt!75344))))))

(declare-datatypes ((tuple2!4590 0))(
  ( (tuple2!4591 (_1!2394 array!2302) (_2!2394 BitStream!1810)) )
))
(declare-fun lt!75341 () tuple2!4590)

(declare-fun lt!75340 () BitStream!1810)

(declare-fun readBits!0 (BitStream!1810 (_ BitVec 64)) tuple2!4590)

(assert (=> b!48580 (= lt!75341 (readBits!0 lt!75340 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1810) tuple2!4588)

(assert (=> b!48580 (= lt!75338 (readBitPure!0 lt!75340))))

(declare-fun readerFrom!0 (BitStream!1810 (_ BitVec 32) (_ BitVec 32)) BitStream!1810)

(assert (=> b!48580 (= lt!75340 (readerFrom!0 (_2!2379 lt!75344) (currentBit!2900 thiss!1379) (currentByte!2905 thiss!1379)))))

(declare-fun b!48581 () Bool)

(assert (=> b!48581 (= e!32140 e!32141)))

(declare-fun res!40803 () Bool)

(assert (=> b!48581 (=> (not res!40803) (not e!32141))))

(assert (=> b!48581 (= res!40803 (and (= (_2!2393 lt!75342) lt!75346) (= (_1!2393 lt!75342) (_2!2379 lt!75343))))))

(assert (=> b!48581 (= lt!75342 (readBitPure!0 (readerFrom!0 (_2!2379 lt!75343) (currentBit!2900 thiss!1379) (currentByte!2905 thiss!1379))))))

(declare-fun b!48582 () Bool)

(assert (=> b!48582 (= e!32139 (= (bitIndex!0 (size!1042 (buf!1394 (_1!2393 lt!75338))) (currentByte!2905 (_1!2393 lt!75338)) (currentBit!2900 (_1!2393 lt!75338))) (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!75344))) (currentByte!2905 (_2!2379 lt!75344)) (currentBit!2900 (_2!2379 lt!75344)))))))

(declare-fun b!48583 () Bool)

(declare-fun res!40808 () Bool)

(assert (=> b!48583 (=> (not res!40808) (not e!32140))))

(assert (=> b!48583 (= res!40808 (isPrefixOf!0 thiss!1379 (_2!2379 lt!75343)))))

(assert (= (and d!14854 res!40806) b!48578))

(assert (= (and b!48578 res!40805) b!48583))

(assert (= (and b!48583 res!40808) b!48581))

(assert (= (and b!48581 res!40803) b!48579))

(assert (= (and d!14854 res!40804) b!48577))

(assert (= (and b!48577 res!40801) b!48576))

(assert (= (and b!48576 res!40807) b!48580))

(assert (= (and b!48580 res!40802) b!48582))

(declare-fun m!75535 () Bool)

(assert (=> b!48578 m!75535))

(assert (=> b!48578 m!74783))

(declare-fun m!75537 () Bool)

(assert (=> b!48580 m!75537))

(declare-fun m!75539 () Bool)

(assert (=> b!48580 m!75539))

(declare-fun m!75541 () Bool)

(assert (=> b!48580 m!75541))

(declare-fun m!75543 () Bool)

(assert (=> b!48583 m!75543))

(declare-fun m!75545 () Bool)

(assert (=> b!48581 m!75545))

(assert (=> b!48581 m!75545))

(declare-fun m!75547 () Bool)

(assert (=> b!48581 m!75547))

(declare-fun m!75549 () Bool)

(assert (=> d!14854 m!75549))

(declare-fun m!75551 () Bool)

(assert (=> d!14854 m!75551))

(declare-fun m!75553 () Bool)

(assert (=> d!14854 m!75553))

(declare-fun m!75555 () Bool)

(assert (=> b!48577 m!75555))

(assert (=> b!48577 m!74783))

(declare-fun m!75557 () Bool)

(assert (=> b!48579 m!75557))

(assert (=> b!48579 m!75535))

(declare-fun m!75559 () Bool)

(assert (=> b!48576 m!75559))

(declare-fun m!75561 () Bool)

(assert (=> b!48582 m!75561))

(assert (=> b!48582 m!75555))

(assert (=> b!48154 d!14854))

(declare-fun d!14856 () Bool)

(assert (=> d!14856 (= (invariant!0 (currentBit!2900 (_2!2379 lt!74519)) (currentByte!2905 (_2!2379 lt!74519)) (size!1042 (buf!1394 (_2!2379 lt!74519)))) (and (bvsge (currentBit!2900 (_2!2379 lt!74519)) #b00000000000000000000000000000000) (bvslt (currentBit!2900 (_2!2379 lt!74519)) #b00000000000000000000000000001000) (bvsge (currentByte!2905 (_2!2379 lt!74519)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2905 (_2!2379 lt!74519)) (size!1042 (buf!1394 (_2!2379 lt!74519)))) (and (= (currentBit!2900 (_2!2379 lt!74519)) #b00000000000000000000000000000000) (= (currentByte!2905 (_2!2379 lt!74519)) (size!1042 (buf!1394 (_2!2379 lt!74519))))))))))

(assert (=> b!48143 d!14856))

(declare-fun d!14858 () Bool)

(assert (=> d!14858 (isPrefixOf!0 thiss!1379 (_2!2379 lt!74522))))

(declare-fun lt!75352 () Unit!3378)

(declare-fun choose!30 (BitStream!1810 BitStream!1810 BitStream!1810) Unit!3378)

(assert (=> d!14858 (= lt!75352 (choose!30 thiss!1379 (_2!2379 lt!74519) (_2!2379 lt!74522)))))

(assert (=> d!14858 (isPrefixOf!0 thiss!1379 (_2!2379 lt!74519))))

(assert (=> d!14858 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2379 lt!74519) (_2!2379 lt!74522)) lt!75352)))

(declare-fun bs!3805 () Bool)

(assert (= bs!3805 d!14858))

(assert (=> bs!3805 m!74811))

(declare-fun m!75563 () Bool)

(assert (=> bs!3805 m!75563))

(assert (=> bs!3805 m!74759))

(assert (=> b!48153 d!14858))

(declare-fun b!48600 () Bool)

(declare-fun res!40822 () Bool)

(declare-fun e!32151 () Bool)

(assert (=> b!48600 (=> (not res!40822) (not e!32151))))

(declare-fun lt!75450 () tuple2!4560)

(assert (=> b!48600 (= res!40822 (isPrefixOf!0 (_2!2379 lt!74519) (_2!2379 lt!75450)))))

(declare-fun b!48601 () Bool)

(declare-fun res!40824 () Bool)

(assert (=> b!48601 (=> (not res!40824) (not e!32151))))

(assert (=> b!48601 (= res!40824 (= (size!1042 (buf!1394 (_2!2379 lt!75450))) (size!1042 (buf!1394 (_2!2379 lt!74519)))))))

(declare-fun lt!75455 () tuple2!4560)

(declare-fun c!3404 () Bool)

(declare-fun call!610 () tuple2!4562)

(declare-fun bm!607 () Bool)

(declare-fun lt!75476 () tuple2!4560)

(assert (=> bm!607 (= call!610 (reader!0 (ite c!3404 (_2!2379 lt!75455) (_2!2379 lt!74519)) (ite c!3404 (_2!2379 lt!75476) (_2!2379 lt!74519))))))

(declare-fun lt!75447 () tuple2!4562)

(declare-fun b!48602 () Bool)

(assert (=> b!48602 (= e!32151 (= (bitStreamReadBitsIntoList!0 (_2!2379 lt!75450) (_1!2380 lt!75447) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2379 lt!75450) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!48602 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48602 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!75454 () Unit!3378)

(declare-fun lt!75451 () Unit!3378)

(assert (=> b!48602 (= lt!75454 lt!75451)))

(declare-fun lt!75484 () (_ BitVec 64))

(assert (=> b!48602 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!75450)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) lt!75484)))

(assert (=> b!48602 (= lt!75451 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2379 lt!74519) (buf!1394 (_2!2379 lt!75450)) lt!75484))))

(declare-fun e!32150 () Bool)

(assert (=> b!48602 e!32150))

(declare-fun res!40825 () Bool)

(assert (=> b!48602 (=> (not res!40825) (not e!32150))))

(assert (=> b!48602 (= res!40825 (and (= (size!1042 (buf!1394 (_2!2379 lt!74519))) (size!1042 (buf!1394 (_2!2379 lt!75450)))) (bvsge lt!75484 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48602 (= lt!75484 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!48602 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48602 (= lt!75447 (reader!0 (_2!2379 lt!74519) (_2!2379 lt!75450)))))

(declare-fun b!48603 () Bool)

(declare-fun e!32149 () tuple2!4560)

(declare-fun Unit!3404 () Unit!3378)

(assert (=> b!48603 (= e!32149 (tuple2!4561 Unit!3404 (_2!2379 lt!74519)))))

(assert (=> b!48603 (= (size!1042 (buf!1394 (_2!2379 lt!74519))) (size!1042 (buf!1394 (_2!2379 lt!74519))))))

(declare-fun lt!75473 () Unit!3378)

(declare-fun Unit!3405 () Unit!3378)

(assert (=> b!48603 (= lt!75473 Unit!3405)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1810 array!2302 array!2302 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48603 (checkByteArrayBitContent!0 (_2!2379 lt!74519) srcBuffer!2 (_1!2394 (readBits!0 (_1!2380 call!610) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!48604 () Bool)

(declare-fun res!40821 () Bool)

(assert (=> b!48604 (=> (not res!40821) (not e!32151))))

(assert (=> b!48604 (= res!40821 (invariant!0 (currentBit!2900 (_2!2379 lt!75450)) (currentByte!2905 (_2!2379 lt!75450)) (size!1042 (buf!1394 (_2!2379 lt!75450)))))))

(declare-fun b!48605 () Bool)

(declare-fun Unit!3406 () Unit!3378)

(assert (=> b!48605 (= e!32149 (tuple2!4561 Unit!3406 (_2!2379 lt!75476)))))

(assert (=> b!48605 (= lt!75455 (appendBitFromByte!0 (_2!2379 lt!74519) (select (arr!1565 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!75449 () (_ BitVec 64))

(assert (=> b!48605 (= lt!75449 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75472 () (_ BitVec 64))

(assert (=> b!48605 (= lt!75472 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75469 () Unit!3378)

(assert (=> b!48605 (= lt!75469 (validateOffsetBitsIneqLemma!0 (_2!2379 lt!74519) (_2!2379 lt!75455) lt!75449 lt!75472))))

(assert (=> b!48605 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!75455)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!75455))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!75455))) (bvsub lt!75449 lt!75472))))

(declare-fun lt!75482 () Unit!3378)

(assert (=> b!48605 (= lt!75482 lt!75469)))

(declare-fun lt!75452 () tuple2!4562)

(assert (=> b!48605 (= lt!75452 (reader!0 (_2!2379 lt!74519) (_2!2379 lt!75455)))))

(declare-fun lt!75461 () (_ BitVec 64))

(assert (=> b!48605 (= lt!75461 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75444 () Unit!3378)

(assert (=> b!48605 (= lt!75444 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2379 lt!74519) (buf!1394 (_2!2379 lt!75455)) lt!75461))))

(assert (=> b!48605 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!75455)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) lt!75461)))

(declare-fun lt!75466 () Unit!3378)

(assert (=> b!48605 (= lt!75466 lt!75444)))

(assert (=> b!48605 (= (head!365 (byteArrayBitContentToList!0 (_2!2379 lt!75455) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!365 (bitStreamReadBitsIntoList!0 (_2!2379 lt!75455) (_1!2380 lt!75452) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75470 () Unit!3378)

(declare-fun Unit!3407 () Unit!3378)

(assert (=> b!48605 (= lt!75470 Unit!3407)))

(assert (=> b!48605 (= lt!75476 (appendBitsMSBFirstLoop!0 (_2!2379 lt!75455) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!75446 () Unit!3378)

(assert (=> b!48605 (= lt!75446 (lemmaIsPrefixTransitive!0 (_2!2379 lt!74519) (_2!2379 lt!75455) (_2!2379 lt!75476)))))

(assert (=> b!48605 (isPrefixOf!0 (_2!2379 lt!74519) (_2!2379 lt!75476))))

(declare-fun lt!75481 () Unit!3378)

(assert (=> b!48605 (= lt!75481 lt!75446)))

(assert (=> b!48605 (= (size!1042 (buf!1394 (_2!2379 lt!75476))) (size!1042 (buf!1394 (_2!2379 lt!74519))))))

(declare-fun lt!75456 () Unit!3378)

(declare-fun Unit!3408 () Unit!3378)

(assert (=> b!48605 (= lt!75456 Unit!3408)))

(assert (=> b!48605 (= (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!75476))) (currentByte!2905 (_2!2379 lt!75476)) (currentBit!2900 (_2!2379 lt!75476))) (bvsub (bvadd (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75441 () Unit!3378)

(declare-fun Unit!3409 () Unit!3378)

(assert (=> b!48605 (= lt!75441 Unit!3409)))

(assert (=> b!48605 (= (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!75476))) (currentByte!2905 (_2!2379 lt!75476)) (currentBit!2900 (_2!2379 lt!75476))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!75455))) (currentByte!2905 (_2!2379 lt!75455)) (currentBit!2900 (_2!2379 lt!75455))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75460 () Unit!3378)

(declare-fun Unit!3410 () Unit!3378)

(assert (=> b!48605 (= lt!75460 Unit!3410)))

(declare-fun lt!75462 () tuple2!4562)

(assert (=> b!48605 (= lt!75462 (reader!0 (_2!2379 lt!74519) (_2!2379 lt!75476)))))

(declare-fun lt!75479 () (_ BitVec 64))

(assert (=> b!48605 (= lt!75479 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75445 () Unit!3378)

(assert (=> b!48605 (= lt!75445 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2379 lt!74519) (buf!1394 (_2!2379 lt!75476)) lt!75479))))

(assert (=> b!48605 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!75476)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) lt!75479)))

(declare-fun lt!75463 () Unit!3378)

(assert (=> b!48605 (= lt!75463 lt!75445)))

(declare-fun lt!75457 () tuple2!4562)

(assert (=> b!48605 (= lt!75457 call!610)))

(declare-fun lt!75464 () (_ BitVec 64))

(assert (=> b!48605 (= lt!75464 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75471 () Unit!3378)

(assert (=> b!48605 (= lt!75471 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2379 lt!75455) (buf!1394 (_2!2379 lt!75476)) lt!75464))))

(assert (=> b!48605 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!75476)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!75455))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!75455))) lt!75464)))

(declare-fun lt!75468 () Unit!3378)

(assert (=> b!48605 (= lt!75468 lt!75471)))

(declare-fun lt!75480 () List!546)

(assert (=> b!48605 (= lt!75480 (byteArrayBitContentToList!0 (_2!2379 lt!75476) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!75458 () List!546)

(assert (=> b!48605 (= lt!75458 (byteArrayBitContentToList!0 (_2!2379 lt!75476) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75465 () List!546)

(assert (=> b!48605 (= lt!75465 (bitStreamReadBitsIntoList!0 (_2!2379 lt!75476) (_1!2380 lt!75462) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!75448 () List!546)

(assert (=> b!48605 (= lt!75448 (bitStreamReadBitsIntoList!0 (_2!2379 lt!75476) (_1!2380 lt!75457) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75453 () (_ BitVec 64))

(assert (=> b!48605 (= lt!75453 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75483 () Unit!3378)

(assert (=> b!48605 (= lt!75483 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2379 lt!75476) (_2!2379 lt!75476) (_1!2380 lt!75462) (_1!2380 lt!75457) lt!75453 lt!75465))))

(assert (=> b!48605 (= (bitStreamReadBitsIntoList!0 (_2!2379 lt!75476) (_1!2380 lt!75457) (bvsub lt!75453 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!232 lt!75465))))

(declare-fun lt!75443 () Unit!3378)

(assert (=> b!48605 (= lt!75443 lt!75483)))

(declare-fun lt!75478 () Unit!3378)

(declare-fun lt!75475 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2302 array!2302 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3378)

(assert (=> b!48605 (= lt!75478 (arrayBitRangesEqImpliesEq!0 (buf!1394 (_2!2379 lt!75455)) (buf!1394 (_2!2379 lt!75476)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!75475 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!75455))) (currentByte!2905 (_2!2379 lt!75455)) (currentBit!2900 (_2!2379 lt!75455)))))))

(assert (=> b!48605 (= (bitAt!0 (buf!1394 (_2!2379 lt!75455)) lt!75475) (bitAt!0 (buf!1394 (_2!2379 lt!75476)) lt!75475))))

(declare-fun lt!75477 () Unit!3378)

(assert (=> b!48605 (= lt!75477 lt!75478)))

(declare-fun b!48606 () Bool)

(declare-fun res!40823 () Bool)

(assert (=> b!48606 (=> (not res!40823) (not e!32151))))

(assert (=> b!48606 (= res!40823 (= (size!1042 (buf!1394 (_2!2379 lt!74519))) (size!1042 (buf!1394 (_2!2379 lt!75450)))))))

(declare-fun d!14860 () Bool)

(assert (=> d!14860 e!32151))

(declare-fun res!40826 () Bool)

(assert (=> d!14860 (=> (not res!40826) (not e!32151))))

(declare-fun lt!75459 () (_ BitVec 64))

(assert (=> d!14860 (= res!40826 (= (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!75450))) (currentByte!2905 (_2!2379 lt!75450)) (currentBit!2900 (_2!2379 lt!75450))) (bvsub lt!75459 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!14860 (or (= (bvand lt!75459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75459 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!75467 () (_ BitVec 64))

(assert (=> d!14860 (= lt!75459 (bvadd lt!75467 to!314))))

(assert (=> d!14860 (or (not (= (bvand lt!75467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!75467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!75467 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14860 (= lt!75467 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))))))

(assert (=> d!14860 (= lt!75450 e!32149)))

(assert (=> d!14860 (= c!3404 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!75474 () Unit!3378)

(declare-fun lt!75442 () Unit!3378)

(assert (=> d!14860 (= lt!75474 lt!75442)))

(assert (=> d!14860 (isPrefixOf!0 (_2!2379 lt!74519) (_2!2379 lt!74519))))

(assert (=> d!14860 (= lt!75442 (lemmaIsPrefixRefl!0 (_2!2379 lt!74519)))))

(assert (=> d!14860 (= lt!75475 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))))))

(assert (=> d!14860 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14860 (= (appendBitsMSBFirstLoop!0 (_2!2379 lt!74519) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!75450)))

(declare-fun b!48607 () Bool)

(assert (=> b!48607 (= e!32150 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) lt!75484))))

(assert (= (and d!14860 c!3404) b!48605))

(assert (= (and d!14860 (not c!3404)) b!48603))

(assert (= (or b!48605 b!48603) bm!607))

(assert (= (and d!14860 res!40826) b!48604))

(assert (= (and b!48604 res!40821) b!48606))

(assert (= (and b!48606 res!40823) b!48600))

(assert (= (and b!48600 res!40822) b!48601))

(assert (= (and b!48601 res!40824) b!48602))

(assert (= (and b!48602 res!40825) b!48607))

(declare-fun m!75565 () Bool)

(assert (=> bm!607 m!75565))

(declare-fun m!75567 () Bool)

(assert (=> b!48604 m!75567))

(declare-fun m!75569 () Bool)

(assert (=> b!48605 m!75569))

(declare-fun m!75571 () Bool)

(assert (=> b!48605 m!75571))

(declare-fun m!75573 () Bool)

(assert (=> b!48605 m!75573))

(declare-fun m!75575 () Bool)

(assert (=> b!48605 m!75575))

(declare-fun m!75577 () Bool)

(assert (=> b!48605 m!75577))

(declare-fun m!75579 () Bool)

(assert (=> b!48605 m!75579))

(declare-fun m!75581 () Bool)

(assert (=> b!48605 m!75581))

(declare-fun m!75583 () Bool)

(assert (=> b!48605 m!75583))

(assert (=> b!48605 m!75579))

(declare-fun m!75585 () Bool)

(assert (=> b!48605 m!75585))

(declare-fun m!75587 () Bool)

(assert (=> b!48605 m!75587))

(declare-fun m!75589 () Bool)

(assert (=> b!48605 m!75589))

(declare-fun m!75591 () Bool)

(assert (=> b!48605 m!75591))

(declare-fun m!75593 () Bool)

(assert (=> b!48605 m!75593))

(declare-fun m!75595 () Bool)

(assert (=> b!48605 m!75595))

(declare-fun m!75597 () Bool)

(assert (=> b!48605 m!75597))

(declare-fun m!75599 () Bool)

(assert (=> b!48605 m!75599))

(assert (=> b!48605 m!75571))

(declare-fun m!75601 () Bool)

(assert (=> b!48605 m!75601))

(declare-fun m!75603 () Bool)

(assert (=> b!48605 m!75603))

(declare-fun m!75605 () Bool)

(assert (=> b!48605 m!75605))

(declare-fun m!75607 () Bool)

(assert (=> b!48605 m!75607))

(assert (=> b!48605 m!74797))

(declare-fun m!75609 () Bool)

(assert (=> b!48605 m!75609))

(assert (=> b!48605 m!75597))

(declare-fun m!75611 () Bool)

(assert (=> b!48605 m!75611))

(declare-fun m!75613 () Bool)

(assert (=> b!48605 m!75613))

(declare-fun m!75615 () Bool)

(assert (=> b!48605 m!75615))

(declare-fun m!75617 () Bool)

(assert (=> b!48605 m!75617))

(assert (=> b!48605 m!75593))

(declare-fun m!75619 () Bool)

(assert (=> b!48605 m!75619))

(declare-fun m!75621 () Bool)

(assert (=> b!48605 m!75621))

(declare-fun m!75623 () Bool)

(assert (=> b!48605 m!75623))

(declare-fun m!75625 () Bool)

(assert (=> b!48605 m!75625))

(declare-fun m!75627 () Bool)

(assert (=> b!48605 m!75627))

(declare-fun m!75629 () Bool)

(assert (=> b!48605 m!75629))

(declare-fun m!75631 () Bool)

(assert (=> d!14860 m!75631))

(assert (=> d!14860 m!74797))

(declare-fun m!75633 () Bool)

(assert (=> d!14860 m!75633))

(declare-fun m!75635 () Bool)

(assert (=> d!14860 m!75635))

(declare-fun m!75637 () Bool)

(assert (=> b!48600 m!75637))

(declare-fun m!75639 () Bool)

(assert (=> b!48602 m!75639))

(declare-fun m!75641 () Bool)

(assert (=> b!48602 m!75641))

(declare-fun m!75643 () Bool)

(assert (=> b!48602 m!75643))

(declare-fun m!75645 () Bool)

(assert (=> b!48602 m!75645))

(declare-fun m!75647 () Bool)

(assert (=> b!48602 m!75647))

(declare-fun m!75649 () Bool)

(assert (=> b!48603 m!75649))

(declare-fun m!75651 () Bool)

(assert (=> b!48603 m!75651))

(declare-fun m!75653 () Bool)

(assert (=> b!48607 m!75653))

(assert (=> b!48153 d!14860))

(declare-fun d!14862 () Bool)

(declare-fun res!40828 () Bool)

(declare-fun e!32153 () Bool)

(assert (=> d!14862 (=> (not res!40828) (not e!32153))))

(assert (=> d!14862 (= res!40828 (= (size!1042 (buf!1394 thiss!1379)) (size!1042 (buf!1394 (_2!2379 lt!74522)))))))

(assert (=> d!14862 (= (isPrefixOf!0 thiss!1379 (_2!2379 lt!74522)) e!32153)))

(declare-fun b!48608 () Bool)

(declare-fun res!40829 () Bool)

(assert (=> b!48608 (=> (not res!40829) (not e!32153))))

(assert (=> b!48608 (= res!40829 (bvsle (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)) (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74522))) (currentByte!2905 (_2!2379 lt!74522)) (currentBit!2900 (_2!2379 lt!74522)))))))

(declare-fun b!48609 () Bool)

(declare-fun e!32152 () Bool)

(assert (=> b!48609 (= e!32153 e!32152)))

(declare-fun res!40827 () Bool)

(assert (=> b!48609 (=> res!40827 e!32152)))

(assert (=> b!48609 (= res!40827 (= (size!1042 (buf!1394 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48610 () Bool)

(assert (=> b!48610 (= e!32152 (arrayBitRangesEq!0 (buf!1394 thiss!1379) (buf!1394 (_2!2379 lt!74522)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379))))))

(assert (= (and d!14862 res!40828) b!48608))

(assert (= (and b!48608 res!40829) b!48609))

(assert (= (and b!48609 (not res!40827)) b!48610))

(assert (=> b!48608 m!74783))

(assert (=> b!48608 m!74817))

(assert (=> b!48610 m!74783))

(assert (=> b!48610 m!74783))

(declare-fun m!75655 () Bool)

(assert (=> b!48610 m!75655))

(assert (=> b!48153 d!14862))

(declare-fun d!14864 () Bool)

(declare-fun res!40831 () Bool)

(declare-fun e!32155 () Bool)

(assert (=> d!14864 (=> (not res!40831) (not e!32155))))

(assert (=> d!14864 (= res!40831 (= (size!1042 (buf!1394 (_2!2379 lt!74519))) (size!1042 (buf!1394 (_2!2379 lt!74522)))))))

(assert (=> d!14864 (= (isPrefixOf!0 (_2!2379 lt!74519) (_2!2379 lt!74522)) e!32155)))

(declare-fun b!48611 () Bool)

(declare-fun res!40832 () Bool)

(assert (=> b!48611 (=> (not res!40832) (not e!32155))))

(assert (=> b!48611 (= res!40832 (bvsle (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))) (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74522))) (currentByte!2905 (_2!2379 lt!74522)) (currentBit!2900 (_2!2379 lt!74522)))))))

(declare-fun b!48612 () Bool)

(declare-fun e!32154 () Bool)

(assert (=> b!48612 (= e!32155 e!32154)))

(declare-fun res!40830 () Bool)

(assert (=> b!48612 (=> res!40830 e!32154)))

(assert (=> b!48612 (= res!40830 (= (size!1042 (buf!1394 (_2!2379 lt!74519))) #b00000000000000000000000000000000))))

(declare-fun b!48613 () Bool)

(assert (=> b!48613 (= e!32154 (arrayBitRangesEq!0 (buf!1394 (_2!2379 lt!74519)) (buf!1394 (_2!2379 lt!74522)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519)))))))

(assert (= (and d!14864 res!40831) b!48611))

(assert (= (and b!48611 res!40832) b!48612))

(assert (= (and b!48612 (not res!40830)) b!48613))

(assert (=> b!48611 m!74797))

(assert (=> b!48611 m!74817))

(assert (=> b!48613 m!74797))

(assert (=> b!48613 m!74797))

(declare-fun m!75657 () Bool)

(assert (=> b!48613 m!75657))

(assert (=> b!48153 d!14864))

(declare-fun b!48624 () Bool)

(declare-fun e!32160 () Unit!3378)

(declare-fun Unit!3411 () Unit!3378)

(assert (=> b!48624 (= e!32160 Unit!3411)))

(declare-fun b!48625 () Bool)

(declare-fun res!40841 () Bool)

(declare-fun e!32161 () Bool)

(assert (=> b!48625 (=> (not res!40841) (not e!32161))))

(declare-fun lt!75542 () tuple2!4562)

(assert (=> b!48625 (= res!40841 (isPrefixOf!0 (_2!2380 lt!75542) (_2!2379 lt!74519)))))

(declare-fun b!48626 () Bool)

(declare-fun lt!75535 () Unit!3378)

(assert (=> b!48626 (= e!32160 lt!75535)))

(declare-fun lt!75536 () (_ BitVec 64))

(assert (=> b!48626 (= lt!75536 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75528 () (_ BitVec 64))

(assert (=> b!48626 (= lt!75528 (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2302 array!2302 (_ BitVec 64) (_ BitVec 64)) Unit!3378)

(assert (=> b!48626 (= lt!75535 (arrayBitRangesEqSymmetric!0 (buf!1394 thiss!1379) (buf!1394 (_2!2379 lt!74519)) lt!75536 lt!75528))))

(assert (=> b!48626 (arrayBitRangesEq!0 (buf!1394 (_2!2379 lt!74519)) (buf!1394 thiss!1379) lt!75536 lt!75528)))

(declare-fun d!14866 () Bool)

(assert (=> d!14866 e!32161))

(declare-fun res!40839 () Bool)

(assert (=> d!14866 (=> (not res!40839) (not e!32161))))

(assert (=> d!14866 (= res!40839 (isPrefixOf!0 (_1!2380 lt!75542) (_2!2380 lt!75542)))))

(declare-fun lt!75531 () BitStream!1810)

(assert (=> d!14866 (= lt!75542 (tuple2!4563 lt!75531 (_2!2379 lt!74519)))))

(declare-fun lt!75530 () Unit!3378)

(declare-fun lt!75533 () Unit!3378)

(assert (=> d!14866 (= lt!75530 lt!75533)))

(assert (=> d!14866 (isPrefixOf!0 lt!75531 (_2!2379 lt!74519))))

(assert (=> d!14866 (= lt!75533 (lemmaIsPrefixTransitive!0 lt!75531 (_2!2379 lt!74519) (_2!2379 lt!74519)))))

(declare-fun lt!75529 () Unit!3378)

(declare-fun lt!75540 () Unit!3378)

(assert (=> d!14866 (= lt!75529 lt!75540)))

(assert (=> d!14866 (isPrefixOf!0 lt!75531 (_2!2379 lt!74519))))

(assert (=> d!14866 (= lt!75540 (lemmaIsPrefixTransitive!0 lt!75531 thiss!1379 (_2!2379 lt!74519)))))

(declare-fun lt!75527 () Unit!3378)

(assert (=> d!14866 (= lt!75527 e!32160)))

(declare-fun c!3407 () Bool)

(assert (=> d!14866 (= c!3407 (not (= (size!1042 (buf!1394 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!75541 () Unit!3378)

(declare-fun lt!75544 () Unit!3378)

(assert (=> d!14866 (= lt!75541 lt!75544)))

(assert (=> d!14866 (isPrefixOf!0 (_2!2379 lt!74519) (_2!2379 lt!74519))))

(assert (=> d!14866 (= lt!75544 (lemmaIsPrefixRefl!0 (_2!2379 lt!74519)))))

(declare-fun lt!75543 () Unit!3378)

(declare-fun lt!75534 () Unit!3378)

(assert (=> d!14866 (= lt!75543 lt!75534)))

(assert (=> d!14866 (= lt!75534 (lemmaIsPrefixRefl!0 (_2!2379 lt!74519)))))

(declare-fun lt!75537 () Unit!3378)

(declare-fun lt!75525 () Unit!3378)

(assert (=> d!14866 (= lt!75537 lt!75525)))

(assert (=> d!14866 (isPrefixOf!0 lt!75531 lt!75531)))

(assert (=> d!14866 (= lt!75525 (lemmaIsPrefixRefl!0 lt!75531))))

(declare-fun lt!75526 () Unit!3378)

(declare-fun lt!75532 () Unit!3378)

(assert (=> d!14866 (= lt!75526 lt!75532)))

(assert (=> d!14866 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14866 (= lt!75532 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!14866 (= lt!75531 (BitStream!1811 (buf!1394 (_2!2379 lt!74519)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)))))

(assert (=> d!14866 (isPrefixOf!0 thiss!1379 (_2!2379 lt!74519))))

(assert (=> d!14866 (= (reader!0 thiss!1379 (_2!2379 lt!74519)) lt!75542)))

(declare-fun lt!75538 () (_ BitVec 64))

(declare-fun b!48627 () Bool)

(declare-fun lt!75539 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1810 (_ BitVec 64)) BitStream!1810)

(assert (=> b!48627 (= e!32161 (= (_1!2380 lt!75542) (withMovedBitIndex!0 (_2!2380 lt!75542) (bvsub lt!75538 lt!75539))))))

(assert (=> b!48627 (or (= (bvand lt!75538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75538 lt!75539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48627 (= lt!75539 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))))))

(assert (=> b!48627 (= lt!75538 (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)))))

(declare-fun b!48628 () Bool)

(declare-fun res!40840 () Bool)

(assert (=> b!48628 (=> (not res!40840) (not e!32161))))

(assert (=> b!48628 (= res!40840 (isPrefixOf!0 (_1!2380 lt!75542) thiss!1379))))

(assert (= (and d!14866 c!3407) b!48626))

(assert (= (and d!14866 (not c!3407)) b!48624))

(assert (= (and d!14866 res!40839) b!48628))

(assert (= (and b!48628 res!40840) b!48625))

(assert (= (and b!48625 res!40841) b!48627))

(declare-fun m!75659 () Bool)

(assert (=> b!48625 m!75659))

(declare-fun m!75661 () Bool)

(assert (=> b!48627 m!75661))

(assert (=> b!48627 m!74797))

(assert (=> b!48627 m!74783))

(declare-fun m!75663 () Bool)

(assert (=> d!14866 m!75663))

(declare-fun m!75665 () Bool)

(assert (=> d!14866 m!75665))

(assert (=> d!14866 m!74781))

(declare-fun m!75667 () Bool)

(assert (=> d!14866 m!75667))

(declare-fun m!75669 () Bool)

(assert (=> d!14866 m!75669))

(assert (=> d!14866 m!74759))

(declare-fun m!75671 () Bool)

(assert (=> d!14866 m!75671))

(assert (=> d!14866 m!75635))

(assert (=> d!14866 m!74779))

(assert (=> d!14866 m!75633))

(declare-fun m!75673 () Bool)

(assert (=> d!14866 m!75673))

(declare-fun m!75675 () Bool)

(assert (=> b!48628 m!75675))

(assert (=> b!48626 m!74783))

(declare-fun m!75677 () Bool)

(assert (=> b!48626 m!75677))

(declare-fun m!75679 () Bool)

(assert (=> b!48626 m!75679))

(assert (=> b!48153 d!14866))

(declare-fun d!14868 () Bool)

(assert (=> d!14868 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3806 () Bool)

(assert (= bs!3806 d!14868))

(declare-fun m!75681 () Bool)

(assert (=> bs!3806 m!75681))

(assert (=> b!48153 d!14868))

(declare-fun d!14870 () Bool)

(assert (=> d!14870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75547 () Unit!3378)

(declare-fun choose!9 (BitStream!1810 array!2302 (_ BitVec 64) BitStream!1810) Unit!3378)

(assert (=> d!14870 (= lt!75547 (choose!9 thiss!1379 (buf!1394 (_2!2379 lt!74519)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1811 (buf!1394 (_2!2379 lt!74519)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379))))))

(assert (=> d!14870 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1394 (_2!2379 lt!74519)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!75547)))

(declare-fun bs!3807 () Bool)

(assert (= bs!3807 d!14870))

(assert (=> bs!3807 m!74813))

(declare-fun m!75683 () Bool)

(assert (=> bs!3807 m!75683))

(assert (=> b!48153 d!14870))

(declare-fun d!14872 () Bool)

(declare-fun size!1047 (List!546) Int)

(assert (=> d!14872 (= (length!241 lt!74521) (size!1047 lt!74521))))

(declare-fun bs!3808 () Bool)

(assert (= bs!3808 d!14872))

(declare-fun m!75685 () Bool)

(assert (=> bs!3808 m!75685))

(assert (=> b!48155 d!14872))

(declare-fun d!14874 () Bool)

(assert (=> d!14874 (= (array_inv!958 (buf!1394 thiss!1379)) (bvsge (size!1042 (buf!1394 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!48144 d!14874))

(declare-fun d!14876 () Bool)

(assert (=> d!14876 (= (invariant!0 (currentBit!2900 (_2!2379 lt!74519)) (currentByte!2905 (_2!2379 lt!74519)) (size!1042 (buf!1394 (_2!2379 lt!74522)))) (and (bvsge (currentBit!2900 (_2!2379 lt!74519)) #b00000000000000000000000000000000) (bvslt (currentBit!2900 (_2!2379 lt!74519)) #b00000000000000000000000000001000) (bvsge (currentByte!2905 (_2!2379 lt!74519)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2905 (_2!2379 lt!74519)) (size!1042 (buf!1394 (_2!2379 lt!74522)))) (and (= (currentBit!2900 (_2!2379 lt!74519)) #b00000000000000000000000000000000) (= (currentByte!2905 (_2!2379 lt!74519)) (size!1042 (buf!1394 (_2!2379 lt!74522))))))))))

(assert (=> b!48146 d!14876))

(declare-fun d!14878 () Bool)

(assert (=> d!14878 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 thiss!1379))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1042 (buf!1394 thiss!1379))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3809 () Bool)

(assert (= bs!3809 d!14878))

(declare-fun m!75687 () Bool)

(assert (=> bs!3809 m!75687))

(assert (=> b!48156 d!14878))

(declare-fun d!14880 () Bool)

(assert (=> d!14880 (= (head!365 lt!74521) (h!661 lt!74521))))

(assert (=> b!48145 d!14880))

(declare-fun d!14882 () Bool)

(assert (=> d!14882 (= (head!365 (byteArrayBitContentToList!0 (_2!2379 lt!74522) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!661 (byteArrayBitContentToList!0 (_2!2379 lt!74522) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!48158 d!14882))

(declare-fun d!14884 () Bool)

(declare-fun c!3410 () Bool)

(assert (=> d!14884 (= c!3410 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32164 () List!546)

(assert (=> d!14884 (= (byteArrayBitContentToList!0 (_2!2379 lt!74522) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!32164)))

(declare-fun b!48633 () Bool)

(assert (=> b!48633 (= e!32164 Nil!543)))

(declare-fun b!48634 () Bool)

(assert (=> b!48634 (= e!32164 (Cons!542 (not (= (bvand ((_ sign_extend 24) (select (arr!1565 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2379 lt!74522) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14884 c!3410) b!48633))

(assert (= (and d!14884 (not c!3410)) b!48634))

(assert (=> b!48634 m!74753))

(assert (=> b!48634 m!75553))

(declare-fun m!75689 () Bool)

(assert (=> b!48634 m!75689))

(assert (=> b!48158 d!14884))

(declare-fun d!14886 () Bool)

(assert (=> d!14886 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1565 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3810 () Bool)

(assert (= bs!3810 d!14886))

(assert (=> bs!3810 m!74753))

(assert (=> bs!3810 m!75553))

(assert (=> b!48158 d!14886))

(declare-fun d!14888 () Bool)

(declare-fun e!32167 () Bool)

(assert (=> d!14888 e!32167))

(declare-fun res!40847 () Bool)

(assert (=> d!14888 (=> (not res!40847) (not e!32167))))

(declare-fun lt!75563 () (_ BitVec 64))

(declare-fun lt!75564 () (_ BitVec 64))

(declare-fun lt!75560 () (_ BitVec 64))

(assert (=> d!14888 (= res!40847 (= lt!75560 (bvsub lt!75563 lt!75564)))))

(assert (=> d!14888 (or (= (bvand lt!75563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75564 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75563 lt!75564) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14888 (= lt!75564 (remainingBits!0 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519)))))))

(declare-fun lt!75561 () (_ BitVec 64))

(declare-fun lt!75562 () (_ BitVec 64))

(assert (=> d!14888 (= lt!75563 (bvmul lt!75561 lt!75562))))

(assert (=> d!14888 (or (= lt!75561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!75562 (bvsdiv (bvmul lt!75561 lt!75562) lt!75561)))))

(assert (=> d!14888 (= lt!75562 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14888 (= lt!75561 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))))))

(assert (=> d!14888 (= lt!75560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519)))))))

(assert (=> d!14888 (invariant!0 (currentBit!2900 (_2!2379 lt!74519)) (currentByte!2905 (_2!2379 lt!74519)) (size!1042 (buf!1394 (_2!2379 lt!74519))))))

(assert (=> d!14888 (= (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))) lt!75560)))

(declare-fun b!48639 () Bool)

(declare-fun res!40846 () Bool)

(assert (=> b!48639 (=> (not res!40846) (not e!32167))))

(assert (=> b!48639 (= res!40846 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!75560))))

(declare-fun b!48640 () Bool)

(declare-fun lt!75565 () (_ BitVec 64))

(assert (=> b!48640 (= e!32167 (bvsle lt!75560 (bvmul lt!75565 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48640 (or (= lt!75565 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!75565 #b0000000000000000000000000000000000000000000000000000000000001000) lt!75565)))))

(assert (=> b!48640 (= lt!75565 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74519)))))))

(assert (= (and d!14888 res!40847) b!48639))

(assert (= (and b!48639 res!40846) b!48640))

(assert (=> d!14888 m!75529))

(assert (=> d!14888 m!74789))

(assert (=> b!48147 d!14888))

(declare-fun d!14890 () Bool)

(assert (=> d!14890 (= (tail!232 lt!74521) (t!1296 lt!74521))))

(assert (=> b!48157 d!14890))

(declare-fun d!14892 () Bool)

(declare-fun e!32170 () Bool)

(assert (=> d!14892 e!32170))

(declare-fun res!40850 () Bool)

(assert (=> d!14892 (=> (not res!40850) (not e!32170))))

(declare-fun lt!75571 () (_ BitVec 64))

(assert (=> d!14892 (= res!40850 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75571 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!75571) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!14892 (= lt!75571 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75570 () Unit!3378)

(declare-fun choose!42 (BitStream!1810 BitStream!1810 BitStream!1810 BitStream!1810 (_ BitVec 64) List!546) Unit!3378)

(assert (=> d!14892 (= lt!75570 (choose!42 (_2!2379 lt!74522) (_2!2379 lt!74522) (_1!2380 lt!74523) (_1!2380 lt!74518) (bvsub to!314 i!635) lt!74521))))

(assert (=> d!14892 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14892 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2379 lt!74522) (_2!2379 lt!74522) (_1!2380 lt!74523) (_1!2380 lt!74518) (bvsub to!314 i!635) lt!74521) lt!75570)))

(declare-fun b!48643 () Bool)

(assert (=> b!48643 (= e!32170 (= (bitStreamReadBitsIntoList!0 (_2!2379 lt!74522) (_1!2380 lt!74518) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!232 lt!74521)))))

(assert (= (and d!14892 res!40850) b!48643))

(declare-fun m!75691 () Bool)

(assert (=> d!14892 m!75691))

(declare-fun m!75693 () Bool)

(assert (=> b!48643 m!75693))

(assert (=> b!48643 m!74763))

(assert (=> b!48157 d!14892))

(declare-fun d!14894 () Bool)

(declare-fun res!40852 () Bool)

(declare-fun e!32172 () Bool)

(assert (=> d!14894 (=> (not res!40852) (not e!32172))))

(assert (=> d!14894 (= res!40852 (= (size!1042 (buf!1394 thiss!1379)) (size!1042 (buf!1394 thiss!1379))))))

(assert (=> d!14894 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!32172)))

(declare-fun b!48644 () Bool)

(declare-fun res!40853 () Bool)

(assert (=> b!48644 (=> (not res!40853) (not e!32172))))

(assert (=> b!48644 (= res!40853 (bvsle (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)) (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379))))))

(declare-fun b!48645 () Bool)

(declare-fun e!32171 () Bool)

(assert (=> b!48645 (= e!32172 e!32171)))

(declare-fun res!40851 () Bool)

(assert (=> b!48645 (=> res!40851 e!32171)))

(assert (=> b!48645 (= res!40851 (= (size!1042 (buf!1394 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48646 () Bool)

(assert (=> b!48646 (= e!32171 (arrayBitRangesEq!0 (buf!1394 thiss!1379) (buf!1394 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379))))))

(assert (= (and d!14894 res!40852) b!48644))

(assert (= (and b!48644 res!40853) b!48645))

(assert (= (and b!48645 (not res!40851)) b!48646))

(assert (=> b!48644 m!74783))

(assert (=> b!48644 m!74783))

(assert (=> b!48646 m!74783))

(assert (=> b!48646 m!74783))

(declare-fun m!75695 () Bool)

(assert (=> b!48646 m!75695))

(assert (=> b!48159 d!14894))

(declare-fun d!14896 () Bool)

(assert (=> d!14896 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!75574 () Unit!3378)

(declare-fun choose!11 (BitStream!1810) Unit!3378)

(assert (=> d!14896 (= lt!75574 (choose!11 thiss!1379))))

(assert (=> d!14896 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!75574)))

(declare-fun bs!3812 () Bool)

(assert (= bs!3812 d!14896))

(assert (=> bs!3812 m!74779))

(declare-fun m!75697 () Bool)

(assert (=> bs!3812 m!75697))

(assert (=> b!48159 d!14896))

(declare-fun d!14898 () Bool)

(declare-fun e!32173 () Bool)

(assert (=> d!14898 e!32173))

(declare-fun res!40855 () Bool)

(assert (=> d!14898 (=> (not res!40855) (not e!32173))))

(declare-fun lt!75578 () (_ BitVec 64))

(declare-fun lt!75575 () (_ BitVec 64))

(declare-fun lt!75579 () (_ BitVec 64))

(assert (=> d!14898 (= res!40855 (= lt!75575 (bvsub lt!75578 lt!75579)))))

(assert (=> d!14898 (or (= (bvand lt!75578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75578 lt!75579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14898 (= lt!75579 (remainingBits!0 ((_ sign_extend 32) (size!1042 (buf!1394 thiss!1379))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379))))))

(declare-fun lt!75576 () (_ BitVec 64))

(declare-fun lt!75577 () (_ BitVec 64))

(assert (=> d!14898 (= lt!75578 (bvmul lt!75576 lt!75577))))

(assert (=> d!14898 (or (= lt!75576 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!75577 (bvsdiv (bvmul lt!75576 lt!75577) lt!75576)))))

(assert (=> d!14898 (= lt!75577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14898 (= lt!75576 ((_ sign_extend 32) (size!1042 (buf!1394 thiss!1379))))))

(assert (=> d!14898 (= lt!75575 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2905 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2900 thiss!1379))))))

(assert (=> d!14898 (invariant!0 (currentBit!2900 thiss!1379) (currentByte!2905 thiss!1379) (size!1042 (buf!1394 thiss!1379)))))

(assert (=> d!14898 (= (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)) lt!75575)))

(declare-fun b!48647 () Bool)

(declare-fun res!40854 () Bool)

(assert (=> b!48647 (=> (not res!40854) (not e!32173))))

(assert (=> b!48647 (= res!40854 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!75575))))

(declare-fun b!48648 () Bool)

(declare-fun lt!75580 () (_ BitVec 64))

(assert (=> b!48648 (= e!32173 (bvsle lt!75575 (bvmul lt!75580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48648 (or (= lt!75580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!75580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!75580)))))

(assert (=> b!48648 (= lt!75580 ((_ sign_extend 32) (size!1042 (buf!1394 thiss!1379))))))

(assert (= (and d!14898 res!40855) b!48647))

(assert (= (and b!48647 res!40854) b!48648))

(assert (=> d!14898 m!75687))

(declare-fun m!75699 () Bool)

(assert (=> d!14898 m!75699))

(assert (=> b!48159 d!14898))

(declare-fun d!14900 () Bool)

(assert (=> d!14900 (= (bitAt!0 (buf!1394 (_1!2380 lt!74518)) lt!74514) (not (= (bvand ((_ sign_extend 24) (select (arr!1565 (buf!1394 (_1!2380 lt!74518))) ((_ extract 31 0) (bvsdiv lt!74514 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!74514 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3813 () Bool)

(assert (= bs!3813 d!14900))

(declare-fun m!75701 () Bool)

(assert (=> bs!3813 m!75701))

(declare-fun m!75703 () Bool)

(assert (=> bs!3813 m!75703))

(assert (=> b!48148 d!14900))

(declare-fun d!14902 () Bool)

(assert (=> d!14902 (= (bitAt!0 (buf!1394 (_1!2380 lt!74523)) lt!74514) (not (= (bvand ((_ sign_extend 24) (select (arr!1565 (buf!1394 (_1!2380 lt!74523))) ((_ extract 31 0) (bvsdiv lt!74514 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!74514 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3814 () Bool)

(assert (= bs!3814 d!14902))

(declare-fun m!75705 () Bool)

(assert (=> bs!3814 m!75705))

(assert (=> bs!3814 m!75703))

(assert (=> b!48148 d!14902))

(declare-fun d!14904 () Bool)

(assert (=> d!14904 (= (invariant!0 (currentBit!2900 (_2!2379 lt!74522)) (currentByte!2905 (_2!2379 lt!74522)) (size!1042 (buf!1394 (_2!2379 lt!74522)))) (and (bvsge (currentBit!2900 (_2!2379 lt!74522)) #b00000000000000000000000000000000) (bvslt (currentBit!2900 (_2!2379 lt!74522)) #b00000000000000000000000000001000) (bvsge (currentByte!2905 (_2!2379 lt!74522)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2905 (_2!2379 lt!74522)) (size!1042 (buf!1394 (_2!2379 lt!74522)))) (and (= (currentBit!2900 (_2!2379 lt!74522)) #b00000000000000000000000000000000) (= (currentByte!2905 (_2!2379 lt!74522)) (size!1042 (buf!1394 (_2!2379 lt!74522))))))))))

(assert (=> b!48150 d!14904))

(declare-fun d!14906 () Bool)

(declare-fun e!32174 () Bool)

(assert (=> d!14906 e!32174))

(declare-fun res!40857 () Bool)

(assert (=> d!14906 (=> (not res!40857) (not e!32174))))

(declare-fun lt!75584 () (_ BitVec 64))

(declare-fun lt!75585 () (_ BitVec 64))

(declare-fun lt!75581 () (_ BitVec 64))

(assert (=> d!14906 (= res!40857 (= lt!75581 (bvsub lt!75584 lt!75585)))))

(assert (=> d!14906 (or (= (bvand lt!75584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75585 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75584 lt!75585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14906 (= lt!75585 (remainingBits!0 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74522))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74522)))))))

(declare-fun lt!75582 () (_ BitVec 64))

(declare-fun lt!75583 () (_ BitVec 64))

(assert (=> d!14906 (= lt!75584 (bvmul lt!75582 lt!75583))))

(assert (=> d!14906 (or (= lt!75582 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!75583 (bvsdiv (bvmul lt!75582 lt!75583) lt!75582)))))

(assert (=> d!14906 (= lt!75583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14906 (= lt!75582 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))))))

(assert (=> d!14906 (= lt!75581 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74522))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74522)))))))

(assert (=> d!14906 (invariant!0 (currentBit!2900 (_2!2379 lt!74522)) (currentByte!2905 (_2!2379 lt!74522)) (size!1042 (buf!1394 (_2!2379 lt!74522))))))

(assert (=> d!14906 (= (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74522))) (currentByte!2905 (_2!2379 lt!74522)) (currentBit!2900 (_2!2379 lt!74522))) lt!75581)))

(declare-fun b!48649 () Bool)

(declare-fun res!40856 () Bool)

(assert (=> b!48649 (=> (not res!40856) (not e!32174))))

(assert (=> b!48649 (= res!40856 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!75581))))

(declare-fun b!48650 () Bool)

(declare-fun lt!75586 () (_ BitVec 64))

(assert (=> b!48650 (= e!32174 (bvsle lt!75581 (bvmul lt!75586 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48650 (or (= lt!75586 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!75586 #b0000000000000000000000000000000000000000000000000000000000001000) lt!75586)))))

(assert (=> b!48650 (= lt!75586 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))))))

(assert (= (and d!14906 res!40857) b!48649))

(assert (= (and b!48649 res!40856) b!48650))

(declare-fun m!75707 () Bool)

(assert (=> d!14906 m!75707))

(assert (=> d!14906 m!74815))

(assert (=> b!48149 d!14906))

(declare-fun d!14908 () Bool)

(assert (=> d!14908 (= (head!365 (byteArrayBitContentToList!0 (_2!2379 lt!74519) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!661 (byteArrayBitContentToList!0 (_2!2379 lt!74519) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48151 d!14908))

(declare-fun d!14910 () Bool)

(declare-fun c!3411 () Bool)

(assert (=> d!14910 (= c!3411 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32175 () List!546)

(assert (=> d!14910 (= (byteArrayBitContentToList!0 (_2!2379 lt!74519) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!32175)))

(declare-fun b!48651 () Bool)

(assert (=> b!48651 (= e!32175 Nil!543)))

(declare-fun b!48652 () Bool)

(assert (=> b!48652 (= e!32175 (Cons!542 (not (= (bvand ((_ sign_extend 24) (select (arr!1565 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2379 lt!74519) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14910 c!3411) b!48651))

(assert (= (and d!14910 (not c!3411)) b!48652))

(assert (=> b!48652 m!74753))

(assert (=> b!48652 m!75553))

(declare-fun m!75709 () Bool)

(assert (=> b!48652 m!75709))

(assert (=> b!48151 d!14910))

(declare-fun d!14912 () Bool)

(assert (=> d!14912 (= (head!365 (bitStreamReadBitsIntoList!0 (_2!2379 lt!74519) (_1!2380 lt!74516) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!661 (bitStreamReadBitsIntoList!0 (_2!2379 lt!74519) (_1!2380 lt!74516) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48151 d!14912))

(declare-fun b!48664 () Bool)

(declare-fun e!32181 () Bool)

(declare-fun lt!75594 () List!546)

(assert (=> b!48664 (= e!32181 (> (length!241 lt!75594) 0))))

(declare-fun b!48663 () Bool)

(declare-fun isEmpty!142 (List!546) Bool)

(assert (=> b!48663 (= e!32181 (isEmpty!142 lt!75594))))

(declare-fun b!48661 () Bool)

(declare-datatypes ((tuple2!4592 0))(
  ( (tuple2!4593 (_1!2395 List!546) (_2!2395 BitStream!1810)) )
))
(declare-fun e!32180 () tuple2!4592)

(assert (=> b!48661 (= e!32180 (tuple2!4593 Nil!543 (_1!2380 lt!74516)))))

(declare-datatypes ((tuple2!4594 0))(
  ( (tuple2!4595 (_1!2396 Bool) (_2!2396 BitStream!1810)) )
))
(declare-fun lt!75595 () tuple2!4594)

(declare-fun lt!75593 () (_ BitVec 64))

(declare-fun b!48662 () Bool)

(assert (=> b!48662 (= e!32180 (tuple2!4593 (Cons!542 (_1!2396 lt!75595) (bitStreamReadBitsIntoList!0 (_2!2379 lt!74519) (_2!2396 lt!75595) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!75593))) (_2!2396 lt!75595)))))

(declare-fun readBit!0 (BitStream!1810) tuple2!4594)

(assert (=> b!48662 (= lt!75595 (readBit!0 (_1!2380 lt!74516)))))

(assert (=> b!48662 (= lt!75593 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14914 () Bool)

(assert (=> d!14914 e!32181))

(declare-fun c!3416 () Bool)

(assert (=> d!14914 (= c!3416 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14914 (= lt!75594 (_1!2395 e!32180))))

(declare-fun c!3417 () Bool)

(assert (=> d!14914 (= c!3417 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14914 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14914 (= (bitStreamReadBitsIntoList!0 (_2!2379 lt!74519) (_1!2380 lt!74516) #b0000000000000000000000000000000000000000000000000000000000000001) lt!75594)))

(assert (= (and d!14914 c!3417) b!48661))

(assert (= (and d!14914 (not c!3417)) b!48662))

(assert (= (and d!14914 c!3416) b!48663))

(assert (= (and d!14914 (not c!3416)) b!48664))

(declare-fun m!75711 () Bool)

(assert (=> b!48664 m!75711))

(declare-fun m!75713 () Bool)

(assert (=> b!48663 m!75713))

(declare-fun m!75715 () Bool)

(assert (=> b!48662 m!75715))

(declare-fun m!75717 () Bool)

(assert (=> b!48662 m!75717))

(assert (=> b!48151 d!14914))

(declare-fun d!14916 () Bool)

(assert (=> d!14916 (= (array_inv!958 srcBuffer!2) (bvsge (size!1042 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9638 d!14916))

(declare-fun d!14918 () Bool)

(assert (=> d!14918 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2900 thiss!1379) (currentByte!2905 thiss!1379) (size!1042 (buf!1394 thiss!1379))))))

(declare-fun bs!3815 () Bool)

(assert (= bs!3815 d!14918))

(assert (=> bs!3815 m!75699))

(assert (=> start!9638 d!14918))

(declare-fun b!48665 () Bool)

(declare-fun e!32182 () Unit!3378)

(declare-fun Unit!3412 () Unit!3378)

(assert (=> b!48665 (= e!32182 Unit!3412)))

(declare-fun b!48666 () Bool)

(declare-fun res!40860 () Bool)

(declare-fun e!32183 () Bool)

(assert (=> b!48666 (=> (not res!40860) (not e!32183))))

(declare-fun lt!75613 () tuple2!4562)

(assert (=> b!48666 (= res!40860 (isPrefixOf!0 (_2!2380 lt!75613) (_2!2379 lt!74522)))))

(declare-fun b!48667 () Bool)

(declare-fun lt!75606 () Unit!3378)

(assert (=> b!48667 (= e!32182 lt!75606)))

(declare-fun lt!75607 () (_ BitVec 64))

(assert (=> b!48667 (= lt!75607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75599 () (_ BitVec 64))

(assert (=> b!48667 (= lt!75599 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))))))

(assert (=> b!48667 (= lt!75606 (arrayBitRangesEqSymmetric!0 (buf!1394 (_2!2379 lt!74519)) (buf!1394 (_2!2379 lt!74522)) lt!75607 lt!75599))))

(assert (=> b!48667 (arrayBitRangesEq!0 (buf!1394 (_2!2379 lt!74522)) (buf!1394 (_2!2379 lt!74519)) lt!75607 lt!75599)))

(declare-fun d!14920 () Bool)

(assert (=> d!14920 e!32183))

(declare-fun res!40858 () Bool)

(assert (=> d!14920 (=> (not res!40858) (not e!32183))))

(assert (=> d!14920 (= res!40858 (isPrefixOf!0 (_1!2380 lt!75613) (_2!2380 lt!75613)))))

(declare-fun lt!75602 () BitStream!1810)

(assert (=> d!14920 (= lt!75613 (tuple2!4563 lt!75602 (_2!2379 lt!74522)))))

(declare-fun lt!75601 () Unit!3378)

(declare-fun lt!75604 () Unit!3378)

(assert (=> d!14920 (= lt!75601 lt!75604)))

(assert (=> d!14920 (isPrefixOf!0 lt!75602 (_2!2379 lt!74522))))

(assert (=> d!14920 (= lt!75604 (lemmaIsPrefixTransitive!0 lt!75602 (_2!2379 lt!74522) (_2!2379 lt!74522)))))

(declare-fun lt!75600 () Unit!3378)

(declare-fun lt!75611 () Unit!3378)

(assert (=> d!14920 (= lt!75600 lt!75611)))

(assert (=> d!14920 (isPrefixOf!0 lt!75602 (_2!2379 lt!74522))))

(assert (=> d!14920 (= lt!75611 (lemmaIsPrefixTransitive!0 lt!75602 (_2!2379 lt!74519) (_2!2379 lt!74522)))))

(declare-fun lt!75598 () Unit!3378)

(assert (=> d!14920 (= lt!75598 e!32182)))

(declare-fun c!3418 () Bool)

(assert (=> d!14920 (= c!3418 (not (= (size!1042 (buf!1394 (_2!2379 lt!74519))) #b00000000000000000000000000000000)))))

(declare-fun lt!75612 () Unit!3378)

(declare-fun lt!75615 () Unit!3378)

(assert (=> d!14920 (= lt!75612 lt!75615)))

(assert (=> d!14920 (isPrefixOf!0 (_2!2379 lt!74522) (_2!2379 lt!74522))))

(assert (=> d!14920 (= lt!75615 (lemmaIsPrefixRefl!0 (_2!2379 lt!74522)))))

(declare-fun lt!75614 () Unit!3378)

(declare-fun lt!75605 () Unit!3378)

(assert (=> d!14920 (= lt!75614 lt!75605)))

(assert (=> d!14920 (= lt!75605 (lemmaIsPrefixRefl!0 (_2!2379 lt!74522)))))

(declare-fun lt!75608 () Unit!3378)

(declare-fun lt!75596 () Unit!3378)

(assert (=> d!14920 (= lt!75608 lt!75596)))

(assert (=> d!14920 (isPrefixOf!0 lt!75602 lt!75602)))

(assert (=> d!14920 (= lt!75596 (lemmaIsPrefixRefl!0 lt!75602))))

(declare-fun lt!75597 () Unit!3378)

(declare-fun lt!75603 () Unit!3378)

(assert (=> d!14920 (= lt!75597 lt!75603)))

(assert (=> d!14920 (isPrefixOf!0 (_2!2379 lt!74519) (_2!2379 lt!74519))))

(assert (=> d!14920 (= lt!75603 (lemmaIsPrefixRefl!0 (_2!2379 lt!74519)))))

(assert (=> d!14920 (= lt!75602 (BitStream!1811 (buf!1394 (_2!2379 lt!74522)) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))))))

(assert (=> d!14920 (isPrefixOf!0 (_2!2379 lt!74519) (_2!2379 lt!74522))))

(assert (=> d!14920 (= (reader!0 (_2!2379 lt!74519) (_2!2379 lt!74522)) lt!75613)))

(declare-fun lt!75609 () (_ BitVec 64))

(declare-fun b!48668 () Bool)

(declare-fun lt!75610 () (_ BitVec 64))

(assert (=> b!48668 (= e!32183 (= (_1!2380 lt!75613) (withMovedBitIndex!0 (_2!2380 lt!75613) (bvsub lt!75609 lt!75610))))))

(assert (=> b!48668 (or (= (bvand lt!75609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75609 lt!75610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48668 (= lt!75610 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74522))) (currentByte!2905 (_2!2379 lt!74522)) (currentBit!2900 (_2!2379 lt!74522))))))

(assert (=> b!48668 (= lt!75609 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74519))) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519))))))

(declare-fun b!48669 () Bool)

(declare-fun res!40859 () Bool)

(assert (=> b!48669 (=> (not res!40859) (not e!32183))))

(assert (=> b!48669 (= res!40859 (isPrefixOf!0 (_1!2380 lt!75613) (_2!2379 lt!74519)))))

(assert (= (and d!14920 c!3418) b!48667))

(assert (= (and d!14920 (not c!3418)) b!48665))

(assert (= (and d!14920 res!40858) b!48669))

(assert (= (and b!48669 res!40859) b!48666))

(assert (= (and b!48666 res!40860) b!48668))

(declare-fun m!75719 () Bool)

(assert (=> b!48666 m!75719))

(declare-fun m!75721 () Bool)

(assert (=> b!48668 m!75721))

(assert (=> b!48668 m!74817))

(assert (=> b!48668 m!74797))

(declare-fun m!75723 () Bool)

(assert (=> d!14920 m!75723))

(declare-fun m!75725 () Bool)

(assert (=> d!14920 m!75725))

(assert (=> d!14920 m!75635))

(declare-fun m!75727 () Bool)

(assert (=> d!14920 m!75727))

(declare-fun m!75729 () Bool)

(assert (=> d!14920 m!75729))

(assert (=> d!14920 m!74807))

(declare-fun m!75731 () Bool)

(assert (=> d!14920 m!75731))

(declare-fun m!75733 () Bool)

(assert (=> d!14920 m!75733))

(assert (=> d!14920 m!75633))

(declare-fun m!75735 () Bool)

(assert (=> d!14920 m!75735))

(declare-fun m!75737 () Bool)

(assert (=> d!14920 m!75737))

(declare-fun m!75739 () Bool)

(assert (=> b!48669 m!75739))

(assert (=> b!48667 m!74797))

(declare-fun m!75741 () Bool)

(assert (=> b!48667 m!75741))

(declare-fun m!75743 () Bool)

(assert (=> b!48667 m!75743))

(assert (=> b!48152 d!14920))

(declare-fun d!14922 () Bool)

(assert (=> d!14922 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!75616 () Unit!3378)

(assert (=> d!14922 (= lt!75616 (choose!9 thiss!1379 (buf!1394 (_2!2379 lt!74522)) (bvsub to!314 i!635) (BitStream!1811 (buf!1394 (_2!2379 lt!74522)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379))))))

(assert (=> d!14922 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1394 (_2!2379 lt!74522)) (bvsub to!314 i!635)) lt!75616)))

(declare-fun bs!3816 () Bool)

(assert (= bs!3816 d!14922))

(assert (=> bs!3816 m!74749))

(declare-fun m!75745 () Bool)

(assert (=> bs!3816 m!75745))

(assert (=> b!48152 d!14922))

(declare-fun d!14924 () Bool)

(assert (=> d!14924 (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) lt!74527)))

(declare-fun lt!75617 () Unit!3378)

(assert (=> d!14924 (= lt!75617 (choose!9 (_2!2379 lt!74519) (buf!1394 (_2!2379 lt!74522)) lt!74527 (BitStream!1811 (buf!1394 (_2!2379 lt!74522)) (currentByte!2905 (_2!2379 lt!74519)) (currentBit!2900 (_2!2379 lt!74519)))))))

(assert (=> d!14924 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2379 lt!74519) (buf!1394 (_2!2379 lt!74522)) lt!74527) lt!75617)))

(declare-fun bs!3817 () Bool)

(assert (= bs!3817 d!14924))

(assert (=> bs!3817 m!74739))

(declare-fun m!75747 () Bool)

(assert (=> bs!3817 m!75747))

(assert (=> b!48152 d!14924))

(declare-fun d!14926 () Bool)

(assert (=> d!14926 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))) ((_ sign_extend 32) (currentByte!2905 thiss!1379)) ((_ sign_extend 32) (currentBit!2900 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3818 () Bool)

(assert (= bs!3818 d!14926))

(declare-fun m!75749 () Bool)

(assert (=> bs!3818 m!75749))

(assert (=> b!48152 d!14926))

(declare-fun b!48670 () Bool)

(declare-fun e!32184 () Unit!3378)

(declare-fun Unit!3413 () Unit!3378)

(assert (=> b!48670 (= e!32184 Unit!3413)))

(declare-fun b!48671 () Bool)

(declare-fun res!40863 () Bool)

(declare-fun e!32185 () Bool)

(assert (=> b!48671 (=> (not res!40863) (not e!32185))))

(declare-fun lt!75635 () tuple2!4562)

(assert (=> b!48671 (= res!40863 (isPrefixOf!0 (_2!2380 lt!75635) (_2!2379 lt!74522)))))

(declare-fun b!48672 () Bool)

(declare-fun lt!75628 () Unit!3378)

(assert (=> b!48672 (= e!32184 lt!75628)))

(declare-fun lt!75629 () (_ BitVec 64))

(assert (=> b!48672 (= lt!75629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75621 () (_ BitVec 64))

(assert (=> b!48672 (= lt!75621 (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)))))

(assert (=> b!48672 (= lt!75628 (arrayBitRangesEqSymmetric!0 (buf!1394 thiss!1379) (buf!1394 (_2!2379 lt!74522)) lt!75629 lt!75621))))

(assert (=> b!48672 (arrayBitRangesEq!0 (buf!1394 (_2!2379 lt!74522)) (buf!1394 thiss!1379) lt!75629 lt!75621)))

(declare-fun d!14928 () Bool)

(assert (=> d!14928 e!32185))

(declare-fun res!40861 () Bool)

(assert (=> d!14928 (=> (not res!40861) (not e!32185))))

(assert (=> d!14928 (= res!40861 (isPrefixOf!0 (_1!2380 lt!75635) (_2!2380 lt!75635)))))

(declare-fun lt!75624 () BitStream!1810)

(assert (=> d!14928 (= lt!75635 (tuple2!4563 lt!75624 (_2!2379 lt!74522)))))

(declare-fun lt!75623 () Unit!3378)

(declare-fun lt!75626 () Unit!3378)

(assert (=> d!14928 (= lt!75623 lt!75626)))

(assert (=> d!14928 (isPrefixOf!0 lt!75624 (_2!2379 lt!74522))))

(assert (=> d!14928 (= lt!75626 (lemmaIsPrefixTransitive!0 lt!75624 (_2!2379 lt!74522) (_2!2379 lt!74522)))))

(declare-fun lt!75622 () Unit!3378)

(declare-fun lt!75633 () Unit!3378)

(assert (=> d!14928 (= lt!75622 lt!75633)))

(assert (=> d!14928 (isPrefixOf!0 lt!75624 (_2!2379 lt!74522))))

(assert (=> d!14928 (= lt!75633 (lemmaIsPrefixTransitive!0 lt!75624 thiss!1379 (_2!2379 lt!74522)))))

(declare-fun lt!75620 () Unit!3378)

(assert (=> d!14928 (= lt!75620 e!32184)))

(declare-fun c!3419 () Bool)

(assert (=> d!14928 (= c!3419 (not (= (size!1042 (buf!1394 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!75634 () Unit!3378)

(declare-fun lt!75637 () Unit!3378)

(assert (=> d!14928 (= lt!75634 lt!75637)))

(assert (=> d!14928 (isPrefixOf!0 (_2!2379 lt!74522) (_2!2379 lt!74522))))

(assert (=> d!14928 (= lt!75637 (lemmaIsPrefixRefl!0 (_2!2379 lt!74522)))))

(declare-fun lt!75636 () Unit!3378)

(declare-fun lt!75627 () Unit!3378)

(assert (=> d!14928 (= lt!75636 lt!75627)))

(assert (=> d!14928 (= lt!75627 (lemmaIsPrefixRefl!0 (_2!2379 lt!74522)))))

(declare-fun lt!75630 () Unit!3378)

(declare-fun lt!75618 () Unit!3378)

(assert (=> d!14928 (= lt!75630 lt!75618)))

(assert (=> d!14928 (isPrefixOf!0 lt!75624 lt!75624)))

(assert (=> d!14928 (= lt!75618 (lemmaIsPrefixRefl!0 lt!75624))))

(declare-fun lt!75619 () Unit!3378)

(declare-fun lt!75625 () Unit!3378)

(assert (=> d!14928 (= lt!75619 lt!75625)))

(assert (=> d!14928 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14928 (= lt!75625 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!14928 (= lt!75624 (BitStream!1811 (buf!1394 (_2!2379 lt!74522)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)))))

(assert (=> d!14928 (isPrefixOf!0 thiss!1379 (_2!2379 lt!74522))))

(assert (=> d!14928 (= (reader!0 thiss!1379 (_2!2379 lt!74522)) lt!75635)))

(declare-fun b!48673 () Bool)

(declare-fun lt!75632 () (_ BitVec 64))

(declare-fun lt!75631 () (_ BitVec 64))

(assert (=> b!48673 (= e!32185 (= (_1!2380 lt!75635) (withMovedBitIndex!0 (_2!2380 lt!75635) (bvsub lt!75631 lt!75632))))))

(assert (=> b!48673 (or (= (bvand lt!75631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75632 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75631 lt!75632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48673 (= lt!75632 (bitIndex!0 (size!1042 (buf!1394 (_2!2379 lt!74522))) (currentByte!2905 (_2!2379 lt!74522)) (currentBit!2900 (_2!2379 lt!74522))))))

(assert (=> b!48673 (= lt!75631 (bitIndex!0 (size!1042 (buf!1394 thiss!1379)) (currentByte!2905 thiss!1379) (currentBit!2900 thiss!1379)))))

(declare-fun b!48674 () Bool)

(declare-fun res!40862 () Bool)

(assert (=> b!48674 (=> (not res!40862) (not e!32185))))

(assert (=> b!48674 (= res!40862 (isPrefixOf!0 (_1!2380 lt!75635) thiss!1379))))

(assert (= (and d!14928 c!3419) b!48672))

(assert (= (and d!14928 (not c!3419)) b!48670))

(assert (= (and d!14928 res!40861) b!48674))

(assert (= (and b!48674 res!40862) b!48671))

(assert (= (and b!48671 res!40863) b!48673))

(declare-fun m!75751 () Bool)

(assert (=> b!48671 m!75751))

(declare-fun m!75753 () Bool)

(assert (=> b!48673 m!75753))

(assert (=> b!48673 m!74817))

(assert (=> b!48673 m!74783))

(declare-fun m!75755 () Bool)

(assert (=> d!14928 m!75755))

(declare-fun m!75757 () Bool)

(assert (=> d!14928 m!75757))

(assert (=> d!14928 m!74781))

(declare-fun m!75759 () Bool)

(assert (=> d!14928 m!75759))

(declare-fun m!75761 () Bool)

(assert (=> d!14928 m!75761))

(assert (=> d!14928 m!74811))

(declare-fun m!75763 () Bool)

(assert (=> d!14928 m!75763))

(assert (=> d!14928 m!75733))

(assert (=> d!14928 m!74779))

(assert (=> d!14928 m!75735))

(declare-fun m!75765 () Bool)

(assert (=> d!14928 m!75765))

(declare-fun m!75767 () Bool)

(assert (=> b!48674 m!75767))

(assert (=> b!48672 m!74783))

(declare-fun m!75769 () Bool)

(assert (=> b!48672 m!75769))

(declare-fun m!75771 () Bool)

(assert (=> b!48672 m!75771))

(assert (=> b!48152 d!14928))

(declare-fun b!48678 () Bool)

(declare-fun e!32187 () Bool)

(declare-fun lt!75639 () List!546)

(assert (=> b!48678 (= e!32187 (> (length!241 lt!75639) 0))))

(declare-fun b!48677 () Bool)

(assert (=> b!48677 (= e!32187 (isEmpty!142 lt!75639))))

(declare-fun b!48675 () Bool)

(declare-fun e!32186 () tuple2!4592)

(assert (=> b!48675 (= e!32186 (tuple2!4593 Nil!543 (_1!2380 lt!74523)))))

(declare-fun b!48676 () Bool)

(declare-fun lt!75638 () (_ BitVec 64))

(declare-fun lt!75640 () tuple2!4594)

(assert (=> b!48676 (= e!32186 (tuple2!4593 (Cons!542 (_1!2396 lt!75640) (bitStreamReadBitsIntoList!0 (_2!2379 lt!74522) (_2!2396 lt!75640) (bvsub (bvsub to!314 i!635) lt!75638))) (_2!2396 lt!75640)))))

(assert (=> b!48676 (= lt!75640 (readBit!0 (_1!2380 lt!74523)))))

(assert (=> b!48676 (= lt!75638 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14930 () Bool)

(assert (=> d!14930 e!32187))

(declare-fun c!3420 () Bool)

(assert (=> d!14930 (= c!3420 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14930 (= lt!75639 (_1!2395 e!32186))))

(declare-fun c!3421 () Bool)

(assert (=> d!14930 (= c!3421 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14930 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14930 (= (bitStreamReadBitsIntoList!0 (_2!2379 lt!74522) (_1!2380 lt!74523) (bvsub to!314 i!635)) lt!75639)))

(assert (= (and d!14930 c!3421) b!48675))

(assert (= (and d!14930 (not c!3421)) b!48676))

(assert (= (and d!14930 c!3420) b!48677))

(assert (= (and d!14930 (not c!3420)) b!48678))

(declare-fun m!75773 () Bool)

(assert (=> b!48678 m!75773))

(declare-fun m!75775 () Bool)

(assert (=> b!48677 m!75775))

(declare-fun m!75777 () Bool)

(assert (=> b!48676 m!75777))

(declare-fun m!75779 () Bool)

(assert (=> b!48676 m!75779))

(assert (=> b!48152 d!14930))

(declare-fun b!48682 () Bool)

(declare-fun e!32189 () Bool)

(declare-fun lt!75642 () List!546)

(assert (=> b!48682 (= e!32189 (> (length!241 lt!75642) 0))))

(declare-fun b!48681 () Bool)

(assert (=> b!48681 (= e!32189 (isEmpty!142 lt!75642))))

(declare-fun b!48679 () Bool)

(declare-fun e!32188 () tuple2!4592)

(assert (=> b!48679 (= e!32188 (tuple2!4593 Nil!543 (_1!2380 lt!74518)))))

(declare-fun lt!75641 () (_ BitVec 64))

(declare-fun lt!75643 () tuple2!4594)

(declare-fun b!48680 () Bool)

(assert (=> b!48680 (= e!32188 (tuple2!4593 (Cons!542 (_1!2396 lt!75643) (bitStreamReadBitsIntoList!0 (_2!2379 lt!74522) (_2!2396 lt!75643) (bvsub lt!74527 lt!75641))) (_2!2396 lt!75643)))))

(assert (=> b!48680 (= lt!75643 (readBit!0 (_1!2380 lt!74518)))))

(assert (=> b!48680 (= lt!75641 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14932 () Bool)

(assert (=> d!14932 e!32189))

(declare-fun c!3422 () Bool)

(assert (=> d!14932 (= c!3422 (= lt!74527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14932 (= lt!75642 (_1!2395 e!32188))))

(declare-fun c!3423 () Bool)

(assert (=> d!14932 (= c!3423 (= lt!74527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14932 (bvsge lt!74527 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14932 (= (bitStreamReadBitsIntoList!0 (_2!2379 lt!74522) (_1!2380 lt!74518) lt!74527) lt!75642)))

(assert (= (and d!14932 c!3423) b!48679))

(assert (= (and d!14932 (not c!3423)) b!48680))

(assert (= (and d!14932 c!3422) b!48681))

(assert (= (and d!14932 (not c!3422)) b!48682))

(declare-fun m!75781 () Bool)

(assert (=> b!48682 m!75781))

(declare-fun m!75783 () Bool)

(assert (=> b!48681 m!75783))

(declare-fun m!75785 () Bool)

(assert (=> b!48680 m!75785))

(declare-fun m!75787 () Bool)

(assert (=> b!48680 m!75787))

(assert (=> b!48152 d!14932))

(declare-fun d!14934 () Bool)

(assert (=> d!14934 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519))) lt!74527) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1042 (buf!1394 (_2!2379 lt!74522)))) ((_ sign_extend 32) (currentByte!2905 (_2!2379 lt!74519))) ((_ sign_extend 32) (currentBit!2900 (_2!2379 lt!74519)))) lt!74527))))

(declare-fun bs!3819 () Bool)

(assert (= bs!3819 d!14934))

(declare-fun m!75789 () Bool)

(assert (=> bs!3819 m!75789))

(assert (=> b!48152 d!14934))

(push 1)

(assert (not d!14922))

(assert (not b!48558))

(assert (not b!48555))

(assert (not b!48577))

(assert (not d!14870))

(assert (not b!48608))

(assert (not b!48582))

(assert (not b!48604))

(assert (not b!48667))

(assert (not b!48681))

(assert (not b!48678))

(assert (not b!48662))

(assert (not b!48580))

(assert (not d!14920))

(assert (not b!48576))

(assert (not b!48579))

(assert (not b!48644))

(assert (not d!14906))

(assert (not b!48646))

(assert (not b!48663))

(assert (not b!48605))

(assert (not b!48666))

(assert (not d!14866))

(assert (not b!48610))

(assert (not b!48682))

(assert (not bm!607))

(assert (not d!14898))

(assert (not d!14892))

(assert (not b!48668))

(assert (not d!14878))

(assert (not b!48634))

(assert (not b!48643))

(assert (not b!48607))

(assert (not b!48553))

(assert (not d!14928))

(assert (not d!14868))

(assert (not d!14918))

(assert (not b!48673))

(assert (not b!48652))

(assert (not d!14934))

(assert (not b!48677))

(assert (not b!48672))

(assert (not b!48680))

(assert (not d!14924))

(assert (not d!14926))

(assert (not b!48578))

(assert (not b!48669))

(assert (not b!48600))

(assert (not b!48613))

(assert (not b!48671))

(assert (not d!14852))

(assert (not b!48581))

(assert (not d!14860))

(assert (not b!48583))

(assert (not d!14858))

(assert (not b!48664))

(assert (not b!48674))

(assert (not d!14854))

(assert (not b!48676))

(assert (not d!14872))

(assert (not b!48625))

(assert (not b!48627))

(assert (not b!48626))

(assert (not b!48603))

(assert (not b!48611))

(assert (not b!48602))

(assert (not b!48628))

(assert (not d!14850))

(assert (not d!14888))

(assert (not d!14896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

