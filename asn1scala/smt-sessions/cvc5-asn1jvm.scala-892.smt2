; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25372 () Bool)

(assert start!25372)

(declare-fun b!128080 () Bool)

(declare-fun e!84934 () Bool)

(declare-datatypes ((array!5908 0))(
  ( (array!5909 (arr!3288 (Array (_ BitVec 32) (_ BitVec 8))) (size!2671 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4606 0))(
  ( (BitStream!4607 (buf!3029 array!5908) (currentByte!5781 (_ BitVec 32)) (currentBit!5776 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4606)

(declare-fun array_inv!2460 (array!5908) Bool)

(assert (=> b!128080 (= e!84934 (array_inv!2460 (buf!3029 thiss!1634)))))

(declare-fun e!84931 () Bool)

(declare-datatypes ((tuple2!10786 0))(
  ( (tuple2!10787 (_1!5690 BitStream!4606) (_2!5690 BitStream!4606)) )
))
(declare-fun lt!199043 () tuple2!10786)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!128081 () Bool)

(declare-datatypes ((tuple2!10788 0))(
  ( (tuple2!10789 (_1!5691 BitStream!4606) (_2!5691 (_ BitVec 8))) )
))
(declare-fun lt!199041 () tuple2!10788)

(declare-fun arr!237 () array!5908)

(assert (=> b!128081 (= e!84931 (and (= (_2!5691 lt!199041) (select (arr!3288 arr!237) from!447)) (= (_1!5691 lt!199041) (_2!5690 lt!199043))))))

(declare-fun readBytePure!0 (BitStream!4606) tuple2!10788)

(assert (=> b!128081 (= lt!199041 (readBytePure!0 (_1!5690 lt!199043)))))

(declare-datatypes ((Unit!7944 0))(
  ( (Unit!7945) )
))
(declare-datatypes ((tuple2!10790 0))(
  ( (tuple2!10791 (_1!5692 Unit!7944) (_2!5692 BitStream!4606)) )
))
(declare-fun lt!199042 () tuple2!10790)

(declare-fun reader!0 (BitStream!4606 BitStream!4606) tuple2!10786)

(assert (=> b!128081 (= lt!199043 (reader!0 thiss!1634 (_2!5692 lt!199042)))))

(declare-fun b!128082 () Bool)

(declare-fun res!105983 () Bool)

(declare-fun e!84932 () Bool)

(assert (=> b!128082 (=> (not res!105983) (not e!84932))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128082 (= res!105983 (bvslt from!447 to!404))))

(declare-fun b!128083 () Bool)

(declare-fun res!105988 () Bool)

(assert (=> b!128083 (=> (not res!105988) (not e!84932))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128083 (= res!105988 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2671 (buf!3029 thiss!1634))) ((_ sign_extend 32) (currentByte!5781 thiss!1634)) ((_ sign_extend 32) (currentBit!5776 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128084 () Bool)

(declare-fun res!105986 () Bool)

(assert (=> b!128084 (=> (not res!105986) (not e!84931))))

(declare-fun isPrefixOf!0 (BitStream!4606 BitStream!4606) Bool)

(assert (=> b!128084 (= res!105986 (isPrefixOf!0 thiss!1634 (_2!5692 lt!199042)))))

(declare-fun b!128085 () Bool)

(declare-fun res!105982 () Bool)

(assert (=> b!128085 (=> (not res!105982) (not e!84931))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128085 (= res!105982 (= (bitIndex!0 (size!2671 (buf!3029 (_2!5692 lt!199042))) (currentByte!5781 (_2!5692 lt!199042)) (currentBit!5776 (_2!5692 lt!199042))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2671 (buf!3029 thiss!1634)) (currentByte!5781 thiss!1634) (currentBit!5776 thiss!1634)))))))

(declare-fun res!105987 () Bool)

(assert (=> start!25372 (=> (not res!105987) (not e!84932))))

(assert (=> start!25372 (= res!105987 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2671 arr!237))))))

(assert (=> start!25372 e!84932))

(assert (=> start!25372 true))

(assert (=> start!25372 (array_inv!2460 arr!237)))

(declare-fun inv!12 (BitStream!4606) Bool)

(assert (=> start!25372 (and (inv!12 thiss!1634) e!84934)))

(declare-fun b!128086 () Bool)

(assert (=> b!128086 (= e!84932 (not (and (bvsle ((_ sign_extend 32) (size!2671 (buf!3029 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5781 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5776 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(assert (=> b!128086 e!84931))

(declare-fun res!105984 () Bool)

(assert (=> b!128086 (=> (not res!105984) (not e!84931))))

(assert (=> b!128086 (= res!105984 (= (size!2671 (buf!3029 thiss!1634)) (size!2671 (buf!3029 (_2!5692 lt!199042)))))))

(declare-fun appendByte!0 (BitStream!4606 (_ BitVec 8)) tuple2!10790)

(assert (=> b!128086 (= lt!199042 (appendByte!0 thiss!1634 (select (arr!3288 arr!237) from!447)))))

(declare-fun b!128087 () Bool)

(declare-fun res!105985 () Bool)

(assert (=> b!128087 (=> (not res!105985) (not e!84932))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128087 (= res!105985 (invariant!0 (currentBit!5776 thiss!1634) (currentByte!5781 thiss!1634) (size!2671 (buf!3029 thiss!1634))))))

(assert (= (and start!25372 res!105987) b!128083))

(assert (= (and b!128083 res!105988) b!128082))

(assert (= (and b!128082 res!105983) b!128087))

(assert (= (and b!128087 res!105985) b!128086))

(assert (= (and b!128086 res!105984) b!128085))

(assert (= (and b!128085 res!105982) b!128084))

(assert (= (and b!128084 res!105986) b!128081))

(assert (= start!25372 b!128080))

(declare-fun m!193843 () Bool)

(assert (=> b!128085 m!193843))

(declare-fun m!193845 () Bool)

(assert (=> b!128085 m!193845))

(declare-fun m!193847 () Bool)

(assert (=> b!128087 m!193847))

(declare-fun m!193849 () Bool)

(assert (=> start!25372 m!193849))

(declare-fun m!193851 () Bool)

(assert (=> start!25372 m!193851))

(declare-fun m!193853 () Bool)

(assert (=> b!128083 m!193853))

(declare-fun m!193855 () Bool)

(assert (=> b!128080 m!193855))

(declare-fun m!193857 () Bool)

(assert (=> b!128081 m!193857))

(declare-fun m!193859 () Bool)

(assert (=> b!128081 m!193859))

(declare-fun m!193861 () Bool)

(assert (=> b!128081 m!193861))

(assert (=> b!128086 m!193857))

(assert (=> b!128086 m!193857))

(declare-fun m!193863 () Bool)

(assert (=> b!128086 m!193863))

(declare-fun m!193865 () Bool)

(assert (=> b!128084 m!193865))

(push 1)

(assert (not start!25372))

(assert (not b!128081))

(assert (not b!128080))

(assert (not b!128086))

(assert (not b!128087))

(assert (not b!128084))

(assert (not b!128085))

(assert (not b!128083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

